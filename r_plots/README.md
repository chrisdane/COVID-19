# International Covid-19 death predictions based on CSSEGISandData/COVID-19

  * upstream repo: https://github.com/CSSEGISandData/COVID-19  
  * time of last fetch of upstream repo: **2020-05-28 19:37:19 CET** (timestamp of file `.git/refs/remotes/upstream`)  
  * hash of last fetched commit of upstream repo: `b9789de1e60e67abd71ce1f937634e8ae21a1101` (`git rev-parse upstream/master`)  
  * last date of `COVID-19/csse_covid_19_data/time_series_covid19_*_global.csv` data: **2020-05-27**

# death rate evolution

<img align="center" width="1000" src="plots/death_per_confirmed_logy.png">

# Select country

ordererd by time when cumulative number of deaths doubles (increasing)
country | cumulative number<br>of deaths doubles in | period of<br>estimation | rsq | p | cumulative<br>deaths | cumulative<br>confirmed
--- | --- | --- | --- | --- | --- | ---
[Spain](#Spain) | -244.43 days | 2020-05-18 to<br>2020-05-27 (10 days) | 0.12 | 0.325 | 27117 | 236259
[Nepal](#Nepal) | 7.86 days | 2020-05-18 to<br>2020-05-27 (10 days) | 0.88 | < 1e-3 | 4 | 886
[Brazil](#Brazil) | 15.38 days | 2020-05-18 to<br>2020-05-27 (10 days) | 0.99 | < 1e-3 | 25598 | 411821
[Russia](#Russia) | 16.58 days | 2020-05-18 to<br>2020-05-27 (10 days) | 1 | < 1e-3 | 3968 | 370680
[Canada](#Canada) | 43.69 days | 2020-05-18 to<br>2020-05-27 (10 days) | 1 | < 1e-3 | 6876 | 88989
[Japan](#Japan) | 46.4 days | 2020-05-18 to<br>2020-05-27 (10 days) | 0.99 | < 1e-3 | 858 | 16651
[Sweden](#Sweden) | 51.19 days | 2020-05-18 to<br>2020-05-27 (10 days) | 0.98 | < 1e-3 | 4220 | 35088
[US](#US) | 62.87 days | 2020-05-18 to<br>2020-05-27 (10 days) | 0.97 | < 1e-3 | 100417 | 1699176
[Portugal](#Portugal) | 65.61 days | 2020-05-18 to<br>2020-05-27 (10 days) | 1 | < 1e-3 | 1356 | 31292
[Poland](#Poland) | 67.41 days | 2020-05-18 to<br>2020-05-27 (10 days) | 0.99 | < 1e-3 | 1028 | 22473
[Romania](#Romania) | 70.56 days | 2020-05-18 to<br>2020-05-27 (10 days) | 0.99 | < 1e-3 | 1227 | 18594
[Hungary](#Hungary) | 72.51 days | 2020-05-18 to<br>2020-05-27 (10 days) | 0.98 | < 1e-3 | 505 | 3793
[Iran](#Iran) | 91 days | 2020-05-18 to<br>2020-05-27 (10 days) | 1 | < 1e-3 | 7564 | 141591
[United Kingdom](#United-Kingdom) | 93.11 days | 2020-05-18 to<br>2020-05-27 (10 days) | 0.95 | < 1e-3 | 37542 | 268619
[Turkey](#Turkey) | 103.14 days | 2020-05-18 to<br>2020-05-27 (10 days) | 1 | < 1e-3 | 4431 | 159797
[Germany](#Germany) | 135.07 days | 2020-05-18 to<br>2020-05-27 (10 days) | 0.97 | < 1e-3 | 8428 | 181524
[Australia](#Australia) | 162.96 days | 2020-05-18 to<br>2020-05-27 (10 days) | 0.95 | < 1e-3 | 103 | 7150
[Italy](#Italy) | 197.67 days | 2020-05-18 to<br>2020-05-27 (10 days) | 0.98 | < 1e-3 | 33072 | 231139
[Belgium](#Belgium) | 200.73 days | 2020-05-18 to<br>2020-05-27 (10 days) | 1 | < 1e-3 | 9364 | 57592
[Netherlands](#Netherlands) | 210.46 days | 2020-05-18 to<br>2020-05-27 (10 days) | 0.98 | < 1e-3 | 5890 | 45970
[Denmark](#Denmark) | 223.51 days | 2020-05-18 to<br>2020-05-27 (10 days) | 0.82 | < 1e-3 | 565 | 11680
[Korea, South](#Korea,-South) | 234.06 days | 2020-05-18 to<br>2020-05-27 (10 days) | 0.95 | < 1e-3 | 269 | 11344
[Austria](#Austria) | 254.76 days | 2020-05-18 to<br>2020-05-27 (10 days) | 0.98 | < 1e-3 | 645 | 16591
[France](#France) | 364.39 days | 2020-05-18 to<br>2020-05-27 (10 days) | 0.84 | < 1e-3 | 28599 | 183038
[Switzerland](#Switzerland) | 376.37 days | 2020-05-18 to<br>2020-05-27 (10 days) | 0.98 | < 1e-3 | 1917 | 30776
[Norway](#Norway) | 723.51 days | 2020-05-18 to<br>2020-05-27 (10 days) | 0.64 | 0.006 | 235 | 8401
[China](#China) | 2262229614422286 days | 2020-05-18 to<br>2020-05-27 (10 days) | 0.52 | 0.122 | 4638 | 84106

# Australia
[top](#Select-country)

<img align="center" width="1000" src="plots/Australia/Australia_cumulative_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/Australia/Australia_daily_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/Australia/Australia_cumulative_confirmed_logy.png">
<br>
<img align="center" width="1000" src="plots/Australia/Australia_daily_confirmed_logy.png">
<br>
<br>

# Austria
[top](#Select-country)

<img align="center" width="1000" src="plots/Austria/Austria_cumulative_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/Austria/Austria_daily_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/Austria/Austria_cumulative_confirmed_logy.png">
<br>
<img align="center" width="1000" src="plots/Austria/Austria_daily_confirmed_logy.png">
<br>
<br>

# Belgium
[top](#Select-country)

<img align="center" width="1000" src="plots/Belgium/Belgium_cumulative_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/Belgium/Belgium_daily_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/Belgium/Belgium_cumulative_confirmed_logy.png">
<br>
<img align="center" width="1000" src="plots/Belgium/Belgium_daily_confirmed_logy.png">
<br>
<br>

# Brazil
[top](#Select-country)

<img align="center" width="1000" src="plots/Brazil/Brazil_cumulative_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/Brazil/Brazil_daily_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/Brazil/Brazil_cumulative_confirmed_logy.png">
<br>
<img align="center" width="1000" src="plots/Brazil/Brazil_daily_confirmed_logy.png">
<br>
<br>

# Canada
[top](#Select-country)

<img align="center" width="1000" src="plots/Canada/Canada_cumulative_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/Canada/Canada_daily_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/Canada/Canada_cumulative_confirmed_logy.png">
<br>
<img align="center" width="1000" src="plots/Canada/Canada_daily_confirmed_logy.png">
<br>
<br>

# China
[top](#Select-country)

<img align="center" width="1000" src="plots/China/China_cumulative_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/China/China_daily_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/China/China_cumulative_confirmed_logy.png">
<br>
<img align="center" width="1000" src="plots/China/China_daily_confirmed_logy.png">
<br>
<br>

# Denmark
[top](#Select-country)

<img align="center" width="1000" src="plots/Denmark/Denmark_cumulative_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/Denmark/Denmark_daily_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/Denmark/Denmark_cumulative_confirmed_logy.png">
<br>
<img align="center" width="1000" src="plots/Denmark/Denmark_daily_confirmed_logy.png">
<br>
<br>

# France
[top](#Select-country)

<img align="center" width="1000" src="plots/France/France_cumulative_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/France/France_daily_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/France/France_cumulative_confirmed_logy.png">
<br>
<img align="center" width="1000" src="plots/France/France_daily_confirmed_logy.png">
<br>
<br>

# Germany
[top](#Select-country)

<img align="center" width="1000" src="plots/Germany/Germany_cumulative_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/Germany/Germany_daily_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/Germany/Germany_cumulative_confirmed_logy.png">
<br>
<img align="center" width="1000" src="plots/Germany/Germany_daily_confirmed_logy.png">
<br>
<img align="center" width="1000" src="plots/Germany/Germany_cumulative_confirmed_reproduction_number_r.png">
<br>
<br>

# Hungary
[top](#Select-country)

<img align="center" width="1000" src="plots/Hungary/Hungary_cumulative_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/Hungary/Hungary_daily_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/Hungary/Hungary_cumulative_confirmed_logy.png">
<br>
<img align="center" width="1000" src="plots/Hungary/Hungary_daily_confirmed_logy.png">
<br>
<br>

# Iran
[top](#Select-country)

<img align="center" width="1000" src="plots/Iran/Iran_cumulative_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/Iran/Iran_daily_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/Iran/Iran_cumulative_confirmed_logy.png">
<br>
<img align="center" width="1000" src="plots/Iran/Iran_daily_confirmed_logy.png">
<br>
<br>

# Italy
[top](#Select-country)

national responses:
1. 2020-03-04: https://www.theguardian.com/world/2020/mar/04/italy-orders-closure-of-schools-and-universities-due-to-coronavirus
2. 2020-03-09: https://www.bbc.co.uk/sport/51808683
3. 2020-03-11: https://www.washingtonpost.com/world/europe/merkel-coronavirus-germany/2020/03/11/e276252a-6399-11ea-8a8e-5c5336b32760_story.html
<img align="center" width="1000" src="plots/Italy/Italy_cumulative_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/Italy/Italy_daily_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/Italy/Italy_cumulative_confirmed_logy.png">
<br>
<img align="center" width="1000" src="plots/Italy/Italy_daily_confirmed_logy.png">
<br>
<br>

# Japan
[top](#Select-country)

<img align="center" width="1000" src="plots/Japan/Japan_cumulative_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/Japan/Japan_daily_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/Japan/Japan_cumulative_confirmed_logy.png">
<br>
<img align="center" width="1000" src="plots/Japan/Japan_daily_confirmed_logy.png">
<br>
<br>

# Korea, South
[top](#Select-country)

<img align="center" width="1000" src="plots/Korea,_South/Korea,_South_cumulative_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/Korea,_South/Korea,_South_daily_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/Korea,_South/Korea,_South_cumulative_confirmed_logy.png">
<br>
<img align="center" width="1000" src="plots/Korea,_South/Korea,_South_daily_confirmed_logy.png">
<br>
<br>

# Nepal
[top](#Select-country)

<img align="center" width="1000" src="plots/Nepal/Nepal_cumulative_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/Nepal/Nepal_daily_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/Nepal/Nepal_cumulative_confirmed_logy.png">
<br>
<img align="center" width="1000" src="plots/Nepal/Nepal_daily_confirmed_logy.png">
<br>
<br>

# Netherlands
[top](#Select-country)

<img align="center" width="1000" src="plots/Netherlands/Netherlands_cumulative_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/Netherlands/Netherlands_daily_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/Netherlands/Netherlands_cumulative_confirmed_logy.png">
<br>
<img align="center" width="1000" src="plots/Netherlands/Netherlands_daily_confirmed_logy.png">
<br>
<br>

# Norway
[top](#Select-country)

<img align="center" width="1000" src="plots/Norway/Norway_cumulative_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/Norway/Norway_daily_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/Norway/Norway_cumulative_confirmed_logy.png">
<br>
<img align="center" width="1000" src="plots/Norway/Norway_daily_confirmed_logy.png">
<br>
<br>

# Poland
[top](#Select-country)

<img align="center" width="1000" src="plots/Poland/Poland_cumulative_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/Poland/Poland_daily_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/Poland/Poland_cumulative_confirmed_logy.png">
<br>
<img align="center" width="1000" src="plots/Poland/Poland_daily_confirmed_logy.png">
<br>
<br>

# Portugal
[top](#Select-country)

<img align="center" width="1000" src="plots/Portugal/Portugal_cumulative_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/Portugal/Portugal_daily_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/Portugal/Portugal_cumulative_confirmed_logy.png">
<br>
<img align="center" width="1000" src="plots/Portugal/Portugal_daily_confirmed_logy.png">
<br>
<br>

# Romania
[top](#Select-country)

<img align="center" width="1000" src="plots/Romania/Romania_cumulative_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/Romania/Romania_daily_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/Romania/Romania_cumulative_confirmed_logy.png">
<br>
<img align="center" width="1000" src="plots/Romania/Romania_daily_confirmed_logy.png">
<br>
<br>

# Russia
[top](#Select-country)

<img align="center" width="1000" src="plots/Russia/Russia_cumulative_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/Russia/Russia_daily_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/Russia/Russia_cumulative_confirmed_logy.png">
<br>
<img align="center" width="1000" src="plots/Russia/Russia_daily_confirmed_logy.png">
<br>
<br>

# Spain
[top](#Select-country)

<img align="center" width="1000" src="plots/Spain/Spain_cumulative_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/Spain/Spain_daily_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/Spain/Spain_cumulative_confirmed_logy.png">
<br>
<img align="center" width="1000" src="plots/Spain/Spain_daily_confirmed_logy.png">
<br>
<br>

# Sweden
[top](#Select-country)

<img align="center" width="1000" src="plots/Sweden/Sweden_cumulative_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/Sweden/Sweden_daily_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/Sweden/Sweden_cumulative_confirmed_logy.png">
<br>
<img align="center" width="1000" src="plots/Sweden/Sweden_daily_confirmed_logy.png">
<br>
<br>

# Switzerland
[top](#Select-country)

<img align="center" width="1000" src="plots/Switzerland/Switzerland_cumulative_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/Switzerland/Switzerland_daily_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/Switzerland/Switzerland_cumulative_confirmed_logy.png">
<br>
<img align="center" width="1000" src="plots/Switzerland/Switzerland_daily_confirmed_logy.png">
<br>
<br>

# Turkey
[top](#Select-country)

<img align="center" width="1000" src="plots/Turkey/Turkey_cumulative_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/Turkey/Turkey_daily_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/Turkey/Turkey_cumulative_confirmed_logy.png">
<br>
<img align="center" width="1000" src="plots/Turkey/Turkey_daily_confirmed_logy.png">
<br>
<br>

# US
[top](#Select-country)

<img align="center" width="1000" src="plots/US/US_cumulative_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/US/US_daily_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/US/US_cumulative_confirmed_logy.png">
<br>
<img align="center" width="1000" src="plots/US/US_daily_confirmed_logy.png">
<br>
<br>

# United Kingdom
[top](#Select-country)

<img align="center" width="1000" src="plots/United_Kingdom/United_Kingdom_cumulative_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/United_Kingdom/United_Kingdom_daily_deaths_logy.png">
<br>
<img align="center" width="1000" src="plots/United_Kingdom/United_Kingdom_cumulative_confirmed_logy.png">
<br>
<img align="center" width="1000" src="plots/United_Kingdom/United_Kingdom_daily_confirmed_logy.png">
<br>
<br>

