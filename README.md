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

### Won Revenue by Visit Type and Market
**Tool:** Zoho Analytics SQL
**Context:** Monthly closed-won revenue and deal volume by market, split by 1st vs. 2nd visit
**What it does:** Aggregates won-deal revenue and deal counts per market per month, breaking out 1st-visit and 2nd-visit totals alongside a combined summary, filtered to exclude partner-sourced deals and specific branch locations.
**Key techniques:** Conditional aggregation (`CASE WHEN` + `SUM`), `COUNTIF`, multi-table `LEFT JOIN`s, multi-condition filtering, multi-column `GROUP BY`

[View query](sql/won_revenue_by_visit_and_market.sql)

### Month-over-Month Deal Size and Volume by Market
**Tool:** Zoho Analytics SQL
**Context:** July vs. June 2026 average deal size and deal volume, by market and visit type
**What it does:** Calculates average deal size and deal count for July per market and visit type, alongside the percentage change versus June for both metrics, then appends a per-market "Total" rollup row across visit types via `UNION ALL`.
**Key techniques:** Conditional aggregation (`CASE WHEN` + `SUM`), `COUNTIF`, `NULLIF` to guard against division by zero, month-over-month percentage change calculation, `UNION ALL` for combining detail and rollup rows

[View query](sql/avg_deal_size_july_vs_june_by_market.sql)

### EU Top Markets: Rolling 3-Month Revenue Trend
**Tool:** Zoho Analytics SQL
**Context:** Identifying and tracking the top-performing EU country/language markets over a trailing 3-month window
**What it does:** Dynamically identifies the top 11 EU markets by trailing 3-month won revenue, then returns the monthly revenue and deal count trend for exactly those markets, using rolling relative dates rather than hardcoded date ranges.
**Key techniques:** Correlated subquery with `LIMIT`, dynamic rolling date windows (`DATEADD`, `CURDATE()`), multi-table `LEFT JOIN`s, multi-column `GROUP BY`

[View query](sql/eu_top_markets_3mo_revenue_trend.sql)

## Author

Nurana Verdiyeva
