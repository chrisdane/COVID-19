# r

rm(list=ls()); graphics.off()

## which country
countries <- c("Belgium", "Denmark", "Italy", "Germany", "United Kingdom", "US", "Netherlands", "France", "Canada", "China", "Russia", "Switzerland", "Iran", "Austria", "Sweden", "Japan", "Spain", "Australia", "Norway", "Poland", "Portugal", "Romania", "Nepal", "Turkey", "Hungary")
#countries <- "Canada"
#countries <- "Germany"
#countries <- "Netherlands"
#countries <- "US"
#countries <- "Italy"
#countries <- "Nepal"
#countries <- "Russia"
#countries <- "Romania"
#countries <- c("Germany", "Romania")
#countries <- c("Germany", "Romania", "Russia")
#countries <- "Japan"
#countries <- c("Germany", "United Kingdom")
#countries <- c("Germany", "Nepal", "United Kingdom")

# plot specs
jhu_text <- "JHU" # johns hopkins university
jhu_col <- "black"
jhu_lty <- 1
jhu_lwd <- 1
jhu_pch <- 1
png_specs <- list(width=1500, height=833, res=157)
log <- "y" # "", "y"
yat_log_must_include <- c(0:10, seq(20, 100, b=10), seq(200, 1000, b=100), 
                          seq(2000, 10000, b=1000), seq(20000, 100000, b=10000))
nplots_per_country <- 4

# linear model specs
lm_obs_col <- "blue"
lm_obs_lty <- 1
lm_obs_lwd <- 1
lm_obs_pch <- 1
lm_obs_estimate_ndays <- 10 # days
lm_predict_ntime <- 14 # days
lm_predict_interval <- "day"
lm_predict_col <- "red"
lm_predict_lty <- 1
lm_predict_lwd <- 1
lm_predict_pch <- 1
lm_doubling_time_col <- lm_obs_col # rgb(t(col2rgb(lm_obs_col)/255), alpha=0.2)
lm_doubling_time_lty <- NA
lm_doubling_time_lwd <- NA
lm_doubling_time_pch <- 4

# for underlined text
#library(arghqtl) # https://rdrr.io/github/ellisztamas/arghqtl/man/underlined.html

# paths
fconfirmed <- "../csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv"
fdeaths <- "../csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv"
#fconfirmed <- "../csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Confirmed.csv"
#fdeaths <- "../csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Deaths.csv"
#frecovered <- "../csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Recovered.csv"
report_path <- "../csse_covid_19_data/csse_covid_19_daily_reports"

#####################################

message("\nread rki ...")
frki <- "rki.txt"
rki <- read.table(frki, header=T, skip=1, stringsAsFactors=F)
rki$date <- as.POSIXlt(rki$date, tz="UTC")
rki_text <- "RKI"
rki_col <- "darkgreen"
rki_lty <- 1
rki_lwd <- 1
rki_pch <- 1

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
ts_all <- vector("list", l=length(countries))
names(ts_all) <- countries
report_all <- responses_all <- lm_list <- ts_all
report_countries <- plotname_all <- list()
countries <- sort(unique(countries))

