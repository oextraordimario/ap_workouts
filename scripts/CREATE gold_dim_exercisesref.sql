-- DROP TABLE workouts.gold_dim_exercisesref
CREATE TABLE workouts.gold_dim_exercisesref (
	custom_exercise BOOL,
	exercise_name TEXT,
	equipment TEXT,
	main_muscle TEXT,
	auxiliary_muscles TEXT,
	size TEXT,
	metrics TEXT,
	bodyweight TEXT,
	notes TEXT,
	muscle_group TEXT,
	exercise_group TEXT,
	PRIMARY KEY (exercise_name, equipment)
)