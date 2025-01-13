-- DROP TABLE ap_workouts.gold_dim_exercisesref
CREATE TABLE ap_workouts.gold_dim_exercisesref (
	id TEXT,
	custom_exercise BOOL,
	exercise_name TEXT,
	equipment TEXT,
	muscle_group TEXT,
	exercise_group TEXT,
	main_muscle TEXT,
	auxiliary_muscles TEXT,
	size TEXT,
	metrics TEXT,
	bodyweight TEXT,
	notes TEXT,
	PRIMARY KEY (id)
)