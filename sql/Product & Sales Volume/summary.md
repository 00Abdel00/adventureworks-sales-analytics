# Product & Sales Volume — Exploration Summary

## 1. Top 10 Best-Selling Products (by Quantity)
We began our product analysis by identifying the top 10 products based on total quantity sold. This gave us a quick understanding of the most popular items in the catalog — primarily bikes like the "Mountain-500" and "Touring-3000" models.

## 2. Sales by Product Category and Subcategory
Next, we grouped sales by product category and subcategory. This confirmed that most of the revenue came from the `Bikes` category, with a strong presence in subcategories such as `Mountain Bikes`, `Touring Bikes`, and `Road Bikes`.

## 3. Product Discount Share
We calculated the percentage of discounted orders for each product. 
- Some products, like "Mountain-500 Silver, 42", had a discount share of over 6%.
- However, the vast majority of products (hundreds) were never sold with a discount (discount share = 0%).

## 4. Unsold Products and Categorization Issues
We explored all products that were never sold:
- **209 products were uncategorized**, i.e., they had no subcategory.
- These 209 items represented **100% of all uncategorized products**, meaning no uncategorized product was ever sold.
  
We then looked at unsold products that *were* categorized. While there was no definitive pattern, many of them fell into the `Components` category — particularly `Road Frames`, `Mountain Frames`, and `Wheels`. This may suggest that certain components are either obsolete or not part of final SKUs.

This raised an important business insight: **product categorization is closely linked to sales activity**, and uncategorized items might reflect incomplete catalog data or unlaunched inventory.