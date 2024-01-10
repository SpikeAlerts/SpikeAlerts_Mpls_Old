-- Show coverage (1km buffer, can change 1000 to 1609 for 1 mile)

with buff as
	(
	SELECT ST_Transform(
			ST_Buffer(
			ST_Transform(s.geometry,26915),
					1000),
					4326) as geom 
	FROM internal."PurpleAir Stations" s
	WHERE s.channel_state = 3 AND s.channel_flags = 0
	)
SELECT ST_UNION(geom) as coverage
FROM buff;

-- All the tablenames 

-- "Sign Up Information"
-- "PurpleAir Stations"
-- "Active Alerts Acute PurpleAir"
--  "Archived Alerts Acute PurpleAir"
-- "Reports Archive"
-- "Daily Log"

-- This shows all the active alerts at each station

WITH alerts as
(
	SELECT start_time, max_reading, 
			sensor_indices[1] as sensor_index
	FROM internal."Active Alerts Acute PurpleAir"
)
SELECT a.sensor_index, a.start_time, p.last_elevated, a.max_reading, p.geometry
FROM alerts a
INNER JOIN "PurpleAir Stations" p ON (p.sensor_index = a.sensor_index);

-- This shows a summary of the alerts at each station beyond a specified date

WITH alerts as
(
	SELECT COUNT(start_time) as count, ARRAY_AGG(start_time) as start_time, 
			AVG(duration_minutes) as duration_minutes, 
			MAX(max_reading) as max_reading, 
			sensor_indices[1] as sensor_index
	FROM internal."Archived Alerts Acute PurpleAir"
	WHERE start_time > DATE('2023-11-25')
	GROUP BY sensor_indices[1]
)
SELECT a.sensor_index, a.count, a.start_time, a.duration_minutes, a.max_reading, p.geometry
FROM alerts a
INNER JOIN internal."PurpleAir Stations" p ON (p.sensor_index = a.sensor_index);
