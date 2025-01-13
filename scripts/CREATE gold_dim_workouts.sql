-- DROP TABLE ap_workouts.gold_dim_workouts
CREATE TABLE ap_workouts.gold_dim_workouts (
	id TEXT,
	day_name TEXT,
	day_number TEXT,
	week_number TEXT,
	plan_name TEXT,
	plan_function TEXT,
	start_time TIMESTAMP,
	duration TEXT,
	end_time TIMESTAMP,
	PRIMARY KEY (id)
)