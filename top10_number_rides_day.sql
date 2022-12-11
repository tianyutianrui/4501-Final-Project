
SELECT substr(hired_data.pickup_datetime,0,11), COUNT(*), AVG(hired_data.distance) 
FROM 
(
    SELECT tpep_pickup_datetime as pickup_datetime, trip_distance as distance 
    FROM taxi_trips WHERE STRFTIME('%Y', tpep_pickup_datetime) = '2009'
    UNION ALL
    SELECT pickup_datetime, distance 
    FROM uber_trips WHERE STRFTIME('%Y', pickup_datetime) = '2009'
)as hired_data GROUP BY STRFTIME('%j', hired_data.pickup_datetime) 
HAVING COUNT(*) IN (  SELECT COUNT(*)
    FROM 
    (
        SELECT tpep_pickup_datetime as pickup_datetime, trip_distance as distance 
        FROM taxi_trips WHERE STRFTIME('%Y', tpep_pickup_datetime) = '2009'
        UNION ALL
        SELECT pickup_datetime, distance 
        FROM uber_trips WHERE STRFTIME('%Y', pickup_datetime) = '2009'
    )as hired_data 
    GROUP BY STRFTIME('%j', hired_data.pickup_datetime)
    ORDER BY count(*) DESC
    LIMIT 10);