lm_obs_estimate_ndays <- seq.POSIXt(as.POSIXlt("1-1-1", tz="UTC"), b=paste0(lm_obs_estimate_ndays, " days"), l=2)
lm_obs_estimate_ndays <- difftime(lm_obs_estimate_ndays[2], lm_obs_estimate_ndays[1], units="days")
message("provided lm calculation period: ", lm_obs_estimate_ndays, " ", attributes(lm_obs_estimate_ndays)$units)

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
        ts$time <- as.POSIXlt(ts_dates, tz="UTC")
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
        report_dates <- as.POSIXlt(report_dates, tz="UTC")
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
                if (country == "Germany") {
                    x_rki <- rki$date
                    y_rki <- rki$deaths
                }
            } else if (ploti == 2) {
                ylab <- "daily deaths"
                x <- ts$time[2:length(ts$time)]
                y <- diff(ts$deaths)
                if (log == "y") {
                    if (any(y < 0, na.rm=T)) { # only explanation: someone cured AND no new reports compared to day before
                        y[which(y < 0)] <- 0
                    }
                }
                if (country == "Germany") {
                    x_rki <- rki$date[2:length(rki$date)]
                    y_rki <- diff(rki$deaths)
                }
            } else if (ploti == 3) {
                ylab <- "cumulative confirmed"
                x <- ts$time
                y <- ts$confirmed
                if (country == "Germany") {
                    x_rki <- rki$date
                    y_rki <- rki$confirmed
                }
            } else if (ploti == 4) {
                ylab <- "daily confirmed"
                x <- ts$time[2:length(ts$time)]
                y <- diff(ts$confirmed)
                if (any(y < 0, na.rm=T)) { # only explanation: someone cured AND no new reports compared to day before
                    y[which(y < 0)] <- 0
                }
                if (country == "Germany") {
                    x_rki <- rki$date[2:length(rki$date)]
                    y_rki <- diff(rki$confirmed)
                }
            } # which ploti 
           
            message("\nplot ", ploti, "/", nplots_per_country, " of country ", ci, "/", 
                    length(countries), " \"", country, "\" plot ts data: \"", ylab, "\" ...") 
            
            # prepare time series for exponential model
            add_lm_log_to_plot <- T # default
            x_lm <- as.numeric(x) # posix cannot be input for lm
            y_lm <- y

            # numeric 0 cannot be input for exponential lm
            x_lm_posix <- x
            if (any(y_lm == 0)) {
                x_lm[which(y_lm == 0)] <- NA 
                x_lm_posix[which(y_lm == 0)] <- NA
                y_lm[which(y_lm == 0)] <- NA
            }

            # if all counts equal 0 (here NA) 
            if (all(is.na(y_lm))) add_lm_log_to_plot <- F 
            
            # prepare exponential model over the last 10 days
            if (add_lm_log_to_plot) {
                
                # calc lm for prior periods
                lm_obs_estimate_n_periods <- length(x_lm_posix) - as.integer(lm_obs_estimate_ndays)
                lm_list_ploti <- vector("list", l=lm_obs_estimate_n_periods)
                skip_inds <- c()
                message("find time periods for lm calculation ...")
                for (lm_periodi in seq_len(lm_obs_estimate_n_periods)) {
                    lm_to <- max(x_lm_posix, na.rm=T) - (lm_periodi-1)*86400 # one day less
                    lm_to_ind <- which.min(abs(x_lm_posix - lm_to))
                    lm_from <- seq.POSIXt(lm_to, b=paste0("-", lm_obs_estimate_ndays-1, " days"), l=2)[2]
                    lm_from_ind <- which.min(abs(x_lm_posix - lm_from))
                    lm_from <- as.POSIXct(x_lm_posix[lm_from_ind])
                    names(lm_list_ploti)[lm_periodi] <- paste0(lm_from, "_to_", lm_to)
                    message("lm period ", lm_periodi, "/", lm_obs_estimate_n_periods, 
                            " from ", lm_from, " to ", lm_to)
                    lm_list_ploti[[lm_periodi]]$lm_from_ind <- lm_from_ind 
                    lm_list_ploti[[lm_periodi]]$lm_to_ind <- lm_to_ind
                    lm_list_ploti[[lm_periodi]]$lm_from <- lm_from 
                    lm_list_ploti[[lm_periodi]]$lm_to <- lm_to
                    
                    # check if lm was already calculated for this period before
                    if (lm_periodi > 1) {
                        if (lm_list_ploti[[lm_periodi-1]]$lm_from_ind == lm_from_ind &&
                            lm_list_ploti[[lm_periodi-1]]$lm_to_ind == lm_to_ind) {
                            message("lm period ", lm_periodi, "/", lm_obs_estimate_n_periods, 
                                    " from ", lm_from, " to ", lm_to, 
                                    " was already found in last period. skip.")
                            skip_inds <- c(skip_inds, lm_periodi)
                        }
                    } # if lm_periodi > 1
                } # for lm_periodi

                # throw out lm calculation periods which occur more than once
                if (length(skip_inds) > 0) {
                    message("remove ", length(skip_inds), 
                            " lm calculation periods which occur more than once ...")
                    lm_list_ploti[skip_inds] <- NULL
                }
                if (length(lm_list_ploti) == 0) stop("this should not happen")

                # throw out lm calculation periods of length < `lm_obs_estimate_ndays`
                lm_obs_estimate_n_periods <- length(lm_list_ploti)
                skip_inds <- c()
                message("\ncheck ", lm_obs_estimate_n_periods, " lm calculation period lengths ...")
                for (lm_periodi in seq_len(lm_obs_estimate_n_periods)) {
                    lm_ndays <- difftime(lm_list_ploti[[lm_periodi]]$lm_to, 
                                         lm_list_ploti[[lm_periodi]]$lm_from, units="days") + 1
                    message("lm period ", lm_periodi, "/", lm_obs_estimate_n_periods, " from ", 
                            lm_list_ploti[[lm_periodi]]$lm_from, " to ", lm_list_ploti[[lm_periodi]]$lm_to, 
                            " (", lm_ndays, " ", attributes(lm_ndays)$units, ") ...")
                    if (as.integer(lm_ndays) != as.integer(lm_obs_estimate_ndays)) { # both are in days here
                        message("lm_ndays = ", lm_ndays, " ", attributes(lm_ndays)$units, 
                                " != provided `lm_obs_estimate_ndays` = ", as.integer(lm_obs_estimate_ndays), 
                                ". skip this period")
                        skip_inds <- c(skip_inds, lm_periodi)
                    } else {
                        lm_list_ploti[[lm_periodi]]$lm_time_range <- as.integer(lm_ndays)
                        lm_list_ploti[[lm_periodi]]$lm_time_range_unit <- attributes(lm_ndays)$units
                    }
                } # lm_periodi

                # throw out lm calculation periods which occur more than once
                if (length(skip_inds) > 0) {
                    message("remove ", length(skip_inds), " lm calculation periods of different length than ", 
                            as.integer(lm_obs_estimate_ndays), " days ...")
                    lm_list_ploti[skip_inds] <- NULL
                }
                if (length(lm_list_ploti) == 0) stop("this should not happen")
               
                if (F) {
                    message("\n**********************\nfor test: use only most recent lm period ...")
                    lm_list_ploti <- lm_list_ploti[1]
                }

                # finally calc lm
                for (lm_periodi in seq_along(lm_list_ploti)) {

                    # expontential model
                    lm_inds <- lm_list_ploti[[lm_periodi]]$lm_from_ind:lm_list_ploti[[lm_periodi]]$lm_to_ind
                    #lm_inds <- seq_along(x)
                    x_lm_periodi <- x_lm[lm_inds] 
                    y_lm_periodi <- y_lm[lm_inds] 
                    message("\n************************************\n",
                            "calc lm ", lm_periodi, "/", length(lm_list_ploti), " from ", 
                            x[min(lm_inds)], " to ", x[max(lm_inds)], " (", 
                            lm_list_ploti[[lm_periodi]]$lm_time_range, " ", 
                            lm_list_ploti[[lm_periodi]]$lm_time_range_unit, ") ...")
                    ## if data is exponential, take log of data and fit against linear predictor (here: time):
                    if (T) { # predictant = exp(predictor) <=> log(predictant) = predictor = time
                        lm_log <- lm(log(y_lm_periodi) ~ x_lm_periodi) 
                        if (lm_periodi == 1) { # for plot
                            x_lm_log_obs <- lm_log$model[,2]
                            y_lm_log_obs <- exp(lm_log$fitted.values)
                        }
                    } else if (F) { # exp(predictant) = exp(predictant) <=> log(predictant) = log(predictor)
                        lm_log <- lm(log(y_lm_periodi) ~ log(x_lm_periodi))
                        if (lm_periodi == 1) { # for plot
                            x_lm_log_obs <- exp(lm_log$model[,2])
                            y_lm_log_obs <- exp(lm_log$fitted.values)
                        }
                    }
                    #nls_log <- nls(log(y_lm_periodi) ~ x_lm_periodi)

                    # exponential model summary
                    lm_log_summary <- summary(lm_log)
                    message("\nlm_log_summary$coefficients:")
                    print(lm_log_summary$coefficients)
                    if (any(is.na(lm_log_summary$coefficients))) { # exponential model yield bad results
                        message("\n--> model is bad")
                        if (lm_periodi == 1) add_lm_log_to_plot <- F # most recent model for plot
                        lm_list_ploti[[lm_periodi]]$doubling_time <- NA
                    } else {
                        message("\n--> model is ok")
                        if (lm_periodi == 1) add_lm_log_to_plot <- T # most recent model for plot
                        lm_log_estimate <- lm_log_summary$coefficients[2,1]*ts_dt
                        lm_log_uncert <- lm_log_summary$coefficients[2,2]*ts_dt
                        # https://github.com/valeriupredoi/COVID-19_LINEAR/issues/6
                        lm_log_doubling_time <- log(2)/lm_log_estimate
                        rsq <- lm_log_summary$r.squared
                        pvalue <- lm_log_summary$coefficients[2,4]
                        message("exponential model estimate = ", lm_log_estimate, " +- ", lm_log_uncert, " ", 
                                ts_dt_unit, "^-1; doubling time = ", lm_log_doubling_time, 
                                "; r^2 = ", rsq, "; p = ", pvalue) 
                        lm_list_ploti[[lm_periodi]]$estimate <- lm_log_estimate
                        lm_list_ploti[[lm_periodi]]$uncertainty <- lm_log_uncert
                        lm_list_ploti[[lm_periodi]]$rsq <- rsq
                        lm_list_ploti[[lm_periodi]]$p <- pvalue
                        lm_list_ploti[[lm_periodi]]$doubling_time <- lm_log_doubling_time
                        lm_list_ploti[[lm_periodi]]$doubling_time_unit <- ts_dt_unit
                    
                        # prediction for plot
                        if (lm_periodi == 1) {
                            message("\ncalc exponential prediction of this first lm period ", 
                                    lm_predict_ntime, " ", lm_predict_interval, " ahead ...")
                            x_lm_log_future <- seq.POSIXt(x[length(x)], l=lm_predict_ntime, b=lm_predict_interval)
                            x_lm_log_future <- x_lm_log_future[-1] # remove last day of obs
                            x_lm_log_future <- as.POSIXlt(x_lm_log_future)
                            x_lm_log_future_lm <- as.numeric(x_lm_log_future) # input for predict 
                            # predictor input for prediction() needs to have the same name as the predictor of the lm model
                            x_lm_log_future_lm <- data.frame(x_lm_periodi=x_lm_log_future_lm) 
                            lm_log_future <- predict(lm_log, newdata=x_lm_log_future_lm, interval="prediction")
                            y_lm_log_future <- exp(lm_log_future)
                        }
                    } # if model is good or bad
                } # for lm_periodi

            } else { # if !add_lm_log_to_plot
                lm_list_ploti <- list(doubling_time=NA)
            } # if add_lm_log_to_plot
            lm_list[[ci]][[ploti]] <- lm_list_ploti
            names(lm_list[[ci]])[ploti] <- ylab

            ## prepare plot
            # xaxis
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
            ts_tlablt <- paste0(month.abb[ts_tlablt$mon+1], " ", sprintf("%02i", ts_tlablt$mday))

            # yaxis
            if (log == "y") y[which(y == 0)] <- NA
            if (all(is.na(y))) {
                if (log == "y") {
                    ylim <- c(1, 2)
                } else {
                    ylim <- c(0, 1)
                }
            } else {
                ylim <- range(y, na.rm=T)
            }
            if (add_lm_log_to_plot) {
                ylim <- range(ylim, y_lm_log_obs, y_lm_log_future, na.rm=T)
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
            #axis(4, at=yat, las=2, cex.axis=0.5)
            #mtext(side=4, text=ylab, line=3)

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

            # add jhu obs
            points(x, y, t="o", col=jhu_col, lty=jhu_lty, lwd=jhu_lwd, pch=jhu_pch)
            if (F) { # add day of month of jhu obs
                text(x, y, labels=paste0("   ", x$mday), col=jhu_col, cex=0.5, adj=0)

            } else if (T) { # add value of jhu obs
                text(x, y, labels=paste0("   ", y), col=jhu_col, cex=0.5, srt=90, adj=0)
            }
            
            # add rki obs
            if (country == "Germany") {
                points(x_rki, y_rki, t="o", col=rki_col, lty=rki_lty, lwd=rki_lwd, pch=rki_pch)
                if (F) { # add day of month of rki obs
                    text(x_rki, y_rki, labels=paste0(x_rki$mday, "   "), col=rki_col, cex=0.5, adj=0)

                } else if (T) { # add value of rki obs
                    text(x_rki, y_rki, labels=paste0(y_rki, "   "), col=rki_col, cex=0.5, srt=90, adj=1)
                }
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

            # right y-axis: evolution of doubling time from exponential model 
            if (add_lm_log_to_plot) {
                doubling_times_x <- sapply(lm_list_ploti, "[[", "lm_to")
                doubling_times_y <- sapply(lm_list_ploti, "[[", "doubling_time") 
                ylab_right <- unlist(sapply(lm_list_ploti, "[[", "doubling_time_unit"))
                if (!(all(ylab_right == "days"))) {
                    message("\nnot all `doubling_time_unit` of lm models are \"days\".",
                            " dont know which unit to use for right y-axis doubling time")
                    add_right_yaxis <- F
                } else {
                    ylab_right <- paste0("doubling time based on the respective\nlast ", as.integer(lm_obs_estimate_ndays), 
                                         " days (in ", ylab_right[1], ")")
                    add_right_yaxis <- T
                    message("add right y-axis to plot ...")
                }
                if (add_right_yaxis) {
                    if (!is.na(any(doubling_times_y == Inf))) {
                        doubling_times_y[doubling_times_y == Inf] <- NA
                    }
                    if (!is.na(any(doubling_times_y == -Inf))) {
                        doubling_times_y[doubling_times_y == -Inf] <- NA
                    }
                    ylim_right <- range(doubling_times_y, na.rm=T)
                    yat_right <- pretty(ylim_right, n=10)
                    par(new=T)
                    plot(x, rep(1, t=length(x)), t="n",
                         xlim=ts_tlimn, ylim=ylim_right,
                         xlab=NA, ylab=NA, axes=F)
                    axis(4, at=yat_right, las=2, cex.axis=0.75)
                    mtext(side=4, text=ylab_right, line=3)

                    # add doubling time
                    points(doubling_times_x, doubling_times_y, 
                           t="p", col=lm_doubling_time_col,
                           #lty=lm_doubling_time_lty, lwd=lm_doubling_time_lwd,
                           pch=lm_doubling_time_pch)
                    #segments()

                } # if add_right_yaxis
            } # if add_lm_log_to_plot

            # legend
            le_pos <- "topleft"
            le_text <- jhu_text
            le_col <- jhu_col
            le_lty <- jhu_lty
            le_lwd <- jhu_lwd
            le_pch <- jhu_pch
            if (country == "Germany") {
                le_text <- c(le_text, rki_text)
                le_col <- c(le_col, rki_col)
                le_lty <- c(le_lty, rki_lty)
                le_lwd <- c(le_lwd, rki_lwd)
                le_pch <- c(le_pch, rki_pch)
            }
            if (add_lm_log_to_plot) {
                le_text <- c(le_text,
                             "exponential model:",
                             eval(substitute(expression(paste("   N"[t], " = N"[0], " exp(b" %*% "", 
                                                              ts_dt_unit, "); b = ", estimate, "" %+-% "", 
                                                              uncert, " ",  ts_dt_unit, ""^paste(-1), " (r = ", rsq, 
                                                              ", p ", p, ")")),
                                             list(estimate=round(lm_list_ploti[[1]]$estimate, 3), 
                                                  uncert=round(lm_list_ploti[[1]]$uncertainty, 3),
                                                  ts_dt_unit=ts_dt_unit, 
                                                  rsq=round(sqrt(lm_list_ploti[[1]]$rsq), 2),
                                                  p=ifelse(lm_list_ploti[[1]]$p < 1e-3, "< 1e-3", 
                                                           paste0("= ", round(lm_list_ploti[[1]]$p, 3)))))),
                             "exponential prediction:",
                             eval(substitute(expression(paste("   2N"[0], " = N"[0], 
                                                              " exp(b" %*% "t"["double"], 
                                                              ") => t"["double"], " = log(2)" %*% "b"^paste(-1),
                                                              " = ", doubling_time, " ", ts_dt_unit)),
                                             list(estimate=round(lm_list_ploti[[1]]$estimate, 3), 
                                                  ts_dt_unit=ts_dt_unit, 
                                                  doubling_time=round(lm_list_ploti[[1]]$doubling_time, 2)))),
                             paste("doubling time based on the last ", as.integer(lm_obs_estimate_ndays), " days (right axis)"))
                le_col <- c(le_col, lm_obs_col, NA, lm_predict_col, NA, lm_doubling_time_col)
                le_lty <- c(le_lty, lm_obs_lty, NA, lm_predict_lty, NA, lm_doubling_time_lty)
                le_lwd <- c(le_lwd, lm_obs_lwd, NA, lm_predict_lwd, NA, lm_doubling_time_lwd)
                le_pch <- c(le_pch, lm_obs_pch, NA, lm_predict_pch, NA, lm_doubling_time_pch)
            }
            if (country == "China") le_pos <- "bottomleft"
            legend(le_pos, legend=le_text,
                   col=le_col,
                   lty=le_lty, lwd=le_lwd, pch=le_pch, 
                   bty="n", x.intersp=0.2, cex=0.85)

            # save plot
            dev.off()

        } # ploti
  
        plotname_all[[ci]] <- plotname_tmp
        names(plotname_all)[ci] <- country
        
    } else {

        warning("reading country ", ci, " \"", country, "\" data was not successfull")

    } # if !is.null(ts)
   
} # for ci countries

