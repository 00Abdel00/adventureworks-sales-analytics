# 🧼 Schema Cleaning Process — AdventureWorks2022

This markdown documents how we processed the raw schema export from the AdventureWorks2022 database to prepare a clean, annotated version for ERD creation and data analysis.

---

## 📥 Raw Data Extraction

We began by querying the database using three `INFORMATION_SCHEMA` views:

1. **Column metadata**  
   ```sql
   SELECT TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, DATA_TYPE
   FROM INFORMATION_SCHEMA.COLUMNS
   ```
   → This generated a list of all columns in all tables.

2. **Primary keys**  
   ```sql
   SELECT KU.TABLE_SCHEMA, KU.TABLE_NAME, KU.COLUMN_NAME
   FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS TC
   JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE KU
     ON TC.CONSTRAINT_NAME = KU.CONSTRAINT_NAME
   WHERE TC.CONSTRAINT_TYPE = 'PRIMARY KEY'
   ```

3. **Foreign keys**  
   A more complex join across constraints and column usage to identify what each FK references.

---

## 🧹 Cleaning Steps

The following transformations were applied to build the cleaned version:

- ✅ **Removed the `dbo` schema**: since it does not provide analytical value and only clutters the view.
- ✅ **Imported primary keys into a second sheet** and matched them against the raw column list using `VLOOKUP` to flag all PKs.
- ✅ **Colored primary keys in green** in the main column sheet for visual identification.
- ✅ **Imported foreign keys into a third sheet**.
- ✅ Added a new column called `"refers_to"`:
  - Indicates which table and column each foreign key points to.
  - Format: `Schema.Table.Column`

---

## 🔄 Special Cases Encountered

### Composite Foreign Key (SalesOrderDetail)

The table `Sales.SalesOrderDetail` contains two foreign key columns:
- `ProductID`
- `SpecialOfferID`

Together, they form a **composite foreign key** that references:
```
Sales.SpecialOfferProduct (ProductID, SpecialOfferID)
```

This is a less common but completely valid relational pattern. Both fields in `SalesOrderDetail` were annotated as:

- **“Part of a composite key with...”**
- **“Refers to a composite key in Sales.SpecialOfferProduct”**

This was clearly highlighted in the `"refers_to"` column for both rows.

---

## ✅ Outcome

This cleaned and documented schema is now ready for:
- Entity-Relationship Diagram (ERD) creation
- Analysis planning
- KPI mapping and JOIN logic
- Clean handoff to any analyst or stakeholder
