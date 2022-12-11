
SELECT COUNT(*),substr(hired_data.pickup_datetime,0,14), HourlyPrecipitation, HourlyWindSpeed  
FROM 
(
    SELECT tpep_pickup_datetime as pickup_datetime
    FROM taxi_trips WHERE STRFTIME('%Y', tpep_pickup_datetime) = '2012' AND STRFTIME('%m', pickup_datetime) = '10'
                            AND STRFTIME('%d', tpep_pickup_datetime) <= '30'  AND STRFTIME('%d', tpep_pickup_datetime) >= '22'
    UNION ALL
    SELECT pickup_datetime
    FROM uber_trips WHERE STRFTIME('%Y', pickup_datetime) = '2012' AND STRFTIME('%m', pickup_datetime) = '10'
        AND STRFTIME('%d', pickup_datetime) <= '30'  AND STRFTIME('%d', pickup_datetime) >= '22'
) as hired_data
INNER JOIN hourly_weather
ON STRFTIME('%d', hired_data.pickup_datetime) = STRFTIME('%d', hourly_weather.day) 
AND STRFTIME('%H', hired_data.pickup_datetime) = hourly_weather.hour
GROUP BY STRFTIME('%d', hired_data.pickup_datetime), STRFTIME('%H', hired_data.pickup_datetime);
