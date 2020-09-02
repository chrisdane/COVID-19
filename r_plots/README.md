# International Covid-19 death predictions based on CSSEGISandData/COVID-19

  * upstream repo: https://github.com/CSSEGISandData/COVID-19  
  * time of last fetch of upstream repo: **2020-06-27 11:04:06 CET** (timestamp of file `.git/refs/remotes/upstream`)  
  * hash of last fetched commit of upstream repo: `07bbb1c5aeac9964f47ee2401a6aae238f8d074d` (`git rev-parse upstream/master`)  
  * last date of `COVID-19/csse_covid_19_data/time_series_covid19_*_global.csv` data: **2020-06-26**

# death rate evolution

<img align="center" width="1000" src="plots/death_per_confirmed_logy.png">

# Select country

ordererd by time when cumulative number of deaths doubles (increasing)
country | cumulative number<br>of deaths doubles in | period of<br>estimation | rsq | p | cumulative<br>deaths | cumulative<br>confirmed
--- | --- | --- | --- | --- | --- | ---
[Nepal](#Nepal) | 25.05 days | 2020-06-17 to<br>2020-06-26 (10 days) | 0.92 | < 1e-3 | 27 | 11755
[Brazil](#Brazil) | 34.71 days | 2020-06-17 to<br>2020-06-26 (10 days) | 0.99 | < 1e-3 | 55961 | 1274974
[Russia](#Russia) | 40.62 days | 2020-06-17 to<br>2020-06-26 (10 days) | 0.99 | < 1e-3 | 8770 | 619936
[Iran](#Iran) | 56.3 days | 2020-06-17 to<br>2020-06-26 (10 days) | 1 | < 1e-3 | 10239 | 217724
[Poland](#Poland) | 65.91 days | 2020-06-17 to<br>2020-06-26 (10 days) | 0.97 | < 1e-3 | 1429 | 33395
[Romania](#Romania) | 76.1 days | 2020-06-17 to<br>2020-06-26 (10 days) | 1 | < 1e-3 | 1579 | 25697
[US](#US) | 109.17 days | 2020-06-17 to<br>2020-06-26 (10 days) | 0.93 | < 1e-3 | 125039 | 2467554
[Sweden](#Sweden) | 144.54 days | 2020-06-17 to<br>2020-06-26 (10 days) | 0.94 | < 1e-3 | 5280 | 65137
[Turkey](#Turkey) | 148.21 days | 2020-06-17 to<br>2020-06-26 (10 days) | 1 | < 1e-3 | 5065 | 194511
[Japan](#Japan) | 159.03 days | 2020-06-17 to<br>2020-06-26 (10 days) | 0.91 | < 1e-3 | 971 | 18162
[Spain](#Spain) | 164.8 days | 2020-06-17 to<br>2020-06-26 (10 days) | 0.5 | 0.023 | 28338 | 247905
[Canada](#Canada) | 210.07 days | 2020-06-17 to<br>2020-06-26 (10 days) | 0.94 | < 1e-3 | 8571 | 104629
[Norway](#Norway) | 216.62 days | 2020-06-17 to<br>2020-06-26 (10 days) | 0.86 | < 1e-3 | 249 | 8832
[United Kingdom](#United-Kingdom) | 222.31 days | 2020-06-17 to<br>2020-06-26 (10 days) | 0.97 | < 1e-3 | 43498 | 310836
[Australia](#Australia) | 261.69 days | 2020-06-17 to<br>2020-06-26 (10 days) | 0.76 | 0.001 | 104 | 7601
[Portugal](#Portugal) | 301.58 days | 2020-06-17 to<br>2020-06-26 (10 days) | 0.95 | < 1e-3 | 1555 | 40866
[Hungary](#Hungary) | 307.31 days | 2020-06-17 to<br>2020-06-26 (10 days) | 0.96 | < 1e-3 | 578 | 4127
[Austria](#Austria) | 378.83 days | 2020-06-17 to<br>2020-06-26 (10 days) | 0.88 | < 1e-3 | 698 | 17522
[Germany](#Germany) | 583.15 days | 2020-06-17 to<br>2020-06-26 (10 days) | 0.94 | < 1e-3 | 8965 | 194036
[Denmark](#Denmark) | 680.8 days | 2020-06-17 to<br>2020-06-26 (10 days) | 0.91 | < 1e-3 | 604 | 12875
[Korea, South](#Korea,-South) | 698.54 days | 2020-06-17 to<br>2020-06-26 (10 days) | 0.84 | < 1e-3 | 282 | 12653
[France](#France) | 911.49 days | 2020-06-17 to<br>2020-06-26 (10 days) | 0.97 | < 1e-3 | 29781 | 199473
[Italy](#Italy) | 959.94 days | 2020-06-17 to<br>2020-06-26 (10 days) | 0.85 | < 1e-3 | 34708 | 239961
[Belgium](#Belgium) | 1119.95 days | 2020-06-17 to<br>2020-06-26 (10 days) | 0.94 | < 1e-3 | 9731 | 61106
[Netherlands](#Netherlands) | 1361.7 days | 2020-06-17 to<br>2020-06-26 (10 days) | 0.97 | < 1e-3 | 6122 | 50213
[Switzerland](#Switzerland) | 2871.52 days | 2020-06-17 to<br>2020-06-26 (10 days) | 0.54 | 0.015 | 1962 | 31486
[China](#China) | 8698.47 days | 2020-06-17 to<br>2020-06-26 (10 days) | 0.93 | < 1e-3 | 4641 | 84725

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

