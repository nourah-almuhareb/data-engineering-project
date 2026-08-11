# YouTube Data Engineering: ETL & ELT Pipelines

A Data Engineering project that designs and compares two data processing architectures, ETL and ELT, using YouTube Trending data.

The project demonstrates data extraction from multiple sources, data transformation, database loading, SQL-based transformations, automation, and BI visualization.

---

## 📌 Project Overview

YouTube generates large volumes of data such as views, likes, comments, and video metadata. Processing this data efficiently requires an appropriate data pipeline architecture.

This project implements and compares:

- **ETL (Extract → Transform → Load)**
- **ELT (Extract → Load → Transform)**

The two approaches are evaluated based on:

- Execution speed
- Scalability
- Efficiency
- Data quality
- Processing approach

---

## 🎯 Project Objectives

- Collect YouTube data from multiple sources.
- Design and implement an ETL pipeline.
- Design and implement an ELT pipeline.
- Transform and clean YouTube Trending data.
- Calculate engagement-related metrics.
- Compare ETL and ELT performance.
- Generate analytical outputs for Power BI visualization.
- Automate the ELT pipeline using Windows Task Scheduler.

---

## 📊 Data Sources

The project uses multiple data sources:

- **USvideos.csv** — YouTube Trending video data including titles, channels, views, likes, dislikes, comments, and category IDs.
- **US_category_id.json** — Mapping between category IDs and readable category names.
- **YouTube Data API** — Additional metadata for selected YouTube categories.

---

# 🔄 ETL Pipeline

The ETL pipeline follows:

**Extract → Transform → Load**

### Extract

Data is collected from:

- CSV files
- JSON category mapping
- YouTube Data API

### Transform

Python and Pandas are used to:

- Remove missing values
- Remove duplicate records
- Map category IDs to category names
- Convert timestamps
- Calculate engagement metrics
- Combine data from different sources

### Load

The transformed data is loaded into:

**SQLite**

The resulting dataset is then prepared for Power BI visualization.

---

# ⚡ ELT Pipeline

The ELT pipeline follows:

**Extract → Load → Transform**

Raw data is first loaded into PostgreSQL staging tables and transformed inside the database using SQL.

### Architecture

~~~
Data Sources
     ↓
Python + Pandas
     ↓
SQLAlchemy
     ↓
Neon PostgreSQL
     ↓
Staging Tables
     ↓
SQL Transformations
     ↓
Final Analytical Tables
     ↓
Power BI
~~~

### Staging Tables

The ELT pipeline uses staging tables including:

- `stage_usvideos`
- `stage_categories`

### SQL Transformations

The transformation process includes:

- Removing duplicate video records
- Joining video and category data
- Handling missing category names
- Filtering invalid records
- Calculating engagement rate
- Calculating comment rate
- Creating category-level summary statistics

---

## 📈 Final Tables

The SQL transformation pipeline produces the following analytical tables:

### `final_usvideos`

A deduplicated version of the YouTube video staging data.

### `final_youtube_data`

A cleaned and enriched video-level dataset containing:

- Video information
- Channel information
- Category information
- Views
- Likes
- Dislikes
- Comments
- Engagement rate
- Comment rate

### `final_category_summary`

Aggregated statistics by category, including:

- Total videos
- Total views
- Total likes
- Total comments
- Average engagement rate
- Average comment rate

---

## 🛠️ Technologies

- Python
- Pandas
- SQL
- PostgreSQL
- Neon PostgreSQL
- SQLAlchemy
- SQLite
- YouTube Data API
- Power BI
- Windows Task Scheduler

---

## ⚙️ Automation

The ELT pipeline was tested using Python in VS Code and automated using Windows Task Scheduler.

The scheduled task was configured to execute the ELT process automatically on a daily basis.

---

## 📊 BI & Analysis

Power BI was used to visualize the processed data and generate analytical insights.

The dashboards include visualizations such as:

- Views by category
- Views by channel
- Likes distribution
- Engagement metrics
- Views vs. likes analysis
- Key performance indicators

---

## ⚖️ ETL vs. ELT

| Metric | ETL | ELT |
|---|---|---|
| Processing approach | Transform before loading | Transform after loading |
| Database | SQLite | Neon PostgreSQL |
| Transformation | Python / Pandas | SQL |
| Scalability | Lower | Higher |
| Raw data preservation | No | Yes |
| Execution time | ~6 seconds | ~0.5 seconds |

### Key Finding

In the project experiment, the ELT pipeline completed in approximately **0.5 seconds**, compared with approximately **6 seconds** for the ETL pipeline.

This resulted in an observed **12× faster execution time for ELT** in the tested scenario.

The results demonstrate the potential advantage of performing transformations inside a cloud PostgreSQL database for this workload.

---

## 📁 Repository Contents

- `ELT_pipeline.sql` — SQL transformations used in the ELT pipeline.
- `data engineering Project.pdf` — Full project report.
- `data engineering Presentation.pptx` — Project presentation.
- `README.md` — Project documentation.

---

## 👥 Team

This project was completed as a group project at:

**Princess Nourah bint Abdulrahman University**  
**College of Computer and Information Sciences**  
**Department of Information Systems**

---

## 📚 References

The project references include resources from:

- Statista
- Microsoft Learn
- Amazon Web Services (AWS)
- Google YouTube Data API documentation
- SQLite documentation
- Python for Data Analysis
