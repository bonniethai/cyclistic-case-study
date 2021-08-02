/* 
 * Cyclistic Case Study: Process
 * Author: Bao Nhi Thai
 * Date: August 1, 2021
 *
 * Note: driven-cabinet-313619.cyclistic_data.all_trips refers to the
 * dataset location on Google BigQuery workspace
 */


/*
 * Rows exist where timestamp of ended_at column is at earlier time
 * than started_at column.
 * Search for these records and delete them
 */
DELETE 
FROM `driven-cabinet-313619.cyclistic_data.all_trips`
WHERE ended_at < started_at


 -- Discover null values exist for start_lat and end_lat columns
SELECT 
    COUNT(*) AS null_exists
FROM `driven-cabinet-313619.cyclistic_data.trip_data_202012` 
WHERE start_lat IS NULL OR end_lat IS NULL

/*
 * Discover duplicates exist for start/end locations due to the decimal
 * places of latitude/longitude values
 *
 * Round latitude and longitude values for start and end locations
 */ 
 SELECT 
    COUNT(ride_id) AS rider_count,
    ROUND(end_lat, 3) AS lat,
    ROUND(end_lng, 3) AS long
FROM `driven-cabinet-313619.cyclistic_data.all_trips`
GROUP BY 2, 3
ORDER BY 1 DESC

