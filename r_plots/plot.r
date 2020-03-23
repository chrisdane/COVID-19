# r

rm(list=ls()); graphics.off()

## which country
countries <- c("Belgium", "Denmark", "Italy", "Germany", "United Kingdom", "US", "Netherlands", "France", "Canada", "China", "Russia", "Switzerland", "Iran", "Austria", "Sweden", "Japan")
#countries <- "Canada"
#countries <- "Germany"
#countries <- "Netherlands"
#countries <- "US"
#countries <- "Italy"

# plot specs
png_specs <- list(width=1500, height=833, res=157)
log <- "y" # "", "y"
yat_log_must_include <- c(0:10, seq(20, 100, b=10), seq(200, 1000, b=100), 
                          seq(2000, 10000, b=1000), seq(20000, 100000, b=10000))
nplots_per_country <- 4

# linear model specs
lm_obs_col <- "blue"
lm_predict_ntime <- 14
lm_predict_interval <- "day"
lm_predict_col <- "red"
# for underlined text
#library(arghqtl) # https://rdrr.io/github/ellisztamas/arghqtl/man/underlined.html

# paths
fconfirmed <- "../csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv"
fdeaths <- "../csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv"
#fconfirmed <- "../csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Confirmed.csv"
#fdeaths <- "../csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Deaths.csv"
#frecovered <- "../csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Recovered.csv"
report_path <- "../csse_covid_19_data/csse_covid_19_daily_reports"
        
message("\nread time series ...")
ts_confirmed <- read.csv(fconfirmed, header=T, stringsAsFactors=F, na.strings="")
ts_deaths <- read.csv(fdeaths, header=T, stringsAsFactors=F, na.strings="")
#ts_recovered <- read.csv(frecovered, header=T, stringsAsFactors=F, na.strings="")
ts_dates <- colnames(ts_confirmed)
ts_data_col_inds <- which(substr(ts_dates, 1, 1) == "X") # stupid
ts_dates <- ts_dates[ts_data_col_inds] # X1.22.20 = January 22, 2020
ts_dates <- substr(ts_dates, 2, nchar(ts_dates))
ts_dates <- as.Date(ts_dates, format="%m.%d.%y")
ts_dt <- diff(ts_dates)
ts_dt_unit <- attributes(ts_dt)$units
ts_dt <- unique(ts_dt)
if (length(ts_dt) != 1) stop("ts_dt not constant = ", paste(ts_dt, collapse=","))
if (ts_dt_unit == "days") ts_dt <- 86400 # days --> seconds
ts_countries <- sort(unique(ts_deaths$Country.Region))

