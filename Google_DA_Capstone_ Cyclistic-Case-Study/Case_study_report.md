## Cyclistic : A Google Data Analytics Capstone Case Study
Course : <a href="https://www.coursera.org/learn/google-data-analytics-capstone?specialization=google-data-analytics">Google Data Analytics Capstone - Complete a Case Study</a>

### Introduction 
I assume the role of a Jr. Data Analyst in a fictional company, Cyclistic, to undertake this case study. In onrder to answer the key business questions, carefully following the data analysis process: Ask, Prepare, Process, Analyse, Share, and Act. 

### Important Links: 
Data source : <a href="https://divvy-tripdata.s3.amazonaws.com/index.html">divvy-tripdata</a>; <br>[Last accesed on 13.10.2023] <br> 

SQL Queries: 
* <a href="https://github.com/DataKit25/Case-Studies/blob/main/Google_DA_Capstone_%20Cyclistic-Case-Study/Combining%20Data.sql">Combinig Data
* <a href="https://github.com/DataKit25/Case-Studies/blob/main/Google_DA_Capstone_%20Cyclistic-Case-Study/Data%20Exploration.sql">Data Exploration
* <a href="https://github.com/DataKit25/Case-Studies/blob/main/Google_DA_Capstone_%20Cyclistic-Case-Study/Data%20Cleaning.sql"> Data Cleaning
* <a href="https://github.com/DataKit25/Case-Studies/blob/main/Google_DA_Capstone_%20Cyclistic-Case-Study/Data%20Analysis.sql">Data Analysis
* Data Visualisation 

### Background 

#### Cyclistic

Cyclistic introduced its bike-share program in 2016, launching a network of 5,824 bicycles spread across 692 strategically located stations throughout Chicago. This innovative system allowed riders the convenience of unlocking bikes from one station and seamlessly returning them to any other station, offering unparalleled mobility.<br>
Up to this point, Cyclistic's marketing approach had been focused on raising general awareness and attracting a wide array of consumer segments. Their marketing strategy had thrived on flexible pricing plans, catering to various needs through single-ride passes, full-day passes, and enticing annual memberships. Two distinct customer categories had emerged - "casual riders" purchasing single-ride or full-day passes, and "Cyclistic members" who invested in annual memberships.<br>
While the flexibility in pricing plans enabled Cyclistic to reach a larger customer base, financial analysis by Cyclistic's finance team revealed a compelling insight: annual members outshined casual riders in terms of profitability. This discovery had significant implications for future strategy. Instead of directing marketing campaigns solely toward new customers, the focus shifted to converting casual riders into long-term members. It was a promising avenue as these casual riders were already acquainted with Cyclistic, choosing it as their preferred mobility solution.<br>
Guided by Lily Moreno, Director of Marketing, Cyclistic set a definitive goal: crafting innovative marketing strategies to transition casual riders into loyal annual members. To accomplish this, the marketing analyst team understood that they needed a deeper understanding of the distinctions between annual members and casual riders, the motivations that could prompt casual riders to embrace annual memberships, and the role of digital media in augmenting marketing endeavors. A thorough analysis of Cyclistic's historical bike trip data would be pivotal in achieving these objectives.<br>
This shift in focus, from broad marketing strategies to personalized conversions, represents a significant milestone in Cyclistic's journey to create a thriving and diverse community of bike riders in the vibrant city of Chicago.<br>

#### Scenario

The primary objective is to unravel the distinctive behaviors of casual riders and annual members as they engage with Cyclistic bikes. Armed with these invaluable insights, our team aims to craft a fresh and highly targeted marketing strategy, one that can effectively transform casual riders into devoted annual members. However, there's one significant hurdle we must overcome. The innovative marketing strategies we conceive must secure the seal of approval from Cyclistic's discerning executives. To earn their endorsement, our recommendations must be substantiated with compelling data insights and presented through polished and professional data visualizations. Our mission is to demonstrate not just the potential, but the certainty, of our strategies to drive Cyclistic's growth and success.

### Ask 
#### Business Task
Create marketing tactics to transform casual rides into annual members 

#### Analysis Questions

Three questions will guide the future marketing program:
* How do annual members and casual riders use Cyclistic bikes differently?
* Why would casual riders buy Cyclistic annual memberships?
* How can Cyclistic use digital media to influence casual riders to become members?
  