# plot some stuff
if (!all(sapply(ts_all, is.null))) {

    if (F) { # confirmed vs deaths
        message("\nplot confirmed vs deaths ...")
        xscatter <- vector("list", l=length(ts_all))
        names(xscatter) <- countries
        yscatter <- xscatter
        for (ci in seq_along(ts_all)) {
            more_than_one_death_inds <- which(ts_all[[ci]]$deaths > 1)
            if (length(more_than_one_death_inds) > 0) {
                xscatter[[ci]] <- ts_all[[ci]]$confirmed[more_than_one_death_inds]
                yscatter[[ci]] <- ts_all[[ci]]$deaths[more_than_one_death_inds]
            }
        }
        #xlim <- range(lapply(ts_all, "[", "confirmed"))
        #ylim <- range(lapply(ts_all, "[", "deaths"))
        xlim <- range(xscatter)
        ylim <- range(yscatter)
        scatter_log <- "xy"
        if (grepl("x", scatter_log)) { 
            if (xlim[1] == 0) xlim[1] <- 1
        }
        if (grepl("y", scatter_log)) { 
            if (ylim[1] == 0) ylim[1] <- 1
        }
        plot(#ts_all[[1]]$confirmed, ts_all[[1]]$deaths, 
             xscatter[[ci]], yscatter[[ci]],
             t="n", log="xy",
             xlab="Confirmed", ylab="Deaths",
             xlim=xlim, ylim=ylim)
        for (ci in seq_along(ts_all)) {
            if (!is.null(xscatter[[ci]])) {
                text(#ts_all[[ci]]$confirmed, ts_all[[ci]]$deaths,
                     xscatter[[ci]], yscatter[[ci]],
                     labels=substr(countries[ci], 1, 3), col=ci 
                     #, cex=0.5
                     )
            }
        }
    } # F

    if (T) { # ratio: deaths/confirmed*100
        message("\nplot deaths/confirmed*100 ...")
        deaths_per_confirmed_x <- vector("list", l=length(ts_all))
        names(deaths_per_confirmed_x) <- countries
        deaths_per_confirmed_y <- deaths_per_confirmed_x
        for (ci in seq_along(ts_all)) {
            more_than_one_death_inds <- which(ts_all[[ci]]$deaths > 1)
            if (length(more_than_one_death_inds) > 0) {
                tmp <- ts_all[[ci]]$time[more_than_one_death_inds]
                deaths_per_confirmed_x[[ci]] <- as.numeric(difftime(tmp, rep(tmp[1], t=length(tmp)), units="day"))
                deaths_per_confirmed_y[[ci]] <- ts_all[[ci]]$deaths[more_than_one_death_inds]/ts_all[[ci]]$confirmed[more_than_one_death_inds]*100
            }
        }
        xlim <- range(deaths_per_confirmed_x)
        xat <- pretty(xlim, n=50) 
        #ylim <- range(deaths_per_confirmed_y)
        deaths_per_confirmed_min <- as.numeric(sapply(lapply(deaths_per_confirmed_y, summary), "[", "Min."))
        deaths_per_confirmed_mean <- as.numeric(sapply(lapply(deaths_per_confirmed_y, summary), "[", "Mean"))
        deaths_per_confirmed_median <- as.numeric(sapply(lapply(deaths_per_confirmed_y, summary), "[", "Median"))
        deaths_per_confirmed_3rd_qu <- as.numeric(sapply(lapply(deaths_per_confirmed_y, summary), "[", "3rd Qu."))
        ylim <- range(deaths_per_confirmed_min, deaths_per_confirmed_3rd_qu, na.rm=T)
        yat <- pretty(ylim, n=20)
        library(RColorBrewer) # https://www.r-bloggers.com/palettes-in-r/
        cols <- brewer.pal(8, "Dark2")
        if (length(cols) != length(ts_all)) {
            cols <- c(cols, rep(cols, t=ceiling(length(ts_all)/length(cols))))
        }
        if (length(cols) > length(ts_all)) {
            cols <- cols[1:length(ts_all)]
        } else if (length(cols) < length(ts_all)) {
            stop("this never happened")
        }
        log_death_per_confirmed <- "y" # "", "y"
        plotname <- paste0("plots/death_per_confirmed", 
                           ifelse(log_death_per_confirmed != "", paste0("_log", log_death_per_confirmed), ""),
                           ".png")
        png(plotname,
            width=png_specs$width, height=1.5*png_specs$height, res=png_specs$res)
        par(mar=c(5.1, 6.1, 4.1, 6.1) + 0.1)
        plot(deaths_per_confirmed_x[[1]], deaths_per_confirmed_y[[1]],
             t="n", xaxt="n", yaxt="n", log=log_death_per_confirmed,
             xlab="days since cumulative deaths > 1", 
             ylab="(cumulative deaths)/(cumulative confirmed)*100 (in %)",
             xlim=xlim, ylim=ylim)
        axis(1, at=xat)
        axis(2, at=yat, las=2)
        axis(4, at=yat, las=2)
        mtext(side=4, text="(cumulative deaths)/(cumulative confirmed)*100 (in %)", line=3)
        abline(v=xat, col="gray", lwd=0.5)
        abline(h=yat, col="gray", lwd=0.5)
        title("death rate = (cumulative deaths)/(cumulative confirmed)*100")
        for (ci in seq_along(ts_all)) {
            if (!is.null(deaths_per_confirmed_x[[ci]])) {
                text(deaths_per_confirmed_x[[ci]], deaths_per_confirmed_y[[ci]],
                     labels=substr(countries[ci], 1, 3), col=cols[ci] 
                     , cex=0.5
                     )
            }
        }
        dev.off()
    } # F
    
} # if ts not all null

