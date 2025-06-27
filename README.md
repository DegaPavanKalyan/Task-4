# Supermarket Sales SQL Analysis

This project demonstrates SQL-based analysis of a supermarket sales dataset using various database concepts, including table creation, joins, subqueries, aggregate functions, views, and indexing.

## 📦 Dataset
The dataset is sourced from a cleaned Excel file: `supermarket_sales_cleaned.xlsx`. It contains transactional-level data for sales at different branches in multiple cities.

### Columns:
- `invoice_id`: Unique ID for each transaction
- `branch`, `city`: Store location details
- `customer_type`, `gender`: Customer demographics
- `product_line`: Product category
- `unit_price`, `quantity`, `tax_5percent`, `total`: Transactional details
- `date`, `time`: Time of transaction
- `payment`: Mode of payment
- `cogs`, `gross_margin_percentage`, `gross_income`: Profitability measures
- `rating`: Customer feedback score

---

## 🛠️ SQL Tasks Covered

### 1. Table Creation
Creates the main `sales` table and an additional `product_info` table for join operations.

```sql
CREATE TABLE sales (...);
CREATE TABLE product_info (...);
