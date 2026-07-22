#  Data Warehouse and Analytics Project

A modern, SQL Server-based data warehouse that consolidates ERP and CRM data into a single, analytics-ready star schema — built end-to-end using the Medallion (Bronze/Silver/Gold) architecture.

##  At a Glance

| | |
|---|---|
| **Sources** | ERP + CRM (CSV files) |
| **Warehouse** | SQL Server |
| **Architecture** | Medallion — Bronze → Silver → Gold |
| **Target Model** | Star schema (fact + dimension tables) |
| **Scope** | Latest snapshot only — no historization |
| **Output** | SQL-based reports & dashboards for sales analytics |
| **Cost** | 100% free / open tooling |

##  Data Architecture

The warehouse follows the Medallion Architecture, moving data through three progressively refined layers:

| Layer | Purpose | Description |
|---|---|---|
|  **Bronze** | Raw ingestion | Data loaded as-is from source CSV files (ERP, CRM) into SQL Server, no transformations applied |
|  **Silver** | Cleansing & standardization | Data cleaned, standardized, and normalized to prepare it for analysis |
|  **Gold** | Business-ready | Data modeled into a star schema, optimized for reporting and analytical queries |

##  Project Overview

| Component | What It Covers |
|---|---|
| **Data Architecture** | Designing the Bronze/Silver/Gold warehouse structure |
| **ETL Pipelines** | Extracting, transforming, and loading data from ERP and CRM sources |
| **Data Modeling** | Building fact and dimension tables optimized for analytics |
| **Analytics & Reporting** | SQL-based reports and dashboards delivering actionable insights |

This repository is built as a portfolio piece demonstrating practical skills in:

- SQL Development
- Data Architecture
- Data Engineering
- ETL Pipeline Development
- Data Modeling
- Data Analytics

##  Requirements

**Objective:** Develop a modern data warehouse using SQL Server to consolidate sales data, enabling analytical reporting and informed decision-making.

| Requirement | Detail |
|---|---|
| **Data Sources** | Import data from two source systems — ERP and CRM — provided as CSV files |
| **Data Quality** | Cleanse and resolve data quality issues prior to analysis |
| **Integration** | Combine both sources into a single, user-friendly model designed for analytical queries |
| **Scope** | Latest dataset only; historical tracking is not required |
| **Documentation** | Clear documentation of the data model for both business stakeholders and analytics teams |


##  Repository Structure

```
data-warehouse-project/
│
├── datasets/              # Raw ERP and CRM CSV source files
│
├── scripts/                
│   ├── bronze/             # Scripts to load raw data into the Bronze layer
│   ├── silver/             # Cleansing, standardization, and normalization scripts
│   └── gold/                # Star schema view/table definitions
│
├── docs/                   # Data model diagrams, architecture docs, catalog
│
├── tests/                  # Data quality checks and validation scripts
│
└── README.md
```

##  Status

| Phase | Status |
|---|---|
| Architecture design (Bronze/Silver/Gold) | 🔲 |
| Bronze layer — raw ingestion | 🔲 |
| Silver layer — cleansing & standardization | 🔲 |
| Gold layer — star schema | 🔲 |
| Analytics & reporting scripts | 🔲 |
| Documentation | 🔲 |

---

*Built as a portfolio project to demonstrate data warehousing and analytics engineering best practices.*
