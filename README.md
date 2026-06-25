# StreamSphere-Analytics-OTT-Content-User-Engagement-Analysis
Developed an end-to-end OTT Analytics project using Python, MySQL, and Jupyter Notebook. Performed data cleaning, EDA, normalization, and relational database design. Executed advanced SQL queries using joins, CTEs, and window functions to generate business insights, followed by visualizations to analyze content trends and platform growth.


## Project Overview

This project focuses on analyzing Netflix OTT content by building a complete data analytics pipeline using Python and MySQL. The raw dataset was cleaned, normalized into multiple relational tables, stored in a MySQL database, and analyzed using advanced SQL queries. Business insights were further supported with visualizations created in Python.

---

## Business Problem

OTT platforms host thousands of movies and TV shows across different genres, countries, directors, and actors. Analyzing this data in its raw form is challenging due to redundancy and many-to-many relationships. This project aims to design a normalized relational database and perform SQL-based analysis to uncover meaningful business insights about content distribution, growth, and trends.

---

## Tech Stack

- Python
- Pandas
- NumPy
- MySQL
- SQLAlchemy
- MySQL Connector
- Jupyter Notebook
- Matplotlib

---

## Project Workflow

1. Data Collection
2. Data Cleaning
3. Exploratory Data Analysis (EDA)
4. Data Normalization
5. Relational Database Design
6. MySQL Database Creation
7. Data Import into MySQL
8. SQL Analysis
9. Data Visualization
10. Business Insights & Recommendations

---

## Database Schema

The dataset was normalized into the following tables:

- Content
- Genres
- Content_Genres
- Directors
- Content_Directors
- Actors
- Content_Actors
- Countries
- Content_Countries

The schema was designed using Primary Keys and Foreign Keys to eliminate redundancy and establish many-to-many relationships.

---

## SQL Concepts Used

- SELECT
- WHERE
- GROUP BY
- ORDER BY
- HAVING
- INNER JOIN
- Aggregate Functions
- Subqueries
- Common Table Expressions (CTEs)
- Window Functions
  - RANK()
  - DENSE_RANK()
  - SUM() OVER()

---

## Key Business Questions Answered

- Total number of Movies and TV Shows
- Content distribution by rating
- Top genres available on the platform
- Leading content-producing countries
- Most active directors and actors
- Content growth over the years
- Genre-wise Movie and TV Show analysis
- Rankings using Window Functions
- Above-average genres and directors using CTEs
- Cumulative content growth analysis

---

## Visualizations

- Movies vs TV Shows Distribution
- Top Genres
- Top Content Producing Countries
- Content Added Over Time
- Cumulative Content Growth

---

## Key Insights

- Movies represent a larger share of the platform's content library.
- A small number of genres contribute significantly to the overall catalog.
- Content production is concentrated in a few major countries.
- Several directors and actors appear across multiple titles.
- The platform has shown consistent growth in content over the years.

---

## Recommendations

- Expand content across underrepresented genres.
- Increase regional diversity by partnering with creators from more countries.
- Use genre, actor, and director information for personalized recommendations.
- Continuously monitor content trends to support strategic content acquisition.

---

## Project Structure

```
OTT_Analytics/
│
├── Dataset/
│   ├── content.csv
│   ├── genres.csv
│   ├── directors.csv
│   ├── actors.csv
│   ├── countries.csv
│   ├── content_genres.csv
│   ├── content_directors.csv
│   ├── content_actors.csv
│   └── content_countries.csv
│
├── notebooks/
│   ├── Data_Cleaning_EDA.ipynb
│   ├── Data_Normalization.ipynb
│   ├── SQL_Analysis.ipynb
│
├── SQL/
│   ├── Database_Creation.sql
│   └── SQL_Queries.sql
│
└── README.md
```

---

## Learning Outcomes

- Data Cleaning using Pandas
- Exploratory Data Analysis
- Database Normalization
- Relational Database Design
- SQL Query Optimization
- Advanced SQL (Joins, CTEs, Window Functions)
- Data Visualization
- Business Insight Generation

---


MBA (Finance) | Data Analytics Enthusiast
