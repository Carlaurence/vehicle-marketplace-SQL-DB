# Vehicules Marketplace Database

This project defines the schema and seed data for a SQL-based vehicle marketplace database. It is designed to simulate a realistic dataset for practicing relational modeling and complex SQL queries, such as multi-table joins, filtering, aggregations, and subqueries.

## 📌 Purpose

The main objective is to support learning and practice of SQL through a well-structured dataset that reflects a simplified version of a vehicle sales environment, including inventory, vendors, and sales transactions.

## 🧱 Database Schema Overview

The database contains the following tables:

### 1. `manufacturers`
Stores information about vehicle manufacturers.

- `id` (PK)
- `name`

### 2. `body_styles`
Stores different body types for vehicles.

- `id` (PK)
- `style`

### 3. `fuel_types`
Defines types of fuel (e.g., Gasoline, Electric, Hybrid).

- `id` (PK)
- `type`

### 4. `vehicles`
Main table containing detailed information about vehicles.

- `id` (PK)
- `model`, `year`, `engine_capacity`, `color`, `mileage`, `price`, `warranty`, `is_available`
- Foreign keys:
  - `manufacturer_id` → `manufacturers(id)`
  - `body_style_id` → `body_styles(id)`
  - `fuel_type_id` → `fuel_types(id)`

### 5. `vendors`
Represents individuals or companies selling the vehicles.

- `id` (PK)
- `name`, `email`, `contact_info`

### 6. `sales`
Join table that records transactions between vehicles and vendors.

- `id` (PK)
- `vehicle_id` → `vehicles(id)`
- `vendor_id` → `vendors(id)`
- `sale_date`, `sale_price`

## 📊 Sample Data

- The dataset includes dozens of real vehicle records from brands like Toyota, Honda, Mazda, Tesla, and Ford.
- Includes both new and used vehicles, various fuel types, body styles, and availability.
- Sales data enables querying sold vs. available inventory, revenue by vendor, and more.

## ⚙️ How to Use

### Load into PostgreSQL

1. Make sure PostgreSQL is installed and running.
2. Use the following command to execute the SQL file:

```bash
psql -d your_database_name -U your_username -f DB_vehicules_marketplace.sql
```

## 👤 Author

**Carlos L. Salcedo**  
💻 [GitHub](https://github.com/Carlaurence)  
💼 [LinkedIn](https://www.linkedin.com/in/carlos-salcedo-203493215)
