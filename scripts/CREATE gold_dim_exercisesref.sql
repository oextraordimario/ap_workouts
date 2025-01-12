-- DROP TABLE workouts.gold_dim_exercisesref
CREATE TABLE workouts.gold_dim_exercisesref (
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
	PRIMARY KEY (exercise_name, equipment)
)