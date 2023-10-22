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

