# International Covid-19 death predictions based on CSSEGISandData/COVID-19

  * upstream repo: https://github.com/CSSEGISandData/COVID-19  
  * time of last fetch of upstream repo: **2020-05-12 08:00:23 CET** (timestamp of file `.git/refs/remotes/upstream`)  
  * hash of last fetched commit of upstream repo: `c5f09505b0ef634ca09c645e5270131fc6a6f5a5` (`git rev-parse upstream/master`)  
  * last date of `COVID-19/csse_covid_19_data/time_series_covid19_*_global.csv` data: **2020-05-11**

# death rate evolution

<img align="center" width="1000" src="plots/death_per_confirmed_logy.png">

# Select country

ordererd by time when cumulative number of deaths doubles (increasing)
country | cumulative number<br>of deaths doubles in | period of<br>estimation | rsq | p | cumulative<br>deaths | cumulative<br>confirmed
--- | --- | --- | --- | --- | --- | ---
[Brazil](#Brazil) | 10.69 days | 2020-05-02 to<br>2020-05-11 (10 days) | 0.99 | < 1e-3 | 11653 | 169594
[Russia](#Russia) | 12.22 days | 2020-05-02 to<br>2020-05-11 (10 days) | 1 | < 1e-3 | 2009 | 221344
[Canada](#Canada) | 18.49 days | 2020-05-02 to<br>2020-05-11 (10 days) | 0.99 | < 1e-3 | 5115 | 71264
[Japan](#Japan) | 22.1 days | 2020-05-02 to<br>2020-05-11 (10 days) | 0.94 | < 1e-3 | 633 | 15847
[Romania](#Romania) | 25.16 days | 2020-05-02 to<br>2020-05-11 (10 days) | 1 | < 1e-3 | 982 | 15588
[Hungary](#Hungary) | 26.05 days | 2020-05-02 to<br>2020-05-11 (10 days) | 1 | < 1e-3 | 421 | 3284
[Sweden](#Sweden) | 27.26 days | 2020-05-02 to<br>2020-05-11 (10 days) | 0.96 | < 1e-3 | 3256 | 26670
[US](#US) | 29.84 days | 2020-05-02 to<br>2020-05-11 (10 days) | 0.98 | < 1e-3 | 80682 | 1347881
[Poland](#Poland) | 29.97 days | 2020-05-02 to<br>2020-05-11 (10 days) | 0.99 | < 1e-3 | 811 | 16326
[United Kingdom](#United-Kingdom) | 43.4 days | 2020-05-02 to<br>2020-05-11 (10 days) | 0.98 | < 1e-3 | 32141 | 224332
[Turkey](#Turkey) | 44.5 days | 2020-05-02 to<br>2020-05-11 (10 days) | 0.99 | < 1e-3 | 3841 | 139771
[Germany](#Germany) | 48.63 days | 2020-05-02 to<br>2020-05-11 (10 days) | 0.95 | < 1e-3 | 7661 | 172576
[Belgium](#Belgium) | 49.5 days | 2020-05-02 to<br>2020-05-11 (10 days) | 0.96 | < 1e-3 | 8707 | 53449
[Denmark](#Denmark) | 54.2 days | 2020-05-02 to<br>2020-05-11 (10 days) | 0.97 | < 1e-3 | 533 | 10711
[Portugal](#Portugal) | 56.9 days | 2020-05-02 to<br>2020-05-11 (10 days) | 0.98 | < 1e-3 | 1144 | 27679
[Netherlands](#Netherlands) | 64.36 days | 2020-05-02 to<br>2020-05-11 (10 days) | 0.98 | < 1e-3 | 5475 | 42987
[Iran](#Iran) | 73.07 days | 2020-05-02 to<br>2020-05-11 (10 days) | 0.99 | < 1e-3 | 6685 | 109286
[France](#France) | 83.64 days | 2020-05-02 to<br>2020-05-11 (10 days) | 0.97 | < 1e-3 | 26646 | 177547
[Italy](#Italy) | 86.04 days | 2020-05-02 to<br>2020-05-11 (10 days) | 0.99 | < 1e-3 | 30739 | 219814
[Spain](#Spain) | 93.21 days | 2020-05-02 to<br>2020-05-11 (10 days) | 0.99 | < 1e-3 | 26744 | 227436
[Norway](#Norway) | 119.1 days | 2020-05-02 to<br>2020-05-11 (10 days) | 0.94 | < 1e-3 | 224 | 8132
[Switzerland](#Switzerland) | 131.87 days | 2020-05-02 to<br>2020-05-11 (10 days) | 0.97 | < 1e-3 | 1845 | 30344
[Austria](#Austria) | 152.48 days | 2020-05-02 to<br>2020-05-11 (10 days) | 0.98 | < 1e-3 | 620 | 15882
[Australia](#Australia) | 238.07 days | 2020-05-02 to<br>2020-05-11 (10 days) | 0.62 | 0.007 | 97 | 6970
[Korea, South](#Korea,-South) | 257.19 days | 2020-05-02 to<br>2020-05-11 (10 days) | 0.79 | < 1e-3 | 258 | 10936
[China](#China) | NA | NA | NA | NA | 4637 | 84011
[Nepal](#Nepal) | NA | NA | NA | NA | 0 | 134

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

