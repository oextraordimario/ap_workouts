-- DROP VIEW ap_workouts.view_agg_completesets CASCADE
CREATE OR REPLACE VIEW ap_workouts.view_agg_completesets AS
SELECT
	workout_id
	, exercise_number
	, workout_start_time
	, workout_end_time
	, workout_duration_min
	, exercise_id
	, exercise_name
	, equipment
	, muscle_group
	, exercise_group
	, goal
	, measure
	, MAX(set_number)::INT AS "sets_total"
	-- WEIGHT
	, MIN(weight) AS "weight_min"
	, MAX(weight) AS "weight_max"
	, ROUND(AVG(weight), 1) AS "weight_avg"
	, ROUND(STDDEV(weight), 1) AS "weight_stdev"
	-- TOTAL WEIGHT
	, MIN(total_weight) AS "totalweight_min"
	, MAX(total_weight) AS "totalweight_max"
	, ROUND(AVG(total_weight), 1) AS "totalweight_avg"
	, ROUND(STDDEV(total_weight), 1) AS "totalweight_stdev"
	-- QUANTITY
	, MIN(quantity) AS "quantity_min"
	, MAX(quantity) AS "quantity_max"
	, ROUND(AVG(quantity), 1) AS "quantity_avg"
	, ROUND(STDDEV(quantity), 1) AS "quantity_stdev"
	, SUM(quantity) AS "quantity_total"
	-- VOLUME
	, MIN(volume) AS "volume_min"
	, MAX(volume) AS "volume_max"
	, ROUND(AVG(volume), 1) AS "volume_avg"
	, ROUND(STDDEV(volume), 1) AS "volume_stdev"
	, SUM(volume) AS "volume_total"
FROM ap_workouts.view_obt_everyset
GROUP BY 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12
ORDER BY 1 ASC, 2 ASC