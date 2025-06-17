# AdventureWorks Sales Analytics

This project explores the AdventureWorks2022 dataset to extract actionable business insights through SQL queries and data visualization. It is structured around key performance indicators (KPIs) and organized analysis files.

## 📁 Repository Structure

- `csv/`: Contains all exported database metadata and raw schema extractions.
  - `raw_column_schema_adventureworks2022.csv`
  - `cleaned_column_schema_adventureworks2022.csv`
  - `raw_primary_keys.csv`
  - `raw_foreign_keys.csv`

- `notes/`: Markdown notes and planning documentation.
  - `schema_cleaning_notes.md`
  - `scope_and_objectives.md`
  - `kpis.md`
  - `adventureworks_scope_erd.dbml`

- `visuals/`: Supporting project visuals.
  - `erd_scope.png`

- `sql/`: Contains subfolders for exploration queries by KPI area:
  - `Product & Sales Volume/`
  - `Time-Based/`
  - `Customer Segments/`
  - `Discount Impact/`
  - `Geographic Insights/`

Each folder contains:
  - `.sql` files named by the insight they produce.
  - A summary `.md` file recapping what the queries show.

- `powerbi/`: Reserved for Power BI visuals (to be added later).

## ✅ Project Progress

### 📊 Schema Exploration
- Exported and analyzed all tables and columns.
- Identified primary and foreign keys.
- Built an Entity-Relationship Diagram to define scope.
- Saved ERD in `.dbml` and image format.

### 🔍 KPI Exploration

#### 1. Product & Sales Volume
- Top 10 best-selling products by revenue and quantity.
- Sales grouped by product categories and subcategories.
- Identification of never-sold products and correlation with categorization.

#### 2. Time-Based Trends
- Monthly and yearly revenue trends.
- Average order value by month.
- Weekly order distribution by weekday.

#### 3. Discount Impact
- Average discount by product category.
- Relationship between discount rate and order quantity.
- Distribution of discount rates shows that most discounts are very small.

#### 4. Customer Segments
- Revenue and order count comparison between stores and individuals.
- Top 10 customers by revenue, enriched with names.
- Order frequency and average order value for each segment.

#### 5. Geographic Insights
- Revenue, order count, and average order value by territory.
- Highlighting that high order count doesn't always mean high revenue (e.g., Australia vs Central US).

## 🛣️ Next Steps

- Build Power BI dashboard to consolidate insights.
- Add Markdown-based executive summary and key recommendations.
- Wrap with a conclusion and portfolio polishing.

---

*Built with AdventureWorks2022, SQL Server, SSMS, and markdown-powered documentation.*