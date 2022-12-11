
CREATE TABLE IF NOT EXISTS hourly_weather (
   hourId INTEGER PRIMARY KEY,
   day DATE,
   hour INTEGER,
   HourlyWindSpeed FLOAT,
   HourlyPrecipitation FLOAT
);

CREATE TABLE IF NOT EXISTS daily_weather (
   dayId INTEGER PRIMARY KEY,
   day DATE,
   HourlyWindSpeed FLOAT,
   HourlyPrecipitation FLOAT
);

CREATE TABLE IF NOT EXISTS taxi_trips (
   taxiId INTEGER PRIMARY KEY,
   tpep_pickup_datetime DATETIME,
   tpep_dropoff_datetime DATETIME,
   passenger_count INTEGER,
   trip_distance FLOAT,
   PULocationID INTEGER,
   DOLocationID INTEGER,
   fare_amount FLOAT,
   tip_amount FLOAT,
   total_amount FLOAT,
   pickup_longitude FLOAT,
   pickup_latitude FLOAT,
   dropoff_longitude FLOAT,
   dropoff_latitude FLOAT
);

CREATE TABLE IF NOT EXISTS uber_trips (
   uberId INTEGER PRIMARY KEY,
   fare_amount FLOAT,
   pickup_datetime DATETIME,
   pickup_longitude FLOAT,
   pickup_latitude FLOAT,
   dropoff_longitude FLOAT,
   dropoff_latitude FLOAT,
   passenger_count INTEGER,
   distance FLOAT
);
