# International Covid-19 death predictions based on CSSEGISandData/COVID-19

  * upstream repo: https://github.com/CSSEGISandData/COVID-19  
  * time of last fetch of upstream repo: **2020-05-26 09:07:10 CET** (timestamp of file `.git/refs/remotes/upstream`)  
  * hash of last fetched commit of upstream repo: `8747ab05ac9c1f13647146097d6801ae0a3f6984` (`git rev-parse upstream/master`)  
  * last date of `COVID-19/csse_covid_19_data/time_series_covid19_*_global.csv` data: **2020-05-25**

# death rate evolution

<img align="center" width="1000" src="plots/death_per_confirmed_logy.png">

# Select country

ordererd by time when cumulative number of deaths doubles (increasing)
country | cumulative number<br>of deaths doubles in | period of<br>estimation | rsq | p | cumulative<br>deaths | cumulative<br>confirmed
--- | --- | --- | --- | --- | --- | ---
[Nepal](#Nepal) | 6.03 days | 2020-05-16 to<br>2020-05-25 (10 days) | 0.8 | < 1e-3 | 4 | 682
[Brazil](#Brazil) | 14.48 days | 2020-05-16 to<br>2020-05-25 (10 days) | 0.99 | < 1e-3 | 23473 | 374898
[Russia](#Russia) | 16.69 days | 2020-05-16 to<br>2020-05-25 (10 days) | 1 | < 1e-3 | 3633 | 353427
[Canada](#Canada) | 45.1 days | 2020-05-16 to<br>2020-05-25 (10 days) | 1 | < 1e-3 | 6655 | 87119
[Japan](#Japan) | 47.73 days | 2020-05-16 to<br>2020-05-25 (10 days) | 0.99 | < 1e-3 | 830 | 16581
[US](#US) | 56.48 days | 2020-05-16 to<br>2020-05-25 (10 days) | 0.98 | < 1e-3 | 98220 | 1662302
[Sweden](#Sweden) | 58.73 days | 2020-05-16 to<br>2020-05-25 (10 days) | 0.97 | < 1e-3 | 4029 | 33843
[Portugal](#Portugal) | 62.3 days | 2020-05-16 to<br>2020-05-25 (10 days) | 1 | < 1e-3 | 1330 | 30788
[Poland](#Poland) | 63.84 days | 2020-05-16 to<br>2020-05-25 (10 days) | 0.99 | < 1e-3 | 1007 | 21631
[Romania](#Romania) | 68.33 days | 2020-05-16 to<br>2020-05-25 (10 days) | 0.99 | < 1e-3 | 1205 | 18283
[Hungary](#Hungary) | 70.44 days | 2020-05-16 to<br>2020-05-25 (10 days) | 0.97 | < 1e-3 | 491 | 3756
[United Kingdom](#United-Kingdom) | 81.76 days | 2020-05-16 to<br>2020-05-25 (10 days) | 0.98 | < 1e-3 | 36996 | 262547
[Iran](#Iran) | 84.45 days | 2020-05-16 to<br>2020-05-25 (10 days) | 1 | < 1e-3 | 7451 | 137724
[Turkey](#Turkey) | 100.9 days | 2020-05-16 to<br>2020-05-25 (10 days) | 1 | < 1e-3 | 4369 | 157814
[Germany](#Germany) | 126 days | 2020-05-16 to<br>2020-05-25 (10 days) | 0.97 | < 1e-3 | 8309 | 180600
[Australia](#Australia) | 150.87 days | 2020-05-16 to<br>2020-05-25 (10 days) | 0.95 | < 1e-3 | 102 | 7126
[Denmark](#Denmark) | 163.7 days | 2020-05-16 to<br>2020-05-25 (10 days) | 0.92 | < 1e-3 | 563 | 11586
[Italy](#Italy) | 173.63 days | 2020-05-16 to<br>2020-05-25 (10 days) | 0.99 | < 1e-3 | 32877 | 230158
[Belgium](#Belgium) | 190.76 days | 2020-05-16 to<br>2020-05-25 (10 days) | 1 | < 1e-3 | 9312 | 57342
[Netherlands](#Netherlands) | 202.1 days | 2020-05-16 to<br>2020-05-25 (10 days) | 0.98 | < 1e-3 | 5849 | 45647
[Korea, South](#Korea,-South) | 263.7 days | 2020-05-16 to<br>2020-05-25 (10 days) | 0.91 | < 1e-3 | 269 | 11225
[Austria](#Austria) | 297.44 days | 2020-05-16 to<br>2020-05-25 (10 days) | 0.94 | < 1e-3 | 641 | 16539
[France](#France) | 299.52 days | 2020-05-16 to<br>2020-05-25 (10 days) | 0.61 | 0.008 | 28460 | 183067
[Switzerland](#Switzerland) | 350.74 days | 2020-05-16 to<br>2020-05-25 (10 days) | 0.99 | < 1e-3 | 1913 | 30746
[Spain](#Spain) | 359.04 days | 2020-05-16 to<br>2020-05-25 (10 days) | 0.07 | 0.449 | 26834 | 235400
[Norway](#Norway) | 411.09 days | 2020-05-16 to<br>2020-05-25 (10 days) | 0.86 | < 1e-3 | 235 | 8364
[China](#China) | 2262229614422286 days | 2020-05-16 to<br>2020-05-25 (10 days) | 0.52 | 0.122 | 4638 | 84102

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

