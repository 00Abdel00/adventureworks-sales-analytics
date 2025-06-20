# 💸 Discount Impact Analysis

This section explores how discounts are applied and how they influence customer purchasing behavior. The goal was to understand whether applying a discount has a measurable effect on the quantity sold — and how these discounts are distributed across products and categories.

---

## 📊 Queries Included

- `average_discount_by_product.sql`  
  Calculates the average discount rate per product, revealing that many items are never discounted while others (especially some bikes and touring models) receive modest but consistent reductions.

- `average_discount_by_category.sql`  
  Computes the average discount **rate** for each product **category**. Initially misinterpreted due to scientific notation, this query actually shows **extremely small average discounts**, typically less than 1%.

- `discount_vs_quantity.sql`  
  Groups discount rates into bins (e.g. 0%, 0–1%, 1–2%, 2–5%, etc.) and compares them to the **average quantity ordered**. A clear upward trend emerges, showing a **positive correlation between discount rate and quantity purchased**.

- `max_discount_by_category.sql`  
  Helps validate the range of discounts. It confirms that **no discount exceeds 4%**, with Accessories reaching ~3.8%, and other categories showing even lower max values.

---

## 🔎 Key Findings

### 1. Discounts are extremely small
- Most average discount rates fall **well below 1%** — often in the range of **0.00005 to 0.0001** (0.005%–0.01%).
- This is due to how discounts are applied: they're set at the **product level** via updated `UnitPrice`, with small variations encoded in `UnitPriceDiscount`.

### 2. Correlation with order quantity
- As discount rates increase, so does the **average quantity ordered**:
  - 0% → 2 units
  - 0–1% → 10 units
  - 1–2% → 17 units
  - 2–5% → 27 units
- This suggests customers are responsive to even **very small discounts**, perhaps due to bulk or promotional logic in the product structure.

### 3. Discount logic seems product-driven
- The pattern indicates that discounting is **not widely used across the board**.
- When it happens, it's likely part of a **targeted strategy**, possibly tied to individual SKUs with modified pricing, rather than a flexible pricing policy.

---

## 📁 Notes on Structure

This folder consolidates everything related to discount behavior, including:
- Raw discount data (per product, per category)
- Behavioral analysis (quantity vs discount)
- Validation of extreme cases (max discounts)

The `average_discount_by_product.sql` file has been relocated here for completeness.

---