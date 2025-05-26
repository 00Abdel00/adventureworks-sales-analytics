# 📊 Project Scope: Sales & Product Analytics — AdventureWorks2022

This markdown documents the reasoning behind the scope chosen for this project, based on the full AdventureWorks2022 schema.

---

## 🎯 Why Narrow the Scope?

The full AdventureWorks schema contains over 80 tables, including many administrative, manufacturing, and HR-related entities. A complete ERD including all of them was:
- Overly complex
- Difficult to read and navigate
- Not focused enough for targeted business analysis

---

## ✅ How We Chose the Scope

We analyzed table connectivity using foreign key relationships. Tables with high connectivity were identified as central to the dataset, especially those related to **sales orders**, **products**, **customers**, and **territories**.

From this, we focused on the **Sales domain**, which balances:
- High relational richness (joins, hierarchies)
- Clear business relevance (revenue, product performance, customers)
- Practical KPIs for analysis and dashboards

---

## 🧩 Included Tables

| Category        | Tables |
|----------------|--------|
| 💰 Sales Core   | `SalesOrderHeader`, `SalesOrderDetail`, `Product`, `Customer`, `Store` |
| 👤 People       | `Person`, `Employee`, `SalesPerson`, `BusinessEntity` |
| 🗺️ Geography    | `Address`, `StateProvince`, `SalesTerritory`, `CountryRegion` |
| 🏷️ Product Info | `ProductCategory`, `ProductSubcategory`, `ProductModel` |

These were used to create a focused ERD (see `visuals/` or `adventureworks_scope_erd.dbml`).

---

## 🔍 Business Questions We Aim to Answer

This project will focus on producing insights for decision-makers around sales and product strategy. Examples include:

- 📈 **Revenue trends** over time by territory, category, or customer type
- 🏆 **Top-performing products** and categories
- 👤 **Customer segmentation** and regional performance
- 🔄 **Salesperson contribution** and commission analysis
- ❗ **Order cancellation patterns** (if applicable in data)

---

## 📁 ERD File

The scoped ERD file is saved as:
```
adventureworks_scope_erd.dbml
```
It is optimized for use in [dbdiagram.io](https://dbdiagram.io) to visualize relationships and inform query design.

---

## ✅ Next Step

Move into:
- KPI definition
- SQL query drafting
- Power BI dashboard setup

