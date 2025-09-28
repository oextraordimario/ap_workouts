# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a workout tracking and analysis system using Jupyter notebooks to process fitness data through multiple stages (bronze → silver → gold medallion architecture). The system parses workout logs and training plans from CSV files exported from a fitness app, transforms them into structured dataframes, and prepares them for database storage.

## Data Architecture

The project follows a medallion architecture with three layers:

- **Bronze Layer** (`b1-bronze/`): Raw CSV exports from fitness app
  - `workouts.csv`: Individual workout sessions with exercises, sets, reps, weights
  - `plans.csv`: Training program templates with exercise prescriptions
  - `custom_exercises.csv`: User-defined exercise library

- **Silver Layer** (`b2-silver/`): Cleaned and structured data (referenced in notebook 2)
  - Basic data cleaning and normalization

- **Gold Layer** (`b3-gold/`): Analysis-ready data with calculated metrics
  - Final transformed data ready for database ingestion or analysis

## Key Components

### Main Processing Notebooks

1. **`1-bronze_to_silver.ipynb`**: Primary ETL pipeline
   - Contains comprehensive parsing functions for workout and plan data
   - Generates unique IDs for exercises, workouts, and plans
   - Handles complex workout log format with nested exercise/set structure
   - Key functions:
     - `parse_workouts_csv()`: Parses workout session data from CSV
     - `parse_plans()`: Parses training plan templates
     - `generate_exercise_id()`, `generate_plan_id()`: Create unique identifiers

2. **`2-silver_to_gold.ipynb`**: Final data transformation
   - Data type conversions and metric calculations
   - Volume calculations (weight × reps)
   - Dumbbell weight doubling for total weight calculations

### Data Processing Functions

The notebooks contain specialized parsing functions that handle the complex semi-structured format of the exported fitness data:

- **Workout Parser**: Handles multi-line workout entries with exercise headers, set data tables, and notes
- **Plan Parser**: Processes training program templates with nested day/exercise structure
- **ID Generation**: Creates consistent unique identifiers across different data entities

### Database Integration

The system includes PostgreSQL integration setup:
- Uses environment variables from `postgres_auth.env` for database credentials
- Prepared for bulk data insertion into fact/dimension tables
- Schema designed for workout analytics and progress tracking

## Development Workflow

### Data Processing
```bash
# Run the main ETL pipeline in Jupyter
jupyter notebook 1-bronze_to_silver.ipynb

# Run final transformations
jupyter notebook 2-silver_to_gold.ipynb
```

### Testing
- Test data files are available in `tests/` directory
- `test_standaloneworkout.csv` contains sample standalone workout data for development

## Data Formats

### Workout CSV Structure
- Semi-structured format with quoted sections
- Workout headers contain metadata (day, week, plan, datetime, duration)
- Exercise sections have nested set data tables
- Supports both planned workouts and standalone sessions

### Plan CSV Structure
- Hierarchical structure: Program → Day → Exercise
- Exercise prescriptions include sets, reps, and equipment
- Duration and start date metadata for each program

## Key Data Entities

- **Workouts**: Individual training sessions with timing and metadata
- **Exercises**: Individual movements with equipment and targeting info
- **Sets**: Individual work sets within exercises (reps, weight, duration)
- **Plans**: Pre-defined training programs with exercise prescriptions
- **Equipment Categories**: Bodyweight, Machine, Cable, Barbell, Dumbbells, etc.

## Environment Setup

- Requires `.env` or `postgres_auth.env` file for database credentials
- Python dependencies: pandas, numpy, datetime, dotenv, re, os
- Jupyter notebook environment for interactive data processing