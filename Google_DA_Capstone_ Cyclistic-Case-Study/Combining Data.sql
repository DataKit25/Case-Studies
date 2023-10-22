-- Combining data from September 2022 to September 2023

CREATE TABLE cyclistic.combined_tripdata AS (

  SELECT * FROM `case-study-401916.cyclistic.2022_09_tripdata`
  UNION ALL
  SELECT * FROM `case-study-401916.cyclistic.2022_10_tripdata`
  UNION ALL 
  SELECT * FROM `case-study-401916.cyclistic.2022_11_tripdata`
  UNION ALL
  SELECT * FROM `case-study-401916.cyclistic.2022_12_tripdata`
  UNION ALL
  SELECT * FROM `case-study-401916.cyclistic.2023_01_tripdata`
  UNION ALL
  SELECT * FROM `case-study-401916.cyclistic.2023_02_tripdata`
  UNION ALL
  SELECT * FROM `case-study-401916.cyclistic.2023_03_tripdata`
  UNION ALL
  SELECT * FROM `case-study-401916.cyclistic.2023_04_tripdata`
  UNION ALL
  SELECT * FROM `case-study-401916.cyclistic.2023_05_tripdata`
  UNION ALL 
  SELECT * FROM `case-study-401916.cyclistic.2023_06_tripdata`
  UNION ALL 
  SELECT * FROM `case-study-401916.cyclistic.2023_07_tripdata`
  UNION ALL
  SELECT * FROM `case-study-401916.cyclistic.2023_08_tripdata`
  UNION ALL
  SELECT * FROM `case-study-401916.cyclistic.2023_09_tripdata`
) -- 12,354,469 rows returned 
