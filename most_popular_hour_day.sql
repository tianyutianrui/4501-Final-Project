
SELECT STRFTIME('%H', tpep_pickup_datetime) as hour, COUNT(*) as ORDERPERHOUR
FROM taxi_trips
GROUP BY STRFTIME('%H', tpep_pickup_datetime)
