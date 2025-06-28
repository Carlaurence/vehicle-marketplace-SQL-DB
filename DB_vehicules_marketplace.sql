-- Remove the tables if exist
DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS vehicles;
DROP TABLE IF EXISTS vendors;
DROP TABLE IF EXISTS fuel_types;
DROP TABLE IF EXISTS body_styles;
DROP TABLE IF EXISTS manufacturers;

-- Table manufacturers
-- This table stores information about vehicle manufacturers
CREATE TABLE manufacturers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

-- Table body_styles
-- This table stores different body styles of vehicles
CREATE TABLE body_styles (
  id SERIAL PRIMARY KEY,
  style VARCHAR(50) NOT NULL
);

-- table fuel_types
-- This table stores different types of fuel used in vehicles
CREATE TABLE fuel_types (
  id SERIAL PRIMARY KEY,
  type VARCHAR(50) NOT NULL
);

-- table vehicles
-- This table stores information about vehicles
CREATE TABLE vehicles (
  id SERIAL PRIMARY KEY,
  model VARCHAR(50) NOT NULL,
  year INT NOT NULL,
  engine_capacity DECIMAL(3,1),
  color VARCHAR(30),
  mileage INT,
  price DECIMAL(10,2),
  warranty BOOLEAN DEFAULT FALSE,
  manufacturer_id INT REFERENCES manufacturers(id),
  body_style_id INT REFERENCES body_styles(id),
  fuel_type_id INT REFERENCES fuel_types(id)
);

-- table vendors 
-- This table stores information about vendors
CREATE TABLE vendors (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  contact_info VARCHAR(150)
);

-- 3. Sales table
-- This table stores information about vehicle sales
CREATE TABLE sales (
  id SERIAL PRIMARY KEY,
  vehicle_id INT REFERENCES vehicles(id),
  vendor_id INT REFERENCES vendors(id),
  sale_date DATE NOT NULL,
  sale_price DECIMAL(10,2) NOT NULL
);

-- Add a column to indicate if the vehicle is available
ALTER TABLE vehicles ADD COLUMN is_available BOOLEAN DEFAULT TRUE;

-- create vendors
-- Seed data for vendors table
INSERT INTO vendors (name, email, address, phone) VALUES
('Maria Gomez', 'maria.gomez@email.com', '123 Main St, Cityville', '+1-555-1234'),
('John Smith', 'john.smith@email.com', '456 Elm Ave, Townsburg', '+1-555-5678'),
('Ana Rodriguez', 'ana.rodriguez@email.com', '789 Oak Blvd, Metropolis', '+1-555-9012'),
('Carlos Perez', 'carlos.perez@email.com', '321 Pine Rd, Villagetown', '+1-555-3456'),
('Emily Johnson', 'emily.johnson@email.com', '654 Maple Ln, Capital City', '+1-555-7890');


-- crear manufacturers
INSERT INTO manufacturers (id, name) VALUES (1, 'Toyota');
INSERT INTO manufacturers (id, name) VALUES (2, 'Honda');
INSERT INTO manufacturers (id, name) VALUES (3, 'Mazda');
INSERT INTO manufacturers (id, name) VALUES (4, 'Tesla');
INSERT INTO manufacturers (id, name) VALUES (5, 'Ford');

-- crear tipos de carrocerias
INSERT INTO body_styles (id, style) VALUES (1, 'Hatchback');
INSERT INTO body_styles (id, style) VALUES (2, 'Minivan');
INSERT INTO body_styles (id, style) VALUES (3, 'Sedan');
INSERT INTO body_styles (id, style) VALUES (4, 'Suv');
INSERT INTO body_styles (id, style) VALUES (5, 'Truck');

