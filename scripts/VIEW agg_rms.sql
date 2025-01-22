-- DROP VIEW ap_workouts.
--CREATE OR REPLACE VIEW ap_workouts. AS
WITH cte_exercisegroups AS (
	SELECT
		exercise_id
		, exercise_name
		, equipment
		--, muscle_group
		, exercise_group
		, measure
	FROM ap_workouts.view_agg_completesets
	GROUP BY 1, 2, 3, 4, 5
), cte_3sets AS (
	SELECT
		*
	FROM ap_workouts.view_agg_completesets
	WHERE sets_total = 3
), cte_10rm3sets AS (
	SELECT
		exercise_id
		, workout_id
		, workout_start_time
		--, exercise_number
		--, exercise_name
		--, equipment
		--, exercise_group
		--, measure
		, MAX(weight_min) AS "max_weight"
		, RANK() OVER(PARTITION BY exercise_id ORDER BY MAX(weight_min) DESC, workout_start_time) AS "rm_rank"
	FROM cte_3sets
	WHERE
		quantity_min >= 10
	GROUP BY 1, 2, 3
	--ORDER BY 1 ASC, 4 DESC, 3 ASC
	--HAVING weight_min = (SELECT MAX(weight_min) FROM cte_3sets)
), cte_final AS (
	SELECT
		cte_exercisegroups.*
		, cte_10rm3sets.workout_start_time::DATE AS "date_10rm"
		, cte_10rm3sets.max_weight AS "maxweight_10rm"
		--, cte_10rm3sets.rm_rank
	FROM cte_exercisegroups
	LEFT JOIN cte_10rm3sets
		ON cte_exercisegroups.exercise_id = cte_10rm3sets.exercise_id
	WHERE
		cte_10rm3sets.rm_rank = 1
		OR rm_rank IS NULL
	ORDER BY 1
)
SELECT * FROM cte_final



SELECT
	workout_id
	, exercise_number
	, exercise_id
	, exercise_name
	, equipment
	, exercise_group
	, measure
	, weight_min
	, weight_max
	, weight_avg
	, weight_stdev
	--, totalweight_min
	--, totalweight_max
	--, totalweight_avg
	--, totalweight_stdev
FROM ap_workouts.view_agg_completesets