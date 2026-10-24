# Azure Data Engineering Journey

## About This Repository

This repository documents my structured, hands-on learning journey in Azure Data Engineering, progressing from foundational concepts to practical data pipelines and production-style engineering scenarios.

The goal is to develop skills in data ingestion, transformation, storage, data quality, orchestration, troubleshooting, and cloud-based data platform development.

## Technologies and Skills

The learning roadmap includes:

- **SQL:** Relational databases, joins, window functions, and data modeling.
- **Python:** Data processing, automation, and ETL development.
- **Azure Data Factory:** Data ingestion, orchestration, and pipeline monitoring.
- **Azure Data Lake Storage Gen2:** Cloud storage and data lake architecture.
- **Azure Databricks:** Distributed data processing.
- **PySpark:** Data transformations and large-scale processing.
- **Delta Lake:** Reliable data storage and incremental processing.
- **Git and GitHub:** Version control and project documentation.

## Learning Progress

| Module | Status |
|---|---|
| 01 — Data Engineering Fundamentals | Completed |
| 02 — SQL and Database Development | In progress |
| 03 — Python for Data Engineering | Planned |
| 04 — Azure Storage and ADLS Gen2 | Planned |
| 05 — Azure Data Factory | Planned |
| 06 — Azure Databricks and PySpark | Planned |
| 07 — Delta Lake and Medallion Architecture | Planned |
| 08 — Production Reliability and Monitoring | Planned |
| 09 — RetailOps 360 Capstone Project | Planned |

## Module 01 — Data Engineering Fundamentals

### Concepts Introduced

- Data and Data Engineering
- Data sources and ingestion
- Data storage and transformation
- Data pipelines and monitoring
- ETL vs. ELT
- Structured, semi-structured, and unstructured data
- Database, table, row, column, and schema
- Primary keys and data quality fundamentals

### Current Hands-on Progress

- Verified Git installation on Ubuntu.
- Verified Python installation.
- Created a dedicated Azure Data Engineering workspace.
- Created initial technical learning notes.

Local SQL Server Day 1 Practical Completed.Azure Cloud deployment is pending.

### Day 1 — SQL Server Hands-on Lab

**Environment:** Ubuntu 24.04 LTS, Microsoft SQL Server 2025 Enterprise Developer Edition, sqlcmd.

**Database:** RetailOps360  
**Table:** dbo.customers

**Completed Tasks:**
- Installed and configured Microsoft SQL Server 2025.
- Connected to SQL Server using sqlcmd.
- Created and verified the RetailOps360 database.
- Created the dbo.customers table.
- Practiced single-row and multi-row INSERT statements.
- Executed SELECT queries to retrieve customer records.
- Troubleshot invalid column name errors (Msg 207).
- Tested duplicate primary key rejection (Msg 2627).
- Verified stored records using COUNT(*).

**Validation Results:**
- Total customer records: 4
- Primary key duplicate test: Rejected as expected
- Existing customer records: Preserved

**Skills Practiced:**
SQL DDL, DML, database schemas, primary keys, data integrity, troubleshooting, and basic validation.

**Scope:** Local SQL Server learning lab. Azure cloud deployment is planned for future modules.

## Module 02 — SQL and Database Development

### Day 2 — SQL Querying and Data Quality (Completed)

**Environment:** SQL Server 2025 on Ubuntu 24.04, using sqlcmd.

**Database:** RetailOps360
**Table:** dbo.customers

**SQL Skills Practiced:**
- SELECT, column aliases, and WHERE filtering
- Comparison operators and AND, OR, NOT
- ORDER BY with ascending, descending, and multiple-column sorting
- DISTINCT and COUNT(DISTINCT)
- IS NULL, IS NOT NULL, and SQL three-valued logic
- COUNT(*), COUNT(column), LEN(), and DATALENGTH()
- Targeted UPDATE statements with WHERE
- SQL syntax troubleshooting and data validation

**Verified Lab Results:**
- Total customer records: 8
- Non-NULL city records: 7
- Unique non-NULL city values: 6
- Customer 107 (SUNNY): Empty city string
- Customer 108 (AKHIL): Actual SQL NULL
- Final data quality query: Identified both incomplete city records

**Engineering Lessons:**
- NULL and empty strings are different.
- Non-NULL data is not necessarily valid business data.
- Empty strings can affect DISTINCT and COUNT results.
- WHERE clauses are essential for targeted updates.
- SQL query results must be validated against business requirements.
- Whitespace-only values require additional validation.

**Scope:** Completed and verified in the local SQL Server learning lab.
Azure implementation and advanced SQL topics remain in progress.

## Flagship Project — RetailOps 360

### Production-Style Azure Data Reliability and Revenue Analytics Platform

The planned capstone will simulate a retail business processing orders, customers, payments, and refunds.

**Planned capabilities:**

- Multi-source data ingestion
- Incremental data loading
- Bronze, Silver, and Gold data layers
- Data validation and duplicate detection
- Revenue and refund reconciliation
- Late-arriving data processing
- Pipeline failure investigation and recovery
- Monitoring and operational documentation

Implementation details and verified results will be added as the project progresses.

## Engineering Approach

Each topic follows a practical learning workflow:

1. Understand the concept and its technical foundations.
2. Examine realistic industry use cases.
3. Implement hands-on exercises.
4. Investigate errors and troubleshooting scenarios.
5. Practice technical interview questions.
6. Document completed work.
7. Maintain source code through Git and GitHub.

## Project Integrity

This repository distinguishes conceptual learning, local simulations, and actual Azure deployments. Only verified implementations will be documented as completed projects.
