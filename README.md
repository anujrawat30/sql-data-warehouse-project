# Enterprise Data Warehouse & Business Intelligence Solution project

Welcome to the **Enterprise Data Warehouse & Business Intelligence Solution project** repository! 🚀  
An end-to-end data engineering and analytics project focused on designing and developing a data warehouse using industry-standard practices. The project covers the complete data lifecycle, from extracting and transforming raw data to organizing it for analytical reporting and uncovering meaningful business insights..

---
# Project Overview
This project involves:
1. **Data Architecture**: Designing a Modern Data Warehouse Using Medallion Architecture            **Bronze**, **Silver**, **Gold** Layers.
2. **ETL Pipelines**: Extracting, transforming, and loading data from source systems into the         warehouse.
3. **Data Modeling**: Developing fact and dimension tables optimized for analytical queries.
4. **Analytics & Reporting**: Creating SQL-based reports and dashboards for actionable insights.

=> This repository is an excellent resource for professionals and students looking to showcase expertise in:
  * SQL Development
  * Data Architect
  * Data Engineering
  * ETL Pipeline Developer
  * Data Modeling
  * Data Analytics

#   Project Requirements

##  Building the Data Warehouse (Data Engineering)

### Overview & Goals
Building an end-to-end data warehouse solution using SQL Server to integrate, transform, and organize sales data for efficient reporting, business analysis, and data-driven decision-making.

###  Specifications
- **Data Sources:** Import data from two source systems (ERP and CRM) provided as CSV files.
- **Data Quality:** Cleanse and resolve data quality issues before analysis.
- **Integration:** Combine both sources into a single, user-friendly data model designed for analytical queries.
- **Scope:** Focus only on the latest dataset; historization of data is not required.
- **Documentation:** Provide clear documentation of the data model to support both business stakeholders and analytics teams.

---

##  Business Intelligence: Analytics & Reporting (Data Analytics)

### Overview & Goals
Develop SQL-based analytics to deliver detailed insights into:
- **Customer Behavior**
- **Sales Trends**
- **Product Performance**

These insights empower stakeholders with key business metrics, enabling strategic decision-making.

For more details, refer to docs/requirements.md
---
# Data Architecture
The Data Architecture for this project follows Medallion Architecture **Bronze**, **Silver**, **Gold** Layers.
<img width="6235" height="3216" alt="data_architecture" src="https://github.com/user-attachments/assets/98c8973a-b942-4b74-8ac3-b61d6eb1dba1" />

1. **Bronze Layer**: Stores raw data as is from the source systems. Data is ingested from CSV Files into SQL Server Database.
2. **Silver Layer**: This Layer includes data cleansing, standardization and normalization processes to prepare data for analysis.
3. **Gold Layer**: Houses business-ready data modeled into a star schema required for reporting and analytics.

# Repository Structure


## Repository Structure

```text
data-warehouse-project/
│
├── datasets/                  # Raw datasets used for the project (ERP and CRM data)
│
├── docs/                      # Project documentation and architecture details
│   ├── etl.drawio             # Draw.io file showing different ETL techniques and methods
│   ├── data_catalog.md        # Catalog of datasets, including field descriptions and metadata
│   ├── data_model.png         # Visual representation of the project's data architecture
│   └── naming_conventions.md  # Consistent naming guidelines for tables, columns, and files
│
├── scripts/                   # SQL scripts for ETL and transformations
│   ├── bronze/                # Scripts for extracting and loading raw data
│   ├── silver/                # Scripts for cleaning and transforming data
│   └── gold/                  # Scripts for creating analytical models
│
├── tests/                     # Test scripts and data quality files
│
├── README.md                  # Project overview and instructions
│
├── LICENSE                    # License information for the repository
│
├── .gitignore                 # Files and directories to be ignored by Git
│
└── requirements.txt           # Dependencies and requirements for the project
```

