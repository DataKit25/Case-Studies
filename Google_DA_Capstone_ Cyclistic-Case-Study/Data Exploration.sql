-- Checking the data type for each column--

SELECT 
  column_name, 
  data_type
FROM `case-study-401916.cyclistic.INFORMATION_SCHEMA.COLUMNS` 
WHERE
  table_name = 'combined_tripdata';


-- Checking for the number of NULL values
SELECT
  COUNTIF(ride_id IS NULL) AS ride_id_null_count,
  COUNTIF(rideable_type IS NULL) AS rideable_type_null_count,
  COUNTIF(started_at IS NULL) AS started_at_null_count,
  COUNTIF(ended_at IS NULL) AS ended_at_null_count,
  COUNTIF(start_station_name IS NULL) AS start_station_name_null_count,
  COUNTIF(start_station_id IS NULL) AS start_station_id_null_count,
  COUNTIF(end_station_name IS NULL) AS end_station_name_null_count,
  COUNTIF(end_station_id IS NULL) AS end_station_id_null_count,
  COUNTIF(start_lat IS NULL) AS start_lat_null_count,
  COUNTIF(start_lng IS NULL) AS start_lng_null_count,
  COUNTIF(end_lat IS NULL) AS end_lat_null_count,
  COUNTIF(end_lng IS NULL) AS end_lng_null_count,
  COUNTIF(member_casual IS NULL) AS member_casual_null_count
FROM
  `case-study-401916.cyclistic.combined_tripdata`;
  /* No. of Null values count
    start_station_name : 976,966
    start_station_id : 977,098
    end_station_name : 1,037,345
    end_station_id : 1,037,486
    end_lat : 7,354
    end_lng : 7,354 */

-- Checking for duplicate values 
SELECT COUNT(ride_id) - COUNT(DISTINCT ride_id) AS duplicate_rows
FROM `case-study-401916.cyclistic.combined_tripdata`; -- We have 0 duplicate rows

-- Counting the duplicate rows based on the ride_id 

SELECT ride_id, COUNT(ride_id) as count
FROM `case-study-401916.cyclistic.combined_tripdata`
GROUP BY ride_id
HAVING COUNT(ride_id) > 1;

-- Checking for NULL values  
--Start station name
SELECT 
COUNT (ride_id) AS ss_name_null
FROM `case-study-401916.cyclistic.combined_tripdata`
WHERE start_station_name IS NULL; -- 976,966 NULL values
-- End station name
SELECT
COUNT (ride_id) AS es_name_null
FROM `case-study-401916.cyclistic.combined_tripdata`
WHERE end_station_name IS NULL; -- 1,037,345 NULL values
-- Start station id
SELECT COUNT (ride_id) AS ss_id_null
FROM `case-study-401916.cyclistic.combined_tripdata`
WHERE start_station_id IS NULL; -- 977,098 NULL values

-- End station id
SELECT COUNT (ride_id) AS es_id_null
FROM `case-study-401916.cyclistic.combined_tripdata`
WHERE end_station_id IS NULL; -- 1,037,486 NULL values

-- start_lat and start_lng
SELECT 
  SUM(CASE WHEN start_lat IS NULL THEN 1 ELSE 0 END) AS s_lat_null,
  SUM(CASE WHEN start_lng IS NULL THEN 1 ELSE 0 END) AS s_lng_null
FROM `case-study-401916.cyclistic.combined_tripdata`; -- No NULL values

-- end_lat and end_lng
SELECT 
  SUM(CASE WHEN end_lat IS NULL THEN 1 ELSE 0 END) AS e_lat_null,
  SUM(CASE WHEN end_lng IS NULL THEN 1 ELSE 0 END) AS e_lng_null
FROM `case-study-401916.cyclistic.combined_tripdata`; -- end_lat: 7,354 & end_lng: 7,354 NULL values

--------------------------------------------------------------------------------------------
-- Checking the various rideable types

SELECT DISTINCT rideable_type, COUNT (rideable_type) AS trip_count
FROM `case-study-401916.cyclistic.combined_tripdata`
GROUP BY rideable_type; 

/* electric_bike : 3,372,640
   classic_bike : 2,884,560
   docked_ bike : 118,538 
*/

-- Checking how many rides lasted over a day, and which were shorter 
SELECT started_at, ended_at
FROM `case-study-401916.cyclistic.combined_tripdata`
LIMIT 50;

-- Trip lengths 

SELECT
  COUNT(*) AS total_rides,
  COUNTIF(TIMESTAMP_DIFF(ended_at, started_at, SECOND) >= 86400) AS rides_over_one_day,
  COUNTIF(TIMESTAMP_DIFF(ended_at, started_at, SECOND) < 60) AS rides_less_than_minute
FROM `case-study-401916.cyclistic.combined_tripdata`;

-- Counting how many 'member' and 'casual'

SELECT member_casual ,
COUNT (member_casual)  AS no_of_trips
FROM `case-study-401916.cyclistic.combined_tripdata`
GROUP BY member_casual; -- 2,383,396 casual users, 3,992,342 members

-- AVG ride time member_casual
WITH ride_data AS (
  SELECT
    member_casual,
    AVG(TIMESTAMP_DIFF(ended_at, started_at, SECOND)) AS avg_ride_length_seconds
  FROM
    `case-study-401916.cyclistic.combined_tripdata`
  WHERE
    started_at IS NOT NULL
    AND ended_at IS NOT NULL
  GROUP BY
    member_casual
)

SELECT
  member_casual,
  avg_ride_length_seconds,
  FLOOR(avg_ride_length_seconds / 3600) AS avg_ride_length_hours,
  FLOOR((avg_ride_length_seconds - (FLOOR(avg_ride_length_seconds / 3600) * 3600)) / 60) AS avg_ride_length_minutes
FROM
  ride_data;

-- Who takes more rides per month
SELECT
  member_casual,
  EXTRACT( MONTH FROM started_at) AS ride_month,
  COUNT(*) AS total_rides
FROM `case-study-401916.cyclistic.combined_tripdata`
WHERE member_casual IS NOT NULL
GROUP BY member_casual, ride_month;


-- Looking for the most pouplar start station 
SELECT start_station_name,
COUNT (*) AS ride_count
FROM `case-study-401916.cyclistic.combined_tripdata`
WHERE start_station_name IS NOT NULL
GROUP BY start_station_name  
ORDER BY ride_count DESC
LIMIT 10;

-- Looking for the most popular end station 

SELECT end_station_name, 
COUNT (*) AS end_ride_count
FROM `case-study-401916.cyclistic.combined_tripdata`
WHERE end_station_name IS NOT NULL 
GROUP BY end_station_name
ORDER BY end_ride_count DESC
LIMIT 10;

-- Searching for the most popular route

SELECT start_station_name, end_station_name, COUNT(*) AS route_count
FROM `case-study-401916.cyclistic.combined_tripdata`
WHERE start_station_name IS NOT NULL AND end_station_name IS NOT NULL
GROUP BY start_station_name, end_station_name
ORDER BY route_count DESC
LIMIT 10;

