-- DROP TABLE ap_workouts.gold_fact_sets
CREATE TABLE ap_workouts.gold_fact_sets (
	id TEXT,
	exercise_id TEXT,
	workout_id TEXT,
	exercise_number TEXT,
	exercise_name TEXT,
	equipment TEXT,
	goal INT,
	measure TEXT,
	set_number TEXT,
	weight NUMERIC,
	total_weight NUMERIC,
	quantity INT,
	volume NUMERIC,
	PRIMARY KEY (id)
)