## read time series and reports
ts_all <- report_all <- responses_all <- lm_list <- vector("list", l=length(countries))
report_countries <- plotname_all <- list()
countries <- sort(unique(countries))
for (ci in seq_along(countries)) {

    country <- countries[ci]
    country_fname <- gsub(" ", "_", country)

    message("\n***********************\ncountry ", ci, "/", 
            length(countries), ": \"", country, 
            "\" ...\n****************************")

    country_ts_ind <- which(ts_confirmed$Country.Region == country)
    if (length(country_ts_ind) == 0) {
        warning("could not find country ", ci, " \"", country, "\"")
        ts <- NULL
    } else {
        if (length(country_ts_ind) > 1) {
            message("\nfound ", length(country_ts_ind), " country ", ci, " \"", country, 
                    "\" provinces: \"", 
                    paste(ts_confirmed$Province.State[country_ts_ind], collapse="\", \""), "\"\n",
                    "--> sum all of them ...\n   ")
        }
        
        ts <- vector("list")
        ts$time <- as.POSIXlt(ts_dates)
        for (provincei in seq_along(country_ts_ind)) {
            #message("\"", ts_confirmed$Province.State[country_ts_ind][provincei], "\" ", appendLF=F)
            tmp1 <- unlist(ts_confirmed[country_ts_ind[provincei],ts_data_col_inds])
            attr(tmp1, "names") <- NULL
            tmp2 <- unlist(ts_deaths[country_ts_ind[provincei],ts_data_col_inds])
            attr(tmp2, "names") <- NULL
            #tmp3 <- unlist(ts_recovered[country_ts_ind[provincei],ts_data_col_inds])
            #attr(tmp3, "names") <- NULL
            if (provincei == 1) {
                ts$confirmed <- tmp1
                ts$deaths <- tmp2
                #ts$recovered <- tmp3
            } else {
                ts$confirmed <- ts$confirmed + tmp1
                ts$deaths <- ts$deaths + tmp2
                #ts$recovered <- ts$recovered + tmp3
            }
            #cat(capture.output(str(ts$confirmed)), sep="\n")
            #if (provincei == length(country_ts_ind)) message()
        }
        message("\n", country, " ts:")
        cat(capture.output(str(ts)), sep="\n")
        ts_all[[ci]] <- ts
        names(ts_all)[ci] <- country_fname
    } # if country was found in time series data


    ## read daily reports
    message("\nread reports ...")
    report_files <- list.files(report_path, pattern=glob2rx("*.csv"))
    report_dates <- rep(NA, t=length(report_files)) 
    confirmed <- deaths <- rep(0, t=length(report_files))
    #recovered 
    report_countries_tmp <- list()
    for (fi in seq_along(report_files)) {
        
        message("report ", fi, "/", length(report_files), ": \"", report_files[fi], "\" ...")

        freport <- paste0(report_path, "/", report_files[fi]) # 01-22-2020.csv
        tmp <- read.csv(freport, header=T, stringsAsFactors=F, na.strings="")
        report_countries_tmp[[fi]] <- unique(tmp$Country.Region)
        country_report_ind <- which(tmp$Country.Region == country)
        if (length(country_report_ind) == 0) {
            message("could not find country ", ci, " \"", country, "\" in report \"", report_files[fi], "\"")
        } else {
            if (length(country_report_ind) > 1) {
                message("\nfound ", length(country_report_ind), " country ", ci, " \"", country, 
                        "\" provinces: \"", 
                        paste(tmp$Province.State[country_report_ind], collapse="\", \""), "\"\n",
                        "--> sum all of them ...\n   ")
            }
            report_dates[fi] <- tools::file_path_sans_ext(report_files[fi])
            for (provincei in seq_along(country_report_ind)) {
                #report_dates[fi] <- tmp[country_report_ind,"Last.Update"] # 2020-03-17T11:53:10
                # --> formats of "Last.Update" column not always the same
                # --> use date from file
                confi <- tmp[country_report_ind[provincei],"Confirmed"]
                deathi <- tmp[country_report_ind[provincei],"Deaths"]
                #recovi <- tmp[country_report_ind[provincei],"Recovered"]
                if (provincei == 1) {
                    confirmed[fi] <- confi
                    deaths[fi] <- deathi
                    #recovered[fi] <- recovi
                } else {
                    confirmed[fi] <- confirmed[fi] + confi
                    deaths[fi] <- deaths[fi] + deathi
                    #recovered[fi] <- recovered[fi] + recovi
                }
            } # provincei
        }
    } # for fi report_files
    if (!all(is.na(report_dates))) {
        report_dates <- as.Date(report_dates, format="%m-%d-%y")
        report_dates <- as.POSIXlt(report_dates)
        report <- list(time=report_dates, confirmed=confirmed, 
                       deaths=deaths#, recovered=recovered
                      )
        message("\n", country, " report:")
        cat(capture.output(str(report)), sep="\n")
        report_all[[ci]] <- report
        names(report_all)[ci] <- country_fname
        report_countries[[ci]] <- unique(unlist(lapply(report_countries_tmp, unique)))
    } else {
        warning("could not find a single report file for country ", ci, " \"", country, "\"")
    }


    ## plot ts
    if (!is.null(ts)) { # if time series reading was successfull

        # default: exponential model over the last 10 days
        lm_to_ind <- length(ts_dates)
        lm_to <- ts_dates[lm_to_ind]
        lm_from <- lm_to - 10
        lm_from_ind <- which.min(abs(ts_dates - lm_from))[1]
        lm_from <- ts_dates[lm_from_ind]
        lm_dt <- difftime(lm_to, lm_from)
        if (attributes(lm_dt)$units != "days") {
            stop("\nlm_dt = ", lm_dt, " not implemented")
        } else {
            message("\ncalc exponential model from ", lm_from, " to ", lm_to, 
                    " --> dt = ", lm_dt, " ", attributes(lm_dt)$units, " ...")
        }
        lm_list[[ci]] <- list(from=lm_from, to=lm_to, 
                              lm_time_range=lm_dt, 
                              lm_time_range_unit=attributes(lm_dt)$units)
        names(lm_list)[ci] <- country_fname
            
        # mark national/domestic responses
        responses <- list() # default: nothing
        if (country == "Italy") {
            responses[[1]] <- list(date=as.POSIXlt("2020-03-04", tz="UTC"),
                                   what="",
                                   ref="https://www.theguardian.com/world/2020/mar/04/italy-orders-closure-of-schools-and-universities-due-to-coronavirus")
            responses[[2]] <- list(date=as.POSIXlt("2020-03-09", tz="UTC"),
                                   what="",
                                   ref="https://www.bbc.co.uk/sport/51808683")
            responses[[3]] <- list(date=as.POSIXlt("2020-03-11", tz="UTC"),
                                   what="",
                                   ref="https://www.washingtonpost.com/world/europe/merkel-coronavirus-germany/2020/03/11/e276252a-6399-11ea-8a8e-5c5336b32760_story.html")
        }
        
        plotname_tmp <- rep(NA, t=nplots_per_country)
        for (ploti in seq_len(nplots_per_country)) {

            if (ploti == 1) { # this order will appear in the README.md
                ylab <- "cumulative deaths"
                x <- ts$time
                y <- ts$deaths
                if (F) {
                    if (country == "France") lm_from <- as.POSIXlt("2020-03-01", tz="UTC")
                    if (country == "Japan") lm_from <- as.POSIXlt("2020-02-27", tz="UTC") 
                    if (country == "US") lm_from <- as.POSIXlt("2020-03-02", tz="UTC") 
                    if (country == "China") lm_to <- as.POSIXlt("2020-02-04", tz="UTC")
                }
            } else if (ploti == 2) {
                ylab <- "daily deaths"
                x <- ts$time[2:length(ts$time)]
                y <- diff(ts$deaths)
                if (any(y < 0, na.rm=T)) { # only explanation: someone cured AND no new reports compared to day before
                    y[which(y < 0)] <- 0
                }
                if (F) {
                    if (country == "China") lm_to <- as.POSIXlt("2020-02-04", tz="UTC") 
                    if (country == "France") lm_from <- as.POSIXlt("2020-03-01", tz="UTC")
                    if (country == "Japan") lm_from <- as.POSIXlt("2020-02-27", tz="UTC") 
                    if (country == "US") lm_from <- as.POSIXlt("2020-03-02", tz="UTC")
                }
            } else if (ploti == 3) {
                ylab <- "cumulative confirmed"
                x <- ts$time
                y <- ts$confirmed
                if (F) {
                    if (country == "Belgium") lm_from <- as.POSIXlt("2020-03-02", tz="UTC") 
                    if (country == "China") lm_to <- as.POSIXlt("2020-02-04", tz="UTC") 
                    if (country == "Canada") lm_from <- as.POSIXlt("2020-02-27", tz="UTC")
                    if (country == "France") lm_from <- as.POSIXlt("2020-02-25", tz="UTC")
                    if (country == "Germany") lm_from <- as.POSIXlt("2020-02-25", tz="UTC")
                    if (country == "Italy") lm_from <- as.POSIXlt("2020-02-21", tz="UTC")
                    if (country == "Netherlands") lm_from <- as.POSIXlt("2020-02-29", tz="UTC")
                    if (country == "Russia") lm_from <- as.POSIXlt("2020-03-02", tz="UTC") 
                    if (country == "Sweden") lm_from <- as.POSIXlt("2020-02-27", tz="UTC") 
                    if (country == "US") lm_from <- as.POSIXlt("2020-02-26", tz="UTC") 
                    if (country == "United Kingdom") lm_from <- as.POSIXlt("2020-02-24", tz="UTC")
                }
            } else if (ploti == 4) {
                ylab <- "daily confirmed"
                x <- ts$time[2:length(ts$time)]
                y <- diff(ts$confirmed)
                if (any(y < 0, na.rm=T)) { # only explanation: someone cured AND no new reports compared to day before
                    y[which(y < 0)] <- 0
                }
                if (F) {
                    if (country == "Belgium") lm_from <- as.POSIXlt("2020-03-02", tz="UTC") 
                    if (country == "China") lm_to <- as.POSIXlt("2020-02-04", tz="UTC") 
                    if (country == "Canada") lm_from <- as.POSIXlt("2020-02-27", tz="UTC")
                    if (country == "France") lm_from <- as.POSIXlt("2020-02-25", tz="UTC")
                    if (country == "Germany") lm_from <- as.POSIXlt("2020-02-25", tz="UTC")
                    if (country == "Italy") lm_from <- as.POSIXlt("2020-02-21", tz="UTC")
                    if (country == "Netherlands") lm_from <- as.POSIXlt("2020-02-29", tz="UTC")
                    if (country == "Russia") lm_from <- as.POSIXlt("2020-03-02", tz="UTC") 
                    if (country == "Sweden") lm_from <- as.POSIXlt("2020-02-27", tz="UTC") 
                    if (country == "US") lm_from <- as.POSIXlt("2020-02-26", tz="UTC") 
                    if (country == "United Kingdom") lm_from <- as.POSIXlt("2020-02-24", tz="UTC")
                }
            } # which ploti 
           
            message("\nplot ", ploti, " of country ", ci, " \"", country, 
                    "\" plot ts data: ", ylab, " ...") 
            
            # exponential model of obs
            lm_inds <- lm_from_ind:lm_to_ind
            #lm_inds <- seq_along(x)
            x_lm <- as.numeric(x)[lm_inds] # posix cannot be input for lm
            y_lm <- y[lm_inds] # numeric 0 cannot be input for lm
            x_lm[which(y_lm == 0)] <- NA 
            y_lm[which(y_lm == 0)] <- NA

            message("\ncalc lm from ", x[lm_from_ind], " to ", x[lm_to_ind], " ...")
            if (T) { # var = exp(time) <=> log(var) = time
                lm_log <- lm(log(y_lm) ~ x_lm) # if data is exponential: take log of data and fit against linear time
                x_lm_log_obs <- lm_log$model[,2]
                y_lm_log_obs <- exp(lm_log$fitted.values)
            } else if (F) { # exp(var) = exp(time) <=> log(var) = log(time)
                lm_log <- lm(log(y_lm) ~ log(x_lm))
                x_lm_log_obs <- exp(lm_log$model[,2])
                y_lm_log_obs <- exp(lm_log$fitted.values)
            }
            #nls_log <- nls(log(y_lm) ~ x_lm)

            # exponential model summary
            lm_log_summary <- summary(lm_log)
            message("\nlm_log_summary$coefficients:")
            print(lm_log_summary$coefficients)
            if (any(is.na(lm_log_summary$coefficients))) { # exponential model yield bad results
                message("\n--> model is bad")
                add_lm_log_to_plot <- F
                lm_list[[ci]]$cumulative_deaths_doubling_time <- NA
            } else {
                message("\n--> model is ok")
                add_lm_log_to_plot <- T
                lm_log_estimate <- lm_log_summary$coefficients[2,1]*ts_dt
                lm_log_uncert <- lm_log_summary$coefficients[2,2]*ts_dt
                # https://github.com/valeriupredoi/COVID-19_LINEAR/issues/6
                lm_log_doubling_time <- log(2)/lm_log_estimate
                rsq <- lm_log_summary$r.squared
                pvalue <- lm_log_summary$coefficients[2,4]
                message("exponential model estimate = ", lm_log_estimate, " +- ", lm_log_uncert, " ", 
                        ts_dt_unit, "^-1; doubling time = ", lm_log_doubling_time, 
                        "; r^2 = ", rsq, "; p = ", pvalue) 
                if (ylab == "cumulative deaths") {
                    lm_list[[ci]]$cumulative_deaths_estimate <- lm_log_estimate
                    lm_list[[ci]]$cumulative_deaths_uncertainty <- lm_log_uncert
                    lm_list[[ci]]$cumulative_deaths_rsq <- rsq
                    lm_list[[ci]]$cumulative_deaths_p <- pvalue
                    lm_list[[ci]]$cumulative_deaths_doubling_time <- lm_log_doubling_time
                    lm_list[[ci]]$cumulative_deaths_doubling_time_unit <- ts_dt_unit
                }
            }

            # exponential prediction
            if (add_lm_log_to_plot) {
                x_lm_log_future <- seq.POSIXt(x[length(x)], l=lm_predict_ntime, b=lm_predict_interval)
                x_lm_log_future <- x_lm_log_future[-1] # remove last day of obs
                x_lm_log_future <- as.POSIXlt(x_lm_log_future)
                x_lm_log_future_lm <- as.numeric(x_lm_log_future) # input for predict 
                x_lm_log_future_lm <- data.frame(x_lm=x_lm_log_future_lm) 
                lm_log_future <- predict(lm_log, newdata=x_lm_log_future_lm, interval="prediction")
                y_lm_log_future <- exp(lm_log_future)
            }

            # prepare plot
            if (add_lm_log_to_plot) {
                ts_tlimlt <- range(x, x_lm_log_future)
            } else {
                ts_tlimlt <- range(x)
            }
            ts_tlimn <- as.numeric(ts_tlimlt)
            ts_tlablt <- as.POSIXlt(pretty(ts_tlimlt, n=length(x)))
            if (any(ts_tlablt < ts_tlimlt[1])) {
                ts_tlablt <- ts_tlablt[-which(ts_tlablt < ts_tlimlt[1])]
            }
            if (any(ts_tlablt > ts_tlimlt[2])) {
                ts_tlablt <- ts_tlablt[-which(ts_tlablt > ts_tlimlt[2])]
            }
            ts_tatn <- as.numeric(ts_tlablt)
            ts_tlablt <- paste0(month.abb[ts_tlablt$mon+1], " ", ts_tlablt$mday)
            if (log == "y") y[which(y == 0)] <- NA
            if (add_lm_log_to_plot) {
                ylim <- range(y, y_lm_log_obs, y_lm_log_future, na.rm=T)
            } else {
                ylim <- range(y, na.rm=T)
            }
            ylim[2] <- ylim[2] + 0.05*diff(ylim)
            yat <- pretty(ylim, n=30)
            if (log == "y") {
                yat <- sort(unique(c(yat, yat_log_must_include)))
            }

            # plot
            plotpath <- paste0("plots/", country_fname)
            dir.create(plotpath, recursive=T, showWarnings=F)
            plotname <- paste0(plotpath, "/", country_fname, "_", gsub(" ", "_", ylab), 
                               ifelse(log != "", paste0("_log", log), ""), 
                               ".png")
            plotname_tmp[ploti] <- plotname
            message("\nplot ", plotname)
            png(plotname, width=png_specs$width, height=png_specs$height, res=png_specs$res)
            par(mar=c(5.1, 6.1, 4.1, 6.1) + 0.1)
            plot(x, y, xaxt="n", yaxt="n", t="n",
                 log=log,
                 xlab="date", ylab=NA,
                 xlim=ts_tlimn, ylim=ylim)
            message("ylim = ", appendLF=F)
            dput(ylim)
            message("par(\"usr\") = ", appendLF=F)
            dput(par("usr"))
            axis(1, at=ts_tatn, labels=rep("", t=length(ts_tatn)))
            text(x=ts_tatn, y=grconvertY(-0.08, from="npc"), labels=ts_tlablt, 
                 xpd=T, srt=90, cex=0.5)
            axis(2, at=yat, las=2, cex.axis=0.5)
            mtext(side=2, text=ylab, line=3)
            axis(4, at=yat, las=2, cex.axis=0.5)
            mtext(side=4, text=ylab, line=3)

            # add grid
            abline(h=yat, col="gray", lwd=0.5)
            abline(v=ts_tatn, col="gray", lwd=0.5)
           
            # add title
            title(paste0(ploti, "/", nplots_per_country, ": ", ylab, " in ", 
                         country, " at ", max(x)), cex.main=0.85)

            # mark national/domestic responses if any
            if (length(responses) > 0) {

                for (ri in seq_along(responses)) {
                    date_ind <- which.min(abs(responses[[ri]]$date - x))
                    abline(v=as.numeric(x[date_ind]), lwd=0.5)
                    # mark response date in underlined format that it looks like a hyperref
                    points(x[date_ind], y=grconvertY(0.04, from="npc"), pch=15, col="white", cex=2) # box below number
                    text(x=x[date_ind], 
                         #y=grconvertY(0.75, from="npc"), # in middle of plot, independent of linear/logarithmic y-axis 
                         #y=1, # at bottom (count = 0)
                         y=grconvertY(0.04, from="npc"), # at bottom of plot, independent of linear/logarithmic y-axis 
                         labels=substitute(paste(underline(label)), list(label=ri)),
                         col="blue", cex=0.75)
                }
                
                # for readme:
                responses_all[[ci]] <- responses

            } # if (length(responses) > 0)

            # add obs
            points(x, y, t="o")
            
            if (F) { # add day of month of obs
                text(x, y, labels=paste0("   ", x$mday), cex=0.5, adj=0)

            } else if (T) { # add value of obs
                text(x, y, labels=paste0("   ", y), cex=0.5, srt=90, adj=0)
            }

            # add exponential model of obs
            if (add_lm_log_to_plot) {
                points(x_lm_log_obs, y_lm_log_obs, t="o", col=lm_obs_col)

                # add uncertainty of exponential model of future
                polygon(c(x_lm_log_future, rev(x_lm_log_future)),
                        c(y_lm_log_future[,"lwr"], rev(y_lm_log_future[,"upr"])),
                        col=rgb(t(col2rgb(lm_predict_col)/255), alpha=0.2), border=NA)

                # add exponential model of future
                points(x_lm_log_future, y_lm_log_future[,"fit"], t="o", col=lm_predict_col)

                if (F) { # add day of month of prediction
                    text(x_lm_log_future, y_lm_log_future[,"fit"], 
                         labels=paste0("   ", x_lm_log_future$mday), 
                         cex=0.5, adj=0)
                } else if (T) { # add value of prediction
                    text(x_lm_log_future, y_lm_log_future[,"fit"], 
                         labels=paste0("   ", round(y_lm_log_future[,"fit"])), 
                         cex=0.5, srt=90, adj=0)
                }
            }

            # legend
            le_pos <- "topleft"
            if (country == "China") le_pos <- "bottomleft"
            le_text <- "obs"
            le_col <- "black"
            if (add_lm_log_to_plot) {
                le_text <- c(le_text,
                             eval(substitute(expression(paste("exponential model = exp[ (", estimate, "" %+-% "", uncert, 
                                                              ") ", ts_dt_unit, ""^paste(-1), " " %*% " ", ts_dt_unit, 
                                                              " ]; r = ", rsq, "; p ", p)),
                                             list(estimate=round(lm_log_estimate, 3), uncert=round(lm_log_uncert, 3),
                                                  ts_dt_unit=ts_dt_unit, rsq=round(sqrt(rsq), 2),
                                                  p=ifelse(pvalue < 1e-3, "< 1e-3", paste0("= ", round(pvalue, 3)))))),
                             eval(substitute(expression(paste("exponential prediction (doubling time = log(2)[", estimate, " ", 
                                                              ts_dt_unit, ""^paste(-1), "]"^paste(-1), " = ", doubling_time, " ",
                                                              ts_dt_unit, ")")),
                                             list(estimate=round(lm_log_estimate, 3), ts_dt_unit=ts_dt_unit, 
                                                  doubling_time=round(lm_log_doubling_time, 2)))))
                le_col <- c(le_col, lm_obs_col, lm_predict_col)
            }
            legend("topleft", legend=le_text,
                   col=le_col,
                   lty=1, lwd=1, pch=1, 
                   bty="n", x.intersp=0.2)

            # save plot
            dev.off()

        } # ploti
  
        plotname_all[[ci]] <- plotname_tmp
        names(plotname_all)[ci] <- country
        
    } else {

        warning("reading country ", ci, " \"", country, "\" data was not successfull")

    } # if !is.null(ts)
   
} # for ci countries