# update readme
message("\nupdate readme ...")
upstream_hash <- system("git rev-parse upstream/master", intern=T)
upstream_datetime <- file.info("../.git/refs/remotes/upstream")$mtime
upstream_datetime <- as.POSIXlt(upstream_datetime)
tz <- attributes(upstream_datetime)$tzone
if (any(tz == "")) tz <- tz[-which(tz == "")]
readme <- c("# International Covid-19 death predictions based on CSSEGISandData/COVID-19", "",
            "  * upstream repo: https://github.com/CSSEGISandData/COVID-19  ",
            paste0("  * time of last fetch of upstream repo: **", upstream_datetime, " ", tz[1], 
                   "** (timestamp of file `.git/refs/remotes/upstream`)  "), 
            paste0("  * hash of last fetched commit of upstream repo: `", upstream_hash, 
                   "` (`git rev-parse upstream/master`)  "),
            paste0("  * last date of `COVID-19/csse_covid_19_data/time_series_covid19_*_global.csv` data: **", 
                   max(ts_dates), "**"),
            "", "# death rate evolution", "",
            "<img align=\"center\" width=\"1000\" src=\"plots/death_per_confirmed_logy.png\">",
            "", "# Select country", "")

## toc: available countries ordered by their deaths doubling 

## ls.str(lm_list):
#Germany : List of 4
# $ cumulative deaths   :List of 1
# $ daily deaths        :List of 1
# $ cumulative confirmed:List of 1
# $ daily confirmed     :List of 1
#Romania : List of 4
# $ cumulative deaths   :List of 1
# $ daily deaths        :List of 1
# $ cumulative confirmed:List of 1
# $ daily confirmed     :List of 1

