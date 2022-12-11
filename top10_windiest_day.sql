

SELECT substr(hired_data.pickup_datetime,0,11), COUNT(*) 

FROM(
        SELECT tpep_pickup_datetime as pickup_datetime, trip_distance as distance 
        FROM taxi_trips WHERE STRFTIME('%Y', tpep_pickup_datetime) = '2014'
        UNION ALL
        SELECT pickup_datetime, distance 
        FROM uber_trips WHERE STRFTIME('%Y', pickup_datetime) = '2014'
)
as hired_data 
INNER JOIN daily_weather
ON STRFTIME('%Y', hired_data.pickup_datetime) = STRFTIME('%Y', daily_weather.day) 
AND STRFTIME('%j', hired_data.pickup_datetime) = STRFTIME('%j', daily_weather.day) 
GROUP BY STRFTIME('%j', hired_data.pickup_datetime) 
ORDER BY daily_weather.HourlyWindSpeed  DESC
LIMIT 10
