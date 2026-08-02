# Data Analytics Portfolio

A collection of SQL and data analysis work, focused on business analytics, data pipelines, and reporting.

## SQL

### Crown Brand Market Share Analysis
**Tool:** Zoho Analytics SQL
**Context:** Monthly crown brand performance analysis across five international markets
**What it does:** Calculates crown product brand share percentage per market per month using window functions, alongside total quantity sold per brand, filtered by product category, brand, and branch location.
**Key techniques:** Window functions (`SUM() OVER PARTITION BY`), multi-table JOINs, date range filtering, aggregation

[View query](sql/crown_brand_analysis.sql)

### Implant Brand Market Share Analysis
**Tool:** Zoho Analytics SQL
**Context:** Monthly implant brand performance analysis across five international markets
**What it does:** Calculates implant brand share percentage per market per month using window functions, alongside total quantity sold per brand, filtered by product category, brand, and branch location.
**Key techniques:** Window functions (`SUM() OVER PARTITION BY`), multi-table JOINs, date range filtering, aggregation with multi-column GROUP BY

[View query](sql/implant_brand_share_analysis.sql)

### Quoted vs. Actual Treatment Volume Analysis
**Tool:** Zoho Analytics SQL
**Context:** Comparing quoted treatment plan volumes against what was actually delivered, per deal, across treatment categories
**What it does:** Uses two CTEs to pivot quoted and actual quantities into per-category columns via conditional aggregation, then joins them per deal to calculate the percentage change between quoted and actual for each category.
**Key techniques:** Common Table Expressions (`WITH`), conditional aggregation (`CASE WHEN` + `SUM`), `LEFT JOIN` with `COALESCE` for null handling, `NULLIF` to guard against division by zero

[View query](sql/quoted_vs_actual_treatment_analysis.sql)

## Author

Nurana Verdiyeva
