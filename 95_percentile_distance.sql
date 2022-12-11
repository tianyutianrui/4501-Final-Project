
SELECT hired_data.distance AS '95% distance'
FROM 
(
SELECT tpep_pickup_datetime as pickup_datetime, trip_distance as distance 
FROM taxi_trips WHERE STRFTIME('%Y', tpep_pickup_datetime) = '2013' AND STRFTIME('%m', tpep_pickup_datetime) = '07'
UNION ALL
SELECT pickup_datetime,distance 
FROM uber_trips WHERE STRFTIME('%Y', pickup_datetime) = '2013' AND STRFTIME('%m', pickup_datetime) = '07'
) as hired_data  
ORDER BY hired_data.distance ASC
LIMIT 1
OFFSET (SELECT
         COUNT(*)
        FROM (
            SELECT tpep_pickup_datetime as pickup_datetime, trip_distance as distance 
            FROM taxi_trips WHERE STRFTIME('%Y', tpep_pickup_datetime) = '2013' AND STRFTIME('%m', tpep_pickup_datetime) = '07'
            UNION ALL
            SELECT pickup_datetime, distance 
            FROM uber_trips WHERE STRFTIME('%Y', pickup_datetime) = '2013' AND STRFTIME('%m', pickup_datetime) = '07'
             ) as hired_data  
        ) * 95 / 100 - 1;