Moreno has assigned me the first question to answer: How do annual members and casual riders use Cyclistic bikes differently?

### Prepare 
#### Data Source
The data was downloaded from Data source : <a href="https://divvy-tripdata.s3.amazonaws.com/index.html">divvy-tripdata</a>, which has Cyclistic historic trip data. Initially I tried using the entire data set from Jan 2020 to Sep 2023, but that tested the limits of the tools at hand. Thus I decided to use the data from September of 2022 to September or 2023, data spannig over one year. <br>
The Data is made available by Motivate International Inc. under the following <a href="https://divvybikes.com/data-license-agreement">license.

#### Data Organization
There are a dozen files named in the format YYYYMM-divvy-tripdata, each containing data for a specific month. These files encompass information such as ride identification, bike type, start and end times, station names, station IDs, geographical coordinates, and rider membership status. The corresponding column headers are as follows: ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, and member_casual.

### Process

BigQuery used to combine the 12 dataset into one, futher it was also used to cleaned. 
Reason for using BigQuery: 
Excel or Google Sheets have a limit of 1.04 milliom rows and  2 million respectively,  and the combined data has a row conut of 6.3  million. 

#### Combining the Data
SQL Query : <a href="https://github.com/DataKit25/Case-Studies/blob/main/Google_DA_Capstone_%20Cyclistic-Case-Study/Combining%20Data.sql">Combinig Data</a>. <br>
The 12 datasets are uploaded to BigQuery as, ' 2022_09_tripdata', and so on till 2023_09. 
These are combined into a table named 'combined_tripdata', containing 6,375,738 rows. 

#### Exploring the Data
SQL Query :  <a href="https://github.com/DataKit25/Case-Studies/blob/main/Google_DA_Capstone_%20Cyclistic-Case-Study/Data%20Exploration.sql">Data Exploration</a> <br>
I decided to familiarise myself with the data, to make data cleaining as efficient and perfect as possible. 

Steps to understand the data I am working with: 
* Checking for the number of NULL values
* Checking for duplicate values
* Checking if there are any duplicate ***'ride_id'***
* Checking for NULL values for specific columns: 
  * Start station name
  * End station name
  * Start station id
  * End station id
  * Start latitude and longitude
  * End latitude and longitude
* Checking for the various rideable types
* Checking for how many rides lasted over a day and shortet than a minute.
* Trip lengths
* Counting the total number of 'members' and 'casual'
* Average ride time **member_casual**
* Checking for which member takes more rides per month
* Looking for the most popular start stations
* Looking for the most popular end stations
* Looking for the most popular route

Further the columns that needed to be removed are : 'start_station_name', 'start_station_id', 'end_station_name', 'end_station_id', 'end_lat', 'end_lng',  as these columns have multiple NULL values which do not help in the analysis. 

#### Cleaning the Data

SQL Query : <a href="https://github.com/DataKit25/Case-Studies/blob/main/Google_DA_Capstone_%20Cyclistic-Case-Study/Data%20Cleaning.sql"> Data Cleaning </a> <br>
Here the following things are being taken care of: 
* The rows with the NULL values are reomved.
* Columns **'ride_length'** for trip duration, **'week_days'**, and **'month'** are added
* Furthermore, the trips lesser than a minute and longer than a day are not inculded.

### Analyse 

SQL Query : <a href="https://github.com/DataKit25/Case-Studies/blob/main/Google_DA_Capstone_%20Cyclistic-Case-Study/Data%20Analysis.sql">Data Analysis </a><br>

With the data cleaned, it can be used for the most crutial step of analysis. 

Using the data, I created two separate Dashboards:
* <a href="https://public.tableau.com/views/CyclisticCasestudyDB1/CyclisticDB1?:language=en-GB&:display_count=n&:origin=viz_share_link"> Dashboard 1 </a>
* <a href="https://public.tableau.com/views/CyclisticCasestudyDB2/CyclisticDB2?:language=en-GB&:display_count=n&:origin=viz_share_link"> Dashboard 1 </a>

** Dashboard 1 ** : <img width="1736" alt="DB1_v2" src="https://github.com/DataKit25/Case-Studies/assets/138516708/a5aaa259-41b5-447f-95a6-8f06a9ab8604"> <br>

