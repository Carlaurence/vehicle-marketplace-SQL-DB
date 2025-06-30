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
- `name`, `email`, `address`, `phone`

### 6. `sales`
Join table that records transactions between vehicles and vendors.

- `id` (PK)
- `sale_date`, `sale_price` 
- Foreign keys:
  - `vehicle_id` → `vehicles(id)`
  - `vendor_id` → `vendors(id)`

---

## 📊 Sample Data

- The dataset includes dozens of real vehicle records from brands like Toyota, Honda, Mazda, Tesla, and Ford.
- Includes used vehicles, various fuel types, body styles, and availability.
- Sales data enables querying sold vs. available inventory, revenue by vendor, and more.

## ⚙️ How to Use
To load the schema and seed data into your PostgreSQL database, use one of the following commands depending on your setup:

### 📍 Option 1: Local PostgreSQL (installed on your computer)

```bash
psql -d your_database_name -U your_username -f DB_vehicules_marketplace.sql
```
### 📍 Option 2: Remote PostgreSQL (e.g., Superbase, Heroku, RDS)

```bash
psql -d postgresql://user:password@host:port/database -f DB_vehicules_marketplace.sql
```
---

## 🛠️ Sales Data Generator

To dynamically generate realistic sales records and prepare SQL queries, the project includes a fully modular JavaScript system.

### 🔧 How it works

1. `utils/generateSalesData.js` creates a specified number of random sales records (in array format).
2. `generateSalesQueries.js` takes the data (an array of arrays) returned from `generateSalesData.js` and converts it into SQL `INSERT` and `UPDATE` statements, which are printed directly to the console.
3. These queries are ready to be copied into the SQL file (`DB_vehicules_marketplace.sql`).

### 🔗 Data sources
- `data/vehicles.js`: Array of vehicles.
- `data/vendors.js`: Array of vendors.

### 🔁 Utility helpers
- `utils/setVehiclesIds.js`: Assigns IDs to vehicle entries.
- `utils/setVendorsIds.js`: Assigns IDs to vendor entries.

### ▶️ Example usage:

```bash
node generateSalesQueries.js 'n'
```

This command will:
1. 'n' should be replaced by number of sales records users want to generate.
2. generateSalesQueries.js is going to generate 'n' records 
3. Print SQL-formatted `INSERT` and `UPDATE` statements to the console.

#### Example output:

```sql
-- Insert sales records
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (12, 3, '2024-05-18', 13500.00);

-- Update vehicle availability
UPDATE vehicles SET is_available = false WHERE id = 12;
```

---

## 📁 Project Structure

```
.
├── data/
│   ├── vehicles.js             # Vehicle dataset
│   └── vendors.js              # Vendor dataset
│
├── utils/
│   ├── setVehiclesIds.js       # Assigns IDs to vehicles
│   ├── setVendorsIds.js        # Assigns IDs to vendors
│   └── generateSalesData.js    # Returns randomized sales records array
│
├── DB_vehicules_marketplace.sql   # SQL schema and sample data
├── generateSalesQueries.js        # Builds SQL queries from generated sales
├── README.md
```

---

## 🧱 Database Schema Overview

The following diagram provides a visual representation of the database schema and the relationships between tables:

![Database Schema](./db_schema.png)

---

## ✅ Learning Goals

- Practice **1-to-many** and **many-to-many** relationships
- Understand **foreign key constraints**
- Build and execute **JOIN** queries across multiple tables
- Explore data aggregation and filtering

---

## 👤 Author

**Carlos L. Salcedo**  
💻 [GitHub](https://github.com/Carlaurence)  
💼 [LinkedIn](https://www.linkedin.com/in/carlos-salcedo-203493215)
