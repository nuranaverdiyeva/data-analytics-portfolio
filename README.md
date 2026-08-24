# Data Analytics Portfolio

A collection of SQL and data analysis work, focused on business analytics, data pipelines, and reporting. All queries are written in Zoho Analytics SQL against the Dentakay CRM data warehouse.

## SQL

| Query | Description | Key Techniques |
|---|---|---|
| [Crown Brand Market Share](sql/crown_brand_analysis.sql) | Monthly crown brand share % per market, plus quantity sold | Window functions (`PARTITION BY`) |
| [Implant Brand Market Share](sql/implant_brand_share_analysis.sql) | Monthly implant brand share % per market, plus quantity sold | Window functions (`PARTITION BY`) |
| [Quoted vs. Actual Treatment Volume](sql/quoted_vs_actual_treatment_analysis.sql) | Compares quoted vs. delivered treatment volume by category, per deal | CTEs, conditional aggregation, `LEFT JOIN` + `COALESCE`, `NULLIF` |
| [Won Revenue by Visit Type and Market](sql/won_revenue_by_visit_and_market.sql) | Monthly won revenue and deal volume, split by 1st vs. 2nd visit | Conditional aggregation, `COUNTIF`, multi-table joins |
| [Month-over-Month Deal Size and Volume](sql/avg_deal_size_july_vs_june_by_market.sql) | July vs. June average deal size and volume, with a per-market rollup | Conditional aggregation, `NULLIF`, `UNION ALL` |
| [EU Top Markets: 3-Month Revenue Trend](sql/eu_top_markets_3mo_revenue_trend.sql) | Identifies and tracks the top 11 EU markets by trailing 3-month revenue | Correlated subquery + `LIMIT`, dynamic rolling dates |
| [Cancellation Rate & Avg Deal Size](sql/cancellation_rate_and_avg_deal_size_by_market.sql) | Monthly cancellation rate and average deal size by market | Conditional aggregation, `COUNTIF`, `NULLIF` |
| [Crown Brand Share Pivot](sql/crown_brand_share_pivot_by_market.sql) | Crown brand share pivoted to one column per brand, with a grand total | CTE, `COUNTIF` pivot, `UNION ALL` |
| [Implant Brand Share Pivot](sql/implant_brand_share_pivot_by_market.sql) | Implant brand share pivoted to one column per brand, with a grand total | CTE, `COUNTIF` pivot, `UNION ALL` |
| [Crown Units Sold, Ranked](sql/crown_units_sold_by_market_ranked.sql) | Crown unit volume by brand and market, ranked by total units sold | CTE, `CASE` + `SUM` pivot, `ORDER BY` |
| [Implant Units Sold, Ranked](sql/implant_units_sold_by_market_ranked.sql) | Implant unit volume by brand and market, ranked by total units sold | CTE, `CASE` + `SUM` pivot, `ORDER BY` |

## Author

Nurana Verdiyeva
