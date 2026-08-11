# YouTube Data Engineering: ETL & ELT Pipelines

A Data Engineering project that designs, implements, and compares two data processing architectures — **ETL (Extract, Transform, Load)** and **ELT (Extract, Load, Transform)** — using YouTube Trending data.

The project demonstrates data extraction, data transformation, database loading, SQL-based transformations, data quality checks, automation, and BI visualization.

---

## 📌 Project Overview

YouTube generates large volumes of data, including video views, likes, comments, channel information, and category metadata. Processing this data efficiently requires an appropriate data pipeline architecture.

This project implements and compares two approaches:

* **ETL:** Extract → Transform → Load
* **ELT:** Extract → Load → Transform

The pipelines were evaluated based on:

* Execution speed
* Scalability
* Efficiency
* Data quality
* Processing approach

---

## 🎯 Project Objectives

* Collect YouTube data from multiple sources.
* Design and implement an ETL pipeline.
* Design and implement an ELT pipeline.
* Clean and transform YouTube Trending data.
* Perform data validation and quality checks.
* Calculate engagement-related metrics.
* Compare ETL and ELT performance.
* Prepare analytical datasets for Power BI.
* Automate the ELT workflow using Windows Task Scheduler.
* Provide recommendations on when ETL or ELT is more appropriate.

---

## 📊 Data Sources

The project uses YouTube Trending data and category metadata.

### YouTube Trending Dataset

The main dataset contains information such as:

* Video titles
* Channel names
* Views
* Likes
* Dislikes
* Comments
* Category IDs
* Trending dates

Dataset source:

[YouTube Trending Video Dataset — Kaggle](https://www.kaggle.com/datasets/datasnaek/youtube-new)

### Category Metadata

`US_category_id.json` provides the mapping between YouTube category IDs and their corresponding category names.

### YouTube Data API

The project also uses the **YouTube Data API** to retrieve additional metadata for selected YouTube categories.

---

# 🔄 ETL Pipeline

The ETL pipeline follows:

**Extract → Transform → Load**

### Extract

Data is collected from:

* CSV files
* JSON category mapping
* YouTube Data API

### Transform

Python and Pandas are used to:

* Remove missing values
* Remove duplicate records
* Map category IDs to category names
* Convert timestamps
* Calculate engagement metrics
* Combine data from different sources
* Validate data quality

### Load

The transformed data is loaded into **SQLite** and prepared for analytical use and Power BI visualization.

---

# ⚡ ELT Pipeline

The ELT pipeline follows:

**Extract → Load → Transform**

Raw data is first loaded into PostgreSQL staging tables and then transformed inside the database using SQL.

### Architecture

```text
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
```

### Staging Tables

The ELT pipeline uses:

* `stage_usvideos`
* `stage_categories`

### SQL Transformations

The transformation process includes:

* Removing duplicate video records
* Joining video and category data
* Handling missing category names
* Filtering invalid records
* Calculating engagement rate
* Calculating comment rate
* Creating category-level summary statistics

---

## 📈 Final Analytical Tables

### `final_usvideos`

A deduplicated version of the YouTube video staging data.

### `final_youtube_data`

A cleaned and enriched video-level dataset containing:

* Video information
* Channel information
* Category information
* Views
* Likes
* Dislikes
* Comments
* Engagement rate
* Comment rate

### `final_category_summary`

Aggregated statistics by category, including:

* Total videos
* Total views
* Total likes
* Total comments
* Average engagement rate
* Average comment rate

---

## 🛠️ Technologies & Skills

| Category              | Technologies             |
| --------------------- | ------------------------ |
| Programming           | Python                   |
| Data Processing       | Pandas                   |
| Databases             | SQLite, PostgreSQL       |
| Cloud Database        | Neon PostgreSQL          |
| Data Pipeline         | ETL, ELT                 |
| Database Connectivity | SQLAlchemy               |
| Data Querying         | SQL                      |
| Data Source           | YouTube Data API, Kaggle |
| Visualization         | Power BI                 |
| Automation            | Windows Task Scheduler   |

---

## ⚙️ Automation

The ELT pipeline was tested using Python in VS Code and automated using **Windows Task Scheduler**.

The scheduled task was configured to execute the ELT workflow automatically on a daily basis.

---

## 📊 BI & Analysis

Power BI was used to visualize the processed data and generate analytical insights.

The dashboards include:

* Views by category
* Views by channel
* Likes distribution
* Engagement metrics
* Views vs. likes analysis
* Key performance indicators

---

## ⚖️ ETL vs. ELT

| Metric                | ETL                      | ELT                     |
| --------------------- | ------------------------ | ----------------------- |
| Processing approach   | Transform before loading | Transform after loading |
| Database              | SQLite                   | Neon PostgreSQL         |
| Transformation        | Python / Pandas          | SQL                     |
| Scalability           | Lower                    | Higher                  |
| Raw data preservation | No                       | Yes                     |
| Execution time        | ~6 seconds               | ~0.5 seconds            |

### Key Finding

In the project experiment, the ELT pipeline completed in approximately **0.5 seconds**, compared with approximately **6 seconds** for the ETL pipeline.

This resulted in an observed **12× faster execution time for ELT** in the tested scenario.

The results demonstrate the potential advantage of performing transformations inside a cloud PostgreSQL database for this workload.

> **Note:** The performance comparison reflects the specific project environment and dataset used during testing and should not be considered a universal benchmark between ETL and ELT.

---

## 📁 Repository Contents

| File                                 | Description                                  |
| ------------------------------------ | -------------------------------------------- |
| `ELT_pipeline.sql`                   | SQL transformations used in the ELT pipeline |
| `data engineering Project.pdf`       | Full project report                          |
| `data engineering Presentation.pptx` | Project presentation                         |
| `README.md`                          | Project documentation                        |

---

## 🔐 Data & Security

The repository does not contain database credentials, API keys, or other sensitive connection information.

The original dataset is referenced through its public Kaggle source rather than duplicated in this repository.

---

## 🎓 Academic Context

This project was completed as a group project at:

**Princess Nourah bint Abdulrahman University**
**College of Computer and Information Sciences**
**Department of Information Systems**

---

## 📚 References

* [Kaggle — YouTube Trending Video Dataset](https://www.kaggle.com/datasets/datasnaek/youtube-new)
* Statista
* Microsoft Learn
* Amazon Web Services (AWS)
* Google YouTube Data API Documentation
* SQLite Documentation
* Python for Data Analysis
