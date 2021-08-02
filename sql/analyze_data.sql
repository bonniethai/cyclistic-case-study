/* 
 * Cyclistic Case Study: Analysis
 * Author: Bao Nhi Thai
 * Date: August 1, 2021
 *
 * Note: driven-cabinet-313619.cyclistic_data.all_trips refers to the dataset 
 * location on Google BigQuery workspace 
 */

/*
 * Aggregate the 12 datasets for analysis
 *
 * Included columns: ride_id, started_at, ended_at, start_lat, start_lng,
 * end_lat, end_lng, member_casual
 *
 * Unneeded columns are omitted: rideable_type, start_station_name, 
 * start_station_id, end_station_name, end_station_id
 */
SELECT *
FROM 
(
    SELECT 
        ride_id,
        started_at,
        ended_at,
        start_lat,
        start_lng,
        end_lat,
        end_lng,
        member_casual
    FROM `driven-cabinet-313619.cyclistic_data.trip_data_202004`
    UNION ALL 
    SELECT 
        ride_id,
        started_at,
        ended_at,
        start_lat,
        start_lng,
        end_lat,
        end_lng,
        member_casual
    FROM `driven-cabinet-313619.cyclistic_data.trip_data_202005`
    UNION ALL 
    SELECT 
        ride_id,
        started_at,
        ended_at,
        start_lat,
        start_lng,
        end_lat,
        end_lng,
        member_casual
    FROM `driven-cabinet-313619.cyclistic_data.trip_data_202006`
    UNION ALL 
    SELECT 
        ride_id,
        started_at,
        ended_at,
        start_lat,
        start_lng,
        end_lat,
        end_lng,
        member_casual
    FROM `driven-cabinet-313619.cyclistic_data.trip_data_202007`
    UNION ALL 
    SELECT 
        ride_id,
        started_at,
        ended_at,
        start_lat,
        start_lng,
        end_lat,
        end_lng,
        member_casual
    FROM `driven-cabinet-313619.cyclistic_data.trip_data_202008`
    UNION ALL 
    SELECT 
        ride_id,
        started_at,
        ended_at,
        start_lat,
        start_lng,
        end_lat,
        end_lng,
        member_casual
    FROM `driven-cabinet-313619.cyclistic_data.trip_data_202009`
    UNION ALL 
    SELECT 
        ride_id,
        started_at,
        ended_at,
        start_lat,
        start_lng,
        end_lat,
        end_lng,
        member_casual
    FROM `driven-cabinet-313619.cyclistic_data.trip_data_202010`
    UNION ALL 
    SELECT 
        ride_id,
        started_at,
        ended_at,
        start_lat,
        start_lng,
        end_lat,
        end_lng,
        member_casual
    FROM `driven-cabinet-313619.cyclistic_data.trip_data_202011`
    UNION ALL 
    SELECT 
        ride_id,
        started_at,
        ended_at,
        start_lat,
        start_lng,
        end_lat,
        end_lng,
        member_casual
    FROM `driven-cabinet-313619.cyclistic_data.trip_data_202012`
    UNION ALL 
    SELECT 
        ride_id,
        started_at,
        ended_at,
        start_lat,
        start_lng,
        end_lat,
        end_lng,
        member_casual
    FROM `driven-cabinet-313619.cyclistic_data.trip_data_202101`
    UNION ALL 
    SELECT 
        ride_id,
        started_at,
        ended_at,
        start_lat,
        start_lng,
        end_lat,
        end_lng,
        member_casual
    FROM `driven-cabinet-313619.cyclistic_data.trip_data_202102`
    UNION ALL 
    SELECT 
        ride_id,
        started_at,
        ended_at,
        start_lat,
        start_lng,
        end_lat,
        end_lng,
        member_casual
    FROM `driven-cabinet-313619.cyclistic_data.trip_data_202103`
) 
AS all_trips

-- Count total riders (casual vs member) for each month of the year
SELECT 
    member_casual,
    COUNT(member_casual) AS rider_count,
    EXTRACT(MONTH FROM started_at) AS month
FROM `driven-cabinet-313619.cyclistic_data.all_trips`
GROUP BY 1, 3
ORDER BY 2 DESC

-- Count the numbers of casual vs member riders for each day of the week
SELECT
    member_casual,
    COUNT(member_casual) AS rider_count,
    FORMAT_DATE('%A', DATE(started_at)) AS day_of_week
FROM `driven-cabinet-313619.cyclistic_data.all_trips`
GROUP BY 3, 1
ORDER BY 3, 2 DESC

-- Calculate the average distance for trips made for each day of the week
SELECT 
    member_casual,
    FORMAT_DATE('%A', DATE(started_at)) AS day_of_week,
    AVG(ST_DISTANCE(ST_GEOGPOINT(start_lat, start_lng), 
        ST_GEOGPOINT(end_lat, end_lng))) AS avg_ride_distance
FROM `driven-cabinet-313619.cyclistic_data.all_trips`
GROUP BY 1, 2
ORDER BY 3 ASC

-- Calculate the average duration for trips made by casual riders and annual members
SELECT
    AVG(TIMESTAMP_DIFF(ended_at, started_at, MINUTE)) AS avg_ride_len,
    FORMAT_DATE('%A', DATE(started_at)) AS day_of_week,
    member_casual
FROM `driven-cabinet-313619.cyclistic_data.all_trips`
GROUP BY 3, 2
ORDER BY 2

