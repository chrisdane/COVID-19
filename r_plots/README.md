# International Covid-19 death predictions based on CSSEGISandData/COVID-19

  * upstream repo: https://github.com/CSSEGISandData/COVID-19  
  * time of last fetch of upstream repo: **2020-04-04 14:38:32 CET** (timestamp of file `.git/refs/remotes/upstream`)  
  * hash of last fetched commit of upstream repo: `817c2bd1f419d553c11a7d3e126827746b903dec` (`git rev-parse upstream/master`)  
  * last date of `COVID-19/csse_covid_19_data/time_series_covid19_*_global.csv` data: **2020-04-03**

# death rate evolution

<img align="center" width="1000" src="plots/death_per_confirmed.png">

# Select country

ordererd by time when cumulative number of deaths doubles (increasing)
country | cumulative number<br>of deaths doubles in | period of<br>estimation | rsq | p | cumulative<br>deaths | cumulative<br>confirmed
--- | --- | --- | --- | --- | --- | ---
[Russia](#Russia) | 2.23 days | 2020-03-25 to<br>2020-04-03 (10 days) | 0.96 | < 1e-3 | 34 | 4149
[Romania](#Romania) | 2.94 days | 2020-03-25 to<br>2020-04-03 (10 days) | 0.99 | < 1e-3 | 133 | 3183
[United Kingdom](#United-Kingdom) | 3.07 days | 2020-03-25 to<br>2020-04-03 (10 days) | 1 | < 1e-3 | 3611 | 38689
[US](#US) | 3.1 days | 2020-03-25 to<br>2020-04-03 (10 days) | 1 | < 1e-3 | 7087 | 275586
[Turkey](#Turkey) | 3.13 days | 2020-03-25 to<br>2020-04-03 (10 days) | 1 | < 1e-3 | 425 | 20921
[Belgium](#Belgium) | 3.27 days | 2020-03-25 to<br>2020-04-03 (10 days) | 1 | < 1e-3 | 1143 | 16770
[Germany](#Germany) | 3.44 days | 2020-03-25 to<br>2020-04-03 (10 days) | 0.99 | < 1e-3 | 1275 | 91159
[Sweden](#Sweden) | 3.63 days | 2020-03-25 to<br>2020-04-03 (10 days) | 0.97 | < 1e-3 | 358 | 6131
[Poland](#Poland) | 3.74 days | 2020-03-25 to<br>2020-04-03 (10 days) | 0.96 | < 1e-3 | 71 | 3383
[Portugal](#Portugal) | 3.75 days | 2020-03-25 to<br>2020-04-03 (10 days) | 0.97 | < 1e-3 | 246 | 9886
[Austria](#Austria) | 3.76 days | 2020-03-25 to<br>2020-04-03 (10 days) | 0.95 | < 1e-3 | 168 | 11524
[Canada](#Canada) | 3.76 days | 2020-03-25 to<br>2020-04-03 (10 days) | 0.98 | < 1e-3 | 179 | 12437
[Norway](#Norway) | 4.1 days | 2020-03-25 to<br>2020-04-03 (10 days) | 0.99 | < 1e-3 | 59 | 5370
[France](#France) | 4.19 days | 2020-03-25 to<br>2020-04-03 (10 days) | 0.99 | < 1e-3 | 6520 | 65202
[Netherlands](#Netherlands) | 4.38 days | 2020-03-25 to<br>2020-04-03 (10 days) | 0.99 | < 1e-3 | 1490 | 15821
[Denmark](#Denmark) | 4.6 days | 2020-03-25 to<br>2020-04-03 (10 days) | 0.98 | < 1e-3 | 139 | 3946
[Switzerland](#Switzerland) | 4.61 days | 2020-03-25 to<br>2020-04-03 (10 days) | 0.99 | < 1e-3 | 591 | 19606
[Spain](#Spain) | 5.63 days | 2020-03-25 to<br>2020-04-03 (10 days) | 0.98 | < 1e-3 | 11198 | 119199
[Australia](#Australia) | 6.17 days | 2020-03-25 to<br>2020-04-03 (10 days) | 0.92 | < 1e-3 | 28 | 5330
[Hungary](#Hungary) | 6.17 days | 2020-03-25 to<br>2020-04-03 (10 days) | 0.95 | < 1e-3 | 26 | 623
[Italy](#Italy) | 9.32 days | 2020-03-25 to<br>2020-04-03 (10 days) | 0.99 | < 1e-3 | 14681 | 119827
[Iran](#Iran) | 13.84 days | 2020-03-25 to<br>2020-04-03 (10 days) | 0.99 | < 1e-3 | 3294 | 53183
[Japan](#Japan) | 19.24 days | 2020-03-25 to<br>2020-04-03 (10 days) | 0.97 | < 1e-3 | 63 | 2617
[China](#China) | 525.11 days | 2020-03-25 to<br>2020-04-03 (10 days) | 0.99 | < 1e-3 | 3326 | 82511
[Nepal](#Nepal) | NA | NA | NA | NA | 0 | 6

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