** Dashboard 2 ** : <img width="1282" alt="Cyclistic DB2" src="https://github.com/DataKit25/Case-Studies/assets/138516708/c29f9d4b-581c-4992-8308-7b81eb13b79c"> <br>

Firstly we can see the spread of riders based on the bike type and the rider type: <br>
<img width="1339" alt="Bike_type_per_cus" src="https://github.com/DataKit25/Case-Studies/assets/138516708/1edb4847-6229-4719-9fc7-f2328ccb9b81"> <br>

**Rides per Hour**
![Rides per hour](https://github.com/DataKit25/Case-Studies/assets/138516708/c8cbad03-996d-4fc7-9bdd-a56fd93cf14f) <br>
Here we can see how for member users peaks at 8 AM  and then at 5 PM, while the biggest peak for casual users is only at 5 PM, the total trips gradually rises till the peak. <br>
While for memeber users there is a sharp dip after 8 AM, but the total trips are always higher than the causal members. 

** Avg rides per hour **
![Avg rides span per hour](https://github.com/DataKit25/Case-Studies/assets/138516708/a400787e-6440-48e5-953a-bf599731bf3c) <br>
The average ride span is highest between 9 AM to 4:30 PM for casual members, While the average ride span for member customers stays relatively flat, indicating that the bikes useage is fairly stable and presumably being used on a regural route. 

** Rides per day **
![Rides per day](https://github.com/DataKit25/Case-Studies/assets/138516708/5763c2e9-3d57-4d6f-8a39-93e56ebdbef7)

The total trips for members is highest between Monday and Thrusday, with a steadt decline from Thrusday to Saturday, the peak being on Thrusday. 
While for casual riders the trips go up grdually with the peak comming on Saturday. 

** Avg ride span per day **

![Avg ride span pre day](https://github.com/DataKit25/Case-Studies/assets/138516708/69826d59-4b42-4585-b4de-d6a0ef62b7f5)

Again in the graph that shows the average ride span per day we ca see that the ride span of the member riders stays flat
with a slight increase on Saturday and Sunday, indicating that the members use this serivice for dailt commute from a constant start station. <br>
While the trend for casual rides sees a dip in between Monday and Friday, with a gradual increase to the which falls on Saturday and Sunday. 

** Ride per month **

![Ride per month](https://github.com/DataKit25/Case-Studies/assets/138516708/5e983eb4-c42e-4104-bcc1-e7537ed7f5cf)


Here we can see the trend in total trips over the months, we ca see a big spke in the total trips in the month of September. This could be due a festival. 

** Avg ride span per month **

![Avg ride span per month](https://github.com/DataKit25/Case-Studies/assets/138516708/3509b5b8-48a9-48c9-b1dd-18c853df653c)

The average ride span for casual users is higher than that of the members, with a sustained high in between the months of April to September, with a slight dip in the month of June

** Top ten starting stations **
![Top ten starting stations](https://github.com/DataKit25/Case-Studies/assets/138516708/e6373da5-e895-44c4-b31b-84ddd7f0a0ff)

Here we have the locations of the top 10 starting stations 

** Popular starting stations ** 
![Popular starting stations](https://github.com/DataKit25/Case-Studies/assets/138516708/4f53344b-f66f-4b70-a2a5-989a73dd3b6b)

** Top ten ending stations **

![Top ten ending staions](https://github.com/DataKit25/Case-Studies/assets/138516708/6469aee1-dbd7-4e74-bc58-c66f844da7b2)

** Following are the trends per rideable types **

** Hourly trends **
![Hourly trip ternds by member and rideable type](https://github.com/DataKit25/Case-Studies/assets/138516708/7264a7d4-123b-4ce0-af33-028111e94abf) <br>

** Weekly trends ** 
![Weekly Trip trends by member and rideable type](https://github.com/DataKit25/Case-Studies/assets/138516708/d7a814b0-66be-4202-9c6a-a4a88594840c) <br> 

** Monthly trends **

![Monthly trip trends by member type and rideable type](https://github.com/DataKit25/Case-Studies/assets/138516708/6c8eeeeb-a2f5-4d5d-8fff-9448187b3d86)




