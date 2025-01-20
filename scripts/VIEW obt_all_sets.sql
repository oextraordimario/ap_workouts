-- DROP VIEW ap_workouts.view_obt_everyset CASCADE
CREATE OR REPLACE VIEW ap_workouts.view_obt_everyset AS
SELECT
	"sets".id
	, "sets".workout_id
	, workouts.start_time AS "workout_start_time"
	, workouts.end_time AS "workout_end_time"
	, workouts.duration AS "workout_duration_min"
	, "sets".exercise_name
	, "sets".equipment
	, exercises.muscle_group
	, exercises.exercise_group
	, "sets".goal
	, "sets".measure
	, "sets".exercise_number
	, "sets".set_number
	, "sets".weight
	, "sets".total_weight
	, "sets".quantity
	, "sets".volume
FROM ap_workouts.gold_fact_sets AS "sets"
LEFT JOIN ap_workouts.gold_dim_exercisesref AS "exercises"
	ON "sets".exercise_id = exercises.id
LEFT JOIN ap_workouts.gold_dim_workouts AS "workouts"
	ON "sets".workout_id = workouts.id
ORDER BY 1 ASC
	
	--, workouts.day_name
	--, workouts.day_number
	--, workouts.week_number
	--, workouts.plan_name
	--, workouts.plan_function
	--, "sets".exercise_id
	--, "sets".workout_id
	--, exercises.id
	--, exercises.custom_exercise
	--, exercises.exercise_name
	--, exercises.equipment
	--, exercises.main_muscle
	--, exercises.auxiliary_muscles
	--, exercises.size
	--, exercises.metrics
	--, exercises.bodyweight
	--, exercises.notes