-- crear tipo de combustible
INSERT INTO fuel_types (id, type) VALUES (1, 'Gasoline');
INSERT INTO fuel_types (id, type) VALUES (2, 'Hybrid');
INSERT INTO fuel_types (id, type) VALUES (3, 'Electric');
-- insertar vehiculos toyota
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('camry', 2014, 2.5, 'Gris', 87759, 12795.0, FALSE, 1, 3, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('rav4', 2018, 2.5, 'Negro', 87297, 18490.0, FALSE, 1, 4, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('TACOMA', 2016, 2.7, 'Negro', 80125, 27888.0, FALSE, 1, 5, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CAMRY', 2016, 2.5, 'Blanco', 125000, 10250.0, FALSE, 1, 3, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('HIGHLANDER', 2019, 2.7, 'Blanco', 81128, 21998.0, FALSE, 1, 4, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('TUNDRA', 2007, 5.7, 'Rojo', 209000, 6000.0, FALSE, 1, 5, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('COROLLA', 2025, 2.0, 'Blanco', 1200, 22900.0, TRUE, 1, 3, 2);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('COROLLA', 2024, 2.0, 'Blanco', 10400, 21499.0, TRUE, 1, 3, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('HIGHLANDER', 2022, 2.7, 'Gris', 31990, 34900.0, FALSE, 1, 4, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('PRIUS', 2019, 1.8, 'Gris', 86052, 18000.0, FALSE, 1, 1, 2);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('RAV4', 2015, 2.5, 'Gris', 155404, 10495.0, FALSE, 1, 4, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('4RUNNER', 2015, 4.0, 'Blanco', 101404, 27900.0, FALSE, 1, 4, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CAMRY', 2015, 2.5, 'Negro', 89825, 13000.0, FALSE, 1, 3, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('PRIUS', 2010, 1.8, 'Negro', 143000, 8800.0, FALSE, 1, 1, 2);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('TACOMA', 2019, 2.7, 'Gris', 47000, 22000.0, FALSE, 1, 5, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('PRIUS', 2023, 2.0, 'Gris', 21500, 29500.0, TRUE, 1, 1, 2);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('PRIUS', 2014, 1.8, 'Negro', 94000, 7900.0, FALSE, 1, 1, 2);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('SIENNA', 2013, 3.5, 'Negro', 135000, 8900.0, FALSE, 1, 2, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('HIGHLANDER', 2021, 3.5, 'Negro', 68000, 25750.0, FALSE, 1, 4, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('SIENNA', 2019, 3.5, 'Negra', 79546, 23500.0, FALSE, 1, 2, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CAMRY', 2015, 2.5, 'Gold', 95000, 9900.0, FALSE, 1, 3, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('COROLLA', 2012, 2.0, 'Negro', 199000, 7500.0, FALSE, 1, 3, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('SIENNA', 2012, 3.5, 'Gold', 120000, 9900.0, FALSE, 1, 2, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('COROLLA', 2014, 2.0, 'Rojo', 105771, 9250.0, FALSE, 1, 3, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CAMRY', 2019, 2.5, 'Negro', 176402, 9900.0, FALSE, 1, 3, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('SIENNA', 2013, 3.5, 'Gris', 232000, 6000.0, FALSE, 1, 2, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('SIENNA', 2025, 2.5, 'Gris', 300, 51875.0, TRUE, 1, 2, 2);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CAMRY', 2023, 2.5, 'Negro', 26000, 27000.0, TRUE, 1, 3, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('SIENNA', 2023, 2.5, 'Blanco', 28000, 48999.0, TRUE, 1, 2, 2);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('RAV4', 2013, 2.5, 'Gris', 152000, 8400.0, FALSE, 1, 4, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CAMRY', 2013, 2.5, 'Blanco', 176402, 8250.0, FALSE, 1, 3, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('SIENNA', 2021, 2.5, 'Gris', 8130, 43995.0, FALSE, 1, 2, 2);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CAMRY', 2019, 2.5, 'Gris', 70000, 18799.0, FALSE, 1, 3, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('SIENNA', 2020, 3.5, 'Gris', 32000, 29500.0, FALSE, 1, 2, 1);

-- insertar vehiculos Honda
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('ODYSSEY', 2015, 3.5, 'Gris', 161900, 12900.0, FALSE, 2, 2, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CR-V', 2016, 2.4, 'Negro', 116000, 12500.0, FALSE, 2, 4, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('ODYSSEY', 2015, 3.5, 'Negro', 130000, 9000.0, FALSE, 2, 2, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CIVIC', 2019, 2.0, 'Azul', 144980, 12700.0, FALSE, 2, 3, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('ACCORD', 2020, 2.0, 'Blanco', 96000, 18000.0, FALSE, 2, 3, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('ODYSSEY', 2014, 3.5, 'Negro', 32000, 11995.0, FALSE, 2, 2, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('PILOT', 2013, 3.5, 'Gris', 153470, 7500.0, FALSE, 2, 4, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CR-V', 2018, 2.4, 'Gris', 222000, 10500.0, FALSE, 2, 4, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('ACCORD', 2015, 2.0, 'Gris', 160879, 7299.0, FALSE, 2, 3, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('ODYSSEY', 2024, 3.5, 'Blanco', 7718, 40972.0, TRUE, 2, 2, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CIVIC', 2018, 2.0, 'Negro', 79000, 12500.0, FALSE, 2, 3, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('PILOT', 2016, 3.5, 'Blanco', 93000, 11500.0, FALSE, 2, 4, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CR-V', 2024, 1.5, 'Negro', 16550, 30000.0, TRUE, 2, 4, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('ACCORD', 2018, 2.0, 'Blanco', 103200, 17200.0, FALSE, 2, 3, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CIVIC', 2013, 2.0, 'Azul', 135000, 6500.0, FALSE, 2, 3, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('ODYSSEY', 2014, 3.5, 'Gold', 84000, 11900.0, FALSE, 2, 2, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('PILOT', 2012, 3.5, 'Gris', 139800, 7500.0, FALSE, 2, 4, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CIVIC', 2024, 2.0, 'Gris', 26000, 17995.0, TRUE, 2, 3, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CR-V', 2013, 2.4, 'Blanco', 165400, 9500.0, FALSE, 2, 4, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('ACCORD', 2019, 2.0, 'Gold', 56492, 15927.0, FALSE, 2, 3, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('ODYSSEY', 2011, 3.5, 'Gris', 158000, 6490.0, FALSE, 2, 2, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CIVIC', 2015, 2.0, 'Blanco', 117000, 9000.0, FALSE, 2, 3, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CR-V', 2018, 2.4, 'Azul', 142350, 14700.0, FALSE, 2, 4, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CR-V', 2015, 2.4, 'Blanco', 92000, 9900.0, FALSE, 2, 4, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('PILOT', 2017, 3.5, 'Gris', 115670, 13500.0, FALSE, 2, 4, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('ODYSSEY', 2013, 3.5, 'Roja', 171000, 10000.0, FALSE, 2, 2, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CIVIC', 2016, 2.0, 'Negro', 93250, 8500.0, FALSE, 2, 3, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CR-V', 2015, 2.4, 'Roja', 150000, 10800.0, FALSE, 2, 4, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('PILOT', 2017, 3.5, 'Negro', 170000, 9500.0, FALSE, 2, 4, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CIVIC', 2013, 2.0, 'Gris', 102000, 6999.0, FALSE, 2, 3, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('ACCORD', 2017, 2.0, 'Azul', 176500, 9500.0, FALSE, 2, 3, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('ODYSSEY', 2022, 3.5, 'Negro', 118995, 23495.0, FALSE, 2, 2, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CIVIC', 2013, 2.0, 'Rojo', 102789, 15000.0, FALSE, 2, 3, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('ACCORD', 2019, 2.0, 'Rojo', 90752, 15800.0, FALSE, 2, 3, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('PILOT', 2016, 3.5, 'Blanco', 93000, 11500.0, FALSE, 2, 4, 1);

-- insertar vehiculos Mazda
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CX-9', 2022, 2.5, 'Rojo', 30000, 21200.0, FALSE, 3, 4, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('3', 2014, 2.0, 'Blanco', 122126, 10900.0, FALSE, 3, 3, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CX-3', 2016, 2.0, 'Rojo', 36930, 19998.0, FALSE, 3, 1, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CX-9', 2015, 3.7, 'Blanco', 103000, 8300.0, FALSE, 3, 4, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('3', 2015, 2.0, 'Gris', 37000, 14000.0, FALSE, 3, 1, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CX-3', 2017, 2.0, 'Gold', 16064, 13800.0, FALSE, 3, 1, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('6', 2015, 2.5, 'Blanco', 136965, 8700.0, FALSE, 3, 3, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CX-9', 2021, 2.5, 'Azul', 111000, 24200.0, FALSE, 3, 4, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CX-50', 2024, 2.5, 'Rojo', 13281, 23500.0, TRUE, 3, 4, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('3', 2014, 2.0, 'Rojo', 157000, 7495.0, FALSE, 3, 1, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CX-3', 2017, 2.0, 'Azul', 131000, 9990.0, FALSE, 3, 1, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CX-50', 2025, 2.5, 'Negro', 4150, 33995.0, TRUE, 3, 4, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CX-9', 2023, 2.5, 'Negro', 34093, 29774.0, TRUE, 3, 4, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('6', 2014, 2.5, 'Gris', 130000, 8995.0, FALSE, 3, 3, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('3', 2014, 2.0, 'Azul', 107504, 9495.0, FALSE, 3, 3, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CX-3', 2017, 2.0, 'Blanco', 145789, 8500.0, FALSE, 3, 1, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CX-50', 2023, 2.5, 'Blanco', 29916, 29325.0, TRUE, 3, 4, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CX-9', 2014, 3.7, 'Blanco', 149321, 6500.0, FALSE, 3, 4, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CX-90', 2024, 3.3, 'Roja', 11200, 28400.0, TRUE, 3, 4, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('3', 2015, 2.0, 'Azul', 92780, 9490.0, FALSE, 3, 3, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CX-3', 2016, 2.0, 'Rojo', 145504, 7800.0, FALSE, 3, 1, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CX-90', 2025, 3.3, 'Blanco', 300, 58300.0, TRUE, 3, 4, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CX-9', 2023, 2.5, 'Azul', 30000, 30633.0, TRUE, 3, 4, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CX-3', 2016, 2.0, 'Negro', 119000, 8200.0, FALSE, 3, 1, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('6', 2015, 2.5, 'Rojo', 95689, 6900.0, FALSE, 3, 1, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('3', 2017, 2.0, 'Gris', 67320, 12999.0, FALSE, 3, 3, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CX-3', 2017, 2.0, 'Gris', 61335, 16899.0, FALSE, 3, 1, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CX-50', 2024, 2.5, 'Rojo', 13281, 23500.0, TRUE, 3, 4, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('6', 2015, 2.5, 'Azul', 96000, 6500.0, FALSE, 3, 3, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('3', 2018, 2.0, 'Negro', 70000, 17000.0, FALSE, 3, 3, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CX-50', 2024, 2.5, 'Negro', 22163, 25874.0, TRUE, 3, 4, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CX-90', 2024, 3.3, 'Blanco', 24064, 32799.0, TRUE, 3, 4, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CX-50', 2025, 2.5, 'Gold', 300, 41287.0, TRUE, 3, 4, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('6', 2016, 2.5, 'Negro', 97213, 6500.0, FALSE, 3, 1, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CX-90', 2024, 3.3, 'Gris', 17234, 38500.0, TRUE, 3, 4, 1);

-- insertar vehiculos Tesla
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('Y', 2022, NULL, 'Negro', 47000, 26000.0, FALSE, 4, 1, 3);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('3', 2024, NULL, 'Negro', 12500, 34990.0, TRUE, 4, 3, 3);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('X', 2016, NULL, 'Gris', 101000, 29999.0, FALSE, 4, 1, 3);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('S', 2014, NULL, 'Blanco', 155918, 16000.0, FALSE, 4, 1, 3);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('X', 2024, NULL, 'Blanco', 15744, 61490.0, TRUE, 4, 1, 3);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('Y', 2022, NULL, 'Blanco', 68699, 23999.0, FALSE, 4, 1, 3);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('3', 2022, NULL, 'Blanco', 59615, 21935.0, TRUE, 4, 3, 3);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('X', 2022, NULL, 'Azul', 64000, 43200.0, FALSE, 4, 1, 3);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('S', 2018, NULL, 'Rojo', 40000, 27888.0, FALSE, 4, 1, 3);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('Y', 2024, NULL, 'Negro', 38000, 33000.0, TRUE, 4, 1, 3);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('S', 2017, NULL, 'Gris', 159218, 19000.0, FALSE, 4, 1, 3);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('3', 2021, NULL, 'Gris', 102830, 18500.0, FALSE, 4, 3, 3);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('Y', 2022, NULL, 'Gris', 27501, 30900.0, FALSE, 4, 1, 3);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('S', 2014, NULL, 'Silver', 111000, 11999.0, FALSE, 4, 1, 3);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('3', 2018, NULL, 'Azul', 155540, 27000.0, FALSE, 4, 3, 3);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('X', 2019, NULL, 'Silver', 24000, 19800.0, FALSE, 4, 1, 3);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('Y', 2021, NULL, 'Azul', 107065, 19995.0, FALSE, 4, 1, 3);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CYBER-TRUCK', 2024, NULL, 'Silver', 4700, 98000.0, TRUE, 4, 5, 3);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('S', 2016, NULL, 'Negro', 168100, 13000.0, FALSE, 4, 1, 3);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CYBER-TRUCK', 2024, NULL, 'Negro', 14867, 109995.0, TRUE, 4, 5, 3);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('X', 2022, NULL, 'Azul', 64000, 43000.0, FALSE, 4, 1, 3);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CYBER-TRUCK', 2024, NULL, 'Militar', 6445, 94800.0, TRUE, 4, 5, 3);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('S', 2019, NULL, 'Silver', 24894, 19200.0, FALSE, 4, 1, 3);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('3', 2019, NULL, 'Negro', 73365, 19995.0, FALSE, 4, 3, 3);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('X', 2016, NULL, 'Gris', 114000, 20000.0, FALSE, 4, 1, 3);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CYBER-TRUCK', 2024, NULL, 'Silver', 2800, 102990.0, TRUE, 4, 5, 3);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('S', 2019, NULL, 'Blanco', 46412, 28000.0, FALSE, 4, 1, 3);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CYBER-TRUCK', 2024, NULL, 'Silver', 19800, 88900.0, TRUE, 4, 5, 3);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('Y', 2025, NULL, 'Gris', 4337, 36795.0, TRUE, 4, 1, 3);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CYBER-TRUCK', 2025, NULL, 'Negro', 1200, 118000.0, TRUE, 4, 5, 3);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('3', 2021, NULL, 'Blanco', 27444, 25500.0, FALSE, 4, 3, 3);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CYBER-TRUCK', 2024, NULL, 'Gris', 6700, 106800.0, TRUE, 4, 5, 3);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('3', 2022, NULL, 'Blanco', 20021, 16900.0, FALSE, 4, 3, 3);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CYBER-TRUCK', 2025, NULL, 'Silver', 2100, 117800.0, TRUE, 4, 5, 3);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('X', 2024, NULL, 'Negro', 16626, 60990.0, TRUE, 4, 1, 3);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('Y', 2021, NULL, 'Blanco', 90000, 18990.0, FALSE, 4, 1, 3);

-- insertar vehiculos Ford
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('ESCAPE', 2018, 2.5, 'Azul', 63361, 13989.0, FALSE, 5, 4, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('F-150', 2017, 3.7, 'Silver', 104246, 11800.0, FALSE, 5, 5, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('EXPLORER', 2016, 3.5, 'Negro', 88000, 10200.0, FALSE, 5, 4, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('F-150', 2022, 2.7, 'Negro', 40000, 49000.0, FALSE, 5, 5, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('ESCAPE', 2023, 1.5, 'Gris', 19289, 29970.0, TRUE, 5, 4, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('EXPLORER', 2020, 2.3, 'Blanco', 69235, 23995.0, FALSE, 5, 4, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('F-150', 2020, 2.7, 'Negro', 108000, 29339.0, FALSE, 5, 5, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('ESCAPE', 2017, 2.5, 'Negro', 152000, 7200.0, FALSE, 5, 4, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('F-150', 2016, 3.7, 'Azul', 91653, 19999.0, FALSE, 5, 5, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('EXPLORER', 2016, 3.5, 'Blanco', 65000, 8200.0, FALSE, 5, 4, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('F-150', 2020, 2.7, 'Blanco', 82000, 17800.0, FALSE, 5, 5, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('EDGE', 2018, 2.0, 'Negro', 82000, 8900.0, FALSE, 5, 4, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('ESCAPE', 2017, 2.5, 'Rojo', 117224, 7459.0, FALSE, 5, 4, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('EDGE', 2017, 2.0, 'Blanco', 85000, 8000.0, FALSE, 5, 4, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('EXPLORER', 2023, 2.3, 'Blanco', 48231, 27812.0, TRUE, 5, 4, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('EDGE', 2022, 2.0, 'Gris', 67993, 18917.0, FALSE, 5, 4, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('EXPLORER', 2020, 3.5, 'Azul', 78900, 16800.0, FALSE, 5, 4, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('ESCAPE', 2015, 2.5, 'Silver', 102000, 9200.0, FALSE, 5, 4, 1);
INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('EDGE', 2020, 2.0, 'Negro', 89000, 15800.0, FALSE, 5, 4, 1);