-- DROP VIEW ap_workouts.view_agg_completeworkouts
CREATE OR REPLACE VIEW ap_workouts.view_agg_completeworkouts AS
WITH cte1 AS (
	SELECT
		workout_id
		, workout_start_time
		, workout_end_time
		, workout_duration_min
		, measure
		, MAX(exercise_number::INT) AS "total_exercises"
		, SUM(sets_total) AS "total_sets"
		, CASE
			WHEN measure = 'reps' THEN SUM(quantity_total)
			ELSE 0
			END	AS "total_reps"
		, CASE
			WHEN measure = 'secs' THEN SUM(quantity_total)
			ELSE 0
			END	AS "total_secs"
		, SUM(volume_total) AS "total_volume"
	FROM ap_workouts.view_agg_completesets
	GROUP BY 1, 2, 3, 4, 5
)
SELECT
	workout_id
	, workout_start_time
	, workout_end_time
	, workout_duration_min
	--, measure
	, MAX(total_exercises) AS "total_exercises"
	, MAX(total_sets) AS "total_sets"
	, SUM(total_reps) AS "total_reps"
	, SUM(total_secs) AS "total_secs"
	, SUM(total_volume) AS "total_volume"
FROM cte1
GROUP BY 1, 2, 3, 4
ORDER BY 1 ASC

SELECT SUM(quantity_total) FROM ap_workouts.view_agg_completesets WHERE workout_id = '202310031424'