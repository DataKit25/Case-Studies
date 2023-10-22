-- DATA ANALYSIS

-- Listing the types of Bikes used by the useres
SELECT member_casual, rideable_type, 
COUNT (*) AS trips_total
FROM `case-study-401916.cyclistic.cleaned_combined_tripdata`
GROUP BY member_casual,rideable_type 
ORDER BY trips_total, member_casual; 
-----------------------------------------------------
/* Counting the how many of the users are members,
and how many are casual users. */

SELECT member_casual, 
COUNT (ride_id) AS no_of_users
FROM `case-study-401916.cyclistic.cleaned_combined_tripdata`
GROUP BY member_casual; -- casual : 1,739,102 , member : 2,988,459
-----------------------------------------------------
-- Calcualting the max ride_length

SELECT MAX (ride_length) AS max_ride_length
FROM `case-study-401916.cyclistic.cleaned_combined_tripdata`;
-----------------------------------------------------
-- Calculating the mode of week_days

SELECT week_days AS mode_days
FROM `case-study-401916.cyclistic.cleaned_combined_tripdata`
GROUP BY week_days
HAVING COUNT (*) = (
  SELECT MAX(mode_days_count)
  FROM(
    SELECT week_days, COUNT (*) as mode_days_count
    FROM `case-study-401916.cyclistic.cleaned_combined_tripdata`
    GROUP BY week_days
  )
);

-----------------------------------------------------
-- Rides per cutomer per hour

SELECT EXTRACT(HOUR FROM started_at) AS hours_per_day, member_casual, 
COUNT (ride_id) AS trips_total
FROM `case-study-401916.cyclistic.cleaned_combined_tripdata`
GROUP BY hours_per_day, member_casual
ORDER BY member_casual;

-- Rides per customer per day in a week 

SELECT week_days, member_casual, 
COUNT (ride_id) as trips_total
FROM `case-study-401916.cyclistic.cleaned_combined_tripdata`
GROUP BY week_days, member_casual
ORDER BY member_casual;

-- Rides per customer per month

SELECT month, member_casual,
COUNT(ride_id) AS trips_total
FROM `case-study-401916.cyclistic.cleaned_combined_tripdata`
GROUP BY month, member_casual
ORDER BY member_casual; 
-----------------------------------------------------
-- Calculating the average ride_length

-- per hour
SELECT EXTRACT (HOUR FROM started_at) AS ride_per_hour, member_casual, 
AVG(ride_length) AS avg_ride_span
FROM `case-study-401916.cyclistic.cleaned_combined_tripdata`
GROUP BY ride_per_hour, member_casual; 

-- per day 
SELECT week_days, member_casual, 
AVG(ride_length) AS avg_ride_span
FROM `case-study-401916.cyclistic.cleaned_combined_tripdata`
GROUP BY week_days, member_casual; 

-- per month
SELECT month, member_casual,
AVG(ride_length) AS avg_ride_span
FROM `case-study-401916.cyclistic.cleaned_combined_tripdata`
GROUP BY month, member_casual; 
-----------------------------------------------------
-- Most used starting and ending stations on average

-- Locations of the starting stations 
SELECT start_station_name, member_casual,
AVG(start_lat) AS avg_start_lat,
AVG(start_lng) AS avg_start_lng,
COUNT (ride_id) AS trips_total
FROM `case-study-401916.cyclistic.cleaned_combined_tripdata`
GROUP BY start_station_name, member_casual;  

-- Locations of the ending stations
SELECT end_station_name, member_casual, 
AVG(end_lat) AS avg_end_lat, 
AVG(end_lng) AS avg_end_lng, 
COUNT (ride_id) AS trips_total
FROM `case-study-401916.cyclistic.cleaned_combined_tripdata`
GROUP BY end_station_name, member_casual;
-----------------------------------------------------

-- Additional queries to aid in analysis of the data

SELECT DISTINCT member_casual,EXTRACT (HOUR FROM started_at) AS hour, rideable_type, month,week_days, COUNT(*) AS trips_total
FROM `case-study-401916.cyclistic.cleaned_combined_tripdata`
GROUP BY member_casual, rideable_type, month, week_days, hour
ORDER BY member_casual, rideable_type;
