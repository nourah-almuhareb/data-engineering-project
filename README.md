# YouTube Data Engineering Project

A Data Engineering project focused on processing and analyzing YouTube trending video data using SQL and PostgreSQL.

## Project Overview

This project demonstrates data engineering workflows for transforming YouTube video data into structured datasets suitable for analysis.

The project includes:

- Data staging and transformation
- Duplicate record removal
- Joining video data with category information
- Data quality filtering
- Engagement and comment rate calculations
- Category-level data aggregation

## Technologies

- SQL
- PostgreSQL
- Python
- ETL / ELT

## Data Transformation

The project creates a cleaned YouTube dataset by:

1. Removing duplicate video records.
2. Joining video data with category information.
3. Handling missing category values.
4. Filtering invalid or incomplete records.
5. Calculating engagement rate and comment rate.
6. Creating category-level summary statistics.

## Repository Contents

- `ELT_pipeline.sql` — SQL transformations used to create the final datasets and category summaries.
- `data engineering Project.pdf` — Project report.
- `data engineering Presentation.pptx` — Project presentation.

## Project Outputs

The SQL pipeline produces:

- `final_usvideos` — Deduplicated YouTube video data.
- `final_youtube_data` — Cleaned video-level dataset with category information and engagement metrics.
- `final_category_summary` — Aggregated statistics by category.

## Project Documentation

The full project methodology and results are available in the project report and presentation included in this repository.