# update readme
message("\nupdate readme ...")
upstream_hash <- system("git rev-parse upstream/master", intern=T)
upstream_datetime <- file.info("../.git/refs/remotes/upstream")$mtime
upstream_datetime <- as.POSIXlt(upstream_datetime)
tz <- attributes(upstream_datetime)$tzone
if (any(tz == "")) tz <- tz[-which(tz == "")]
readme <- c("# International Covid-19 death predictions based on CSSEGISandData/COVID-19", "",
            "  * upstream repo: https://github.com/CSSEGISandData/COVID-19  ",
            paste0("  * time of last pull of upstream repo: **", upstream_datetime, " ", tz[1], 
                   "** (timestamp of file `.git/refs/remotes/upstream`)  "), 
            paste0("  * hash of last pulled commit of upstream repo: `", upstream_hash, 
                   "` (`git rev-parse upstream/master`)  "),
            paste0("  * last date of `COVID-19/csse_covid_19_data/time_series_covid19_*_global.csv` data: **", 
                   max(ts_dates), "**"),
            "", 
            "# Select country", "")

# toc: available countries ordered by their deaths doubling 
#      time (shortest first) or, if not available, in alphabetic order
lm_time_death_double <- sapply(lm_list, "[[", "cumulative_deaths_doubling_time")
if (!all(is.na(lm_time_death_double))) {
    notnainds <- which(!is.na(lm_time_death_double))
    if (any(is.na(lm_time_death_double))) {
        nainds <- which(is.na(lm_time_death_double))
        lm_time_death_double_na <- lm_time_death_double[nainds]
    } else {
        nainds <- NULL
    }
    lm_time_death_double_sort_inds <- sort(lm_time_death_double[notnainds], index.return=T)$ix
    lm_time_death_double <- lm_time_death_double[notnainds][lm_time_death_double_sort_inds]
    allinds <- notnainds[lm_time_death_double_sort_inds]
    if (!is.null(nainds)) {
        lm_time_death_double <- c(lm_time_death_double, lm_time_death_double_na)
        allinds <- c(allinds, nainds)
    }
    
    # Markdown | Less | Pretty
    #--- | --- | --- # <-- miniumum 3 dashes
    #*Still* | `renders` | **nicely**
    #1 | 2 | 3   
    readme <- c(readme,
                paste0("ordererd by time when cumulative number of deaths doubles (increasing)", ""))
    toc <- "country | cumulative number of deaths doubles in | period of a estimation | rsq | p" # 5 columns
    toc <- c(toc, "--- | --- | --- | --- | ---")
    cnt <- length(toc)
    for (ci in seq_along(plotname_all)) {
        tmp <- paste0("[", names(plotname_all)[allinds[ci]], "](#", 
                      gsub(" ", "-", names(plotname_all)[allinds[ci]]), ") | ")
        if (!is.na(lm_time_death_double[ci])) {
            tmp <- paste0(tmp, round(lm_time_death_double[ci], 2), " ", 
                          lm_list[[allinds[ci]]]$cumulative_deaths_doubling_time_unit, " | ",
                          lm_list[[allinds[ci]]]$from, " to ", lm_list[[allinds[ci]]]$to, " (",
                          as.numeric(lm_list[[allinds[ci]]]$lm_time_range), " ", 
                          lm_list[[allinds[ci]]]$lm_time_range_unit, ") | ",
                          round(lm_list[[allinds[ci]]]$cumulative_deaths_rsq), " | ", 
                          ifelse(lm_list[[allinds[ci]]]$cumulative_deaths_p < 1e-3, 
                                 "< 1e-3",
                                 round(lm_list[[allinds[ci]]]$p, 3)))
        } else {
            tmp <- paste0(tmp, lm_time_death_double[ci], " | ", lm_time_death_double[ci], " | ",
                          lm_time_death_double[ci], " | ", lm_time_death_double[ci])
        }
        cnt <- cnt + 1
        toc[cnt] <- tmp 
    } # for ci 

} else { # no lm available
    
    readme <- c(readme,
                paste0("in alphabetical order (days when number of cumulative deaths doubles based on ",
                       "exponential model; blue line in first of the ", nplots_per_country, 
                       " plots of each respective country)")) 
    
    toc <- c() # toc
    for (ci in seq_along(plotname_all)) {

        toc <- paste0(toc, 
                      paste0("[", names(plotname_all)[ci], "](#", 
                             gsub(" ", "-", names(plotname_all)[ci]), ") ("))
        if (!is.na(lm_list[[ci]]$cumulative_deaths_doubling_time)) {
            toc <- paste0(toc, 
                          round(lm_list[[ci]]$cumulative_deaths_doubling_time, 2), " ", 
                          lm_list[[ci]]$cumulative_deaths_doubling_time_unit)
        } else {
            toc <- paste0(toc, "NA")
        }
        toc <- paste0(toc, ") ")
    }

} # if lm is available or not
readme <- c(readme, toc, "")

# content
top_link <- "#Select-country"
for (ci in seq_along(plotname_all)) {

    readme <- c(readme, paste0("# ", names(plotname_all)[ci])) # title for link
    readme <- c(readme, paste0("[top](", top_link, ")")) # link to top
    readme <- c(readme, "")
    for (fi in seq_along(plotname_all[[ci]])) {
        
        # add national/domestic response refs if any
        if (!is.null(responses_all[[ci]]) && fi == 1) { 
            readme <- c(readme, 
                        paste0("national response", 
                               ifelse(length(responses_all[[ci]]) > 1, "s", ""), ":"))
            for (ri in seq_along(responses_all[[ci]])) {
                readme <- c(readme,
                            paste0(ri, ". ", 
                                   responses_all[[ci]][[ri]]$date, ": ",
                                   responses_all[[ci]][[ri]]$ref))
            }
        }
        # add plot
        readme <- c(readme,
                    paste0("<img align=\"center\" width=\"1000\" src=\"", plotname_all[[ci]][fi], "\">"), 
                    "<br>")
    } # fi plot type
    readme <- c(readme, "<br>", "")

} # for ci plotname_all
write(readme, file="README.md")

message("\nts data available of ", length(ts_countries), " countries:\n",
        "\"", paste(ts_countries, collapse="\", \""), "\"")

report_countries <- sort(unique(unlist(report_countries)))
message("\nreports available of ", length(report_countries), " countries:\n",
        "\"", paste(report_countries, collapse="\", \""), "\"")

message("\nfinished\n")