## ls.str(lm_list[[1]]):
#cumulative confirmed : List of 1
# $ :List of 63
#cumulative deaths : List of 1
# $ :List of 21
#daily confirmed : List of 1
# $ :List of 46
#daily deaths : List of 1
# $ :List of 21

lm_time_death_double <- rep(NA, t=length(lm_list))
names(lm_time_death_double) <- names(lm_list)
for (ci in seq_along(lm_list)) {
    if (!is.null(lm_list[[ci]][["cumulative deaths"]][[1]][[1]])) {
        if (!is.na(lm_list[[ci]][["cumulative deaths"]])) { 
            lm_time_death_double[ci] <- lm_list[[ci]][["cumulative deaths"]][[1]]$doubling_time
        }
    }
}

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
    # 7 columns:
    toc <- paste0("country | ", # col 1
                  "cumulative number<br>of deaths doubles in | ", # col 2
                  "period of<br>estimation | ", # col 3
                  "rsq | ", # col 4
                  "p | ", # col 5
                  "cumulative<br>deaths | ", # col 6
                  "cumulative<br>confirmed")  # col 7
    toc <- c(toc, "--- | --- | --- | --- | --- | --- | ---")
    cnt <- length(toc)
    for (ci in seq_along(plotname_all)) {
        tmp <- paste0("[", names(plotname_all)[allinds[ci]], "](#", 
                      gsub(" ", "-", names(plotname_all)[allinds[ci]]), ") | ") # col 1
        if (!is.na(lm_time_death_double[ci])) {
            tmp <- paste0(tmp, 
                          round(lm_time_death_double[ci], 2), " ",
                          lm_list[[allinds[ci]]][["cumulative deaths"]][[1]]$doubling_time_unit, " | ", # col 2
                          lm_list[[allinds[ci]]][["cumulative deaths"]][[1]]$lm_from, " to<br>", 
                          lm_list[[allinds[ci]]][["cumulative deaths"]][[1]]$lm_to, " (",
                          lm_list[[allinds[ci]]][["cumulative deaths"]][[1]]$lm_time_range, " ", 
                          lm_list[[allinds[ci]]][["cumulative deaths"]][[1]]$lm_time_range_unit, ") | ", # col 3
                          round(lm_list[[allinds[ci]]][["cumulative deaths"]][[1]]$rsq, 2), " | ", # col 4 
                          ifelse(lm_list[[allinds[ci]]][["cumulative deaths"]][[1]]$p < 1e-3, 
                                 "< 1e-3",
                                 round(lm_list[[allinds[ci]]][["cumulative deaths"]][[1]]$p, 3)), " | ") # col 5
        } else {
            tmp <- paste0(tmp, 
                          paste0(rep(paste0(lm_time_death_double[ci], " | "), t=4), collapse="")) # col 2, 3, 4, 5
        }
        tmp <- paste0(tmp, 
                      ts_all[[allinds[ci]]]$deaths[length(ts_dates)], " | ",  # col 6
                      ts_all[[allinds[ci]]]$confirmed[length(ts_dates)]) # col 7
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
        if (!is.na(lm_list[[ci]][["cumulative deaths"]][[1]]$doubling_time)) {
            toc <- paste0(toc, 
                          round(lm_list[[ci]][["cumulative deaths"]][[1]]$doubling_time, 2), " ", 
                          lm_list[[ci]][["cumulative deaths"]][[1]]$doubling_time_unit)
        } else {
            toc <- paste0(toc, "NA")
        }
        toc <- paste0(toc, ") ")
    }

} # if lm is available or not
readme <- c(readme, toc, "")

# readme everything after toc
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



## ending
message("\nts data available of ", length(ts_countries), " countries:\n",
        "\"", paste(ts_countries, collapse="\", \""), "\"")

report_countries <- sort(unique(unlist(report_countries)))
message("\nreports available of ", length(report_countries), " countries:\n",
        "\"", paste(report_countries, collapse="\", \""), "\"")

message("\nfinished\n")

