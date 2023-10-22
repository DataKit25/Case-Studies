-- DATA CLEANING 

CREATE OR REPLACE TABLE `case-study-401916.cyclistic.cleaned_combined_tripdata` AS (
  SELECT
    DISTINCT (a.ride_id), 
    rideable_type, started_at, ended_at, ride_length,
    CASE EXTRACT(DAYOFWEEK FROM started_at) -- Extracting the Days from 'started_at' to aid in Data VIZ
        WHEN 1 THEN 'Su'
        WHEN 2 THEN 'Mo'
        WHEN 3 THEN 'Tu'
        WHEN 4 THEN 'We'
        WHEN 5 THEN 'Th'
        WHEN 6 THEN 'Fr'
        WHEN 7 THEN 'Sa'    
      END AS week_days,
    CASE
      EXTRACT(MONTH FROM started_at)  -- Extracting the Months from 'started_at' to aid in Data VIZ
        WHEN 1 THEN 'JAN'
        WHEN 2 THEN 'FEB'
        WHEN 3 THEN 'MAR'
        WHEN 4 THEN 'APR'
        WHEN 5 THEN 'MAY'
        WHEN 6 THEN 'JUN'
        WHEN 7 THEN 'JUL'
        WHEN 8 THEN 'AUG'
        WHEN 9 THEN 'SEP'
        WHEN 10 THEN 'OCT'
        WHEN 11 THEN 'NOV'
        WHEN 12 THEN 'DEC'
    END AS month,
    start_station_name, 
    end_station_name, 
    start_lat, 
    start_lng, 
    end_lat, 
    end_lng, 
    member_casual
    FROM `case-study-401916.cyclistic.combined_tripdata` a 
    JOIN (
      SELECT DISTINCT(ride_id), 
      (
        TIMESTAMP_DIFF(TIMESTAMP(ended_at), TIMESTAMP(started_at), SECOND) / 60 
      ) AS ride_length -- joining 'ride_length' to the main table 'cleaned_combined_tripdata'
      FROM `case-study-401916.cyclistic.combined_tripdata`
    ) table2
    ON a.ride_id = table2.ride_id
    WHERE 
    start_station_name IS NOT NULL AND
    end_station_name IS NOT NULL AND
    end_lat IS NOT NULL AND
    end_lng IS NOT NULL AND
    ride_length > 1 AND ride_length < 1440
);


-- Checking for row count

SELECT COUNT(ride_id) AS no_of_rows 
FROM `case-study-401916.cyclistic.combined_tripdata` -- 4,727,561 rows returned, 1,646,177 excluded from 6,375,738 rows 
