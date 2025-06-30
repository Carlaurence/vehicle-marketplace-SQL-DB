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
    address VARCHAR(150),
    phone VARCHAR(20),
    UNIQUE (email)
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
  INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('CAMRY', 2014, 2.5, 'Gris', 87759, 12795.0, FALSE, 1, 3, 1);
  INSERT INTO vehicles (model, year, engine_capacity, color, mileage, price, warranty, manufacturer_id, body_style_id, fuel_type_id) VALUES ('RAV4', 2018, 2.5, 'Negro', 87297, 18490.0, FALSE, 1, 4, 1);
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

  -- random sales with corresponding vehicle update
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (135, 5, '2025-06-22', 25500);
UPDATE vehicles SET is_available = FALSE WHERE id = 135;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (28, 1, '2025-06-10', 27000);
UPDATE vehicles SET is_available = FALSE WHERE id = 28;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (25, 4, '2025-03-20', 9900);
UPDATE vehicles SET is_available = FALSE WHERE id = 25;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (30, 1, '2025-05-06', 8400);
UPDATE vehicles SET is_available = FALSE WHERE id = 30;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (118, 4, '2025-06-27', 11999);
UPDATE vehicles SET is_available = FALSE WHERE id = 118;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (32, 5, '2025-01-31', 43995);
UPDATE vehicles SET is_available = FALSE WHERE id = 32;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (23, 4, '2025-01-20', 9900);
UPDATE vehicles SET is_available = FALSE WHERE id = 23;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (44, 5, '2025-06-23', 40972);
UPDATE vehicles SET is_available = FALSE WHERE id = 44;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (15, 4, '2025-03-25', 22000);
UPDATE vehicles SET is_available = FALSE WHERE id = 15;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (39, 5, '2025-02-17', 18000);
UPDATE vehicles SET is_available = FALSE WHERE id = 39;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (105, 4, '2025-04-20', 26000);
UPDATE vehicles SET is_available = FALSE WHERE id = 105;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (95, 2, '2025-05-10', 12999);
UPDATE vehicles SET is_available = FALSE WHERE id = 95;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (55, 5, '2025-02-01', 6490);
UPDATE vehicles SET is_available = FALSE WHERE id = 55;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (4, 3, '2025-06-15', 10250);
UPDATE vehicles SET is_available = FALSE WHERE id = 4;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (155, 2, '2025-02-17', 27812);
UPDATE vehicles SET is_available = FALSE WHERE id = 155;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (34, 4, '2025-05-16', 29500);
UPDATE vehicles SET is_available = FALSE WHERE id = 34;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (157, 2, '2025-03-26', 16800);
UPDATE vehicles SET is_available = FALSE WHERE id = 157;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (47, 3, '2025-06-14', 30000);
UPDATE vehicles SET is_available = FALSE WHERE id = 47;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (129, 4, '2025-01-27', 20000);
UPDATE vehicles SET is_available = FALSE WHERE id = 129;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (88, 5, '2025-05-30', 28400);
UPDATE vehicles SET is_available = FALSE WHERE id = 88;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (122, 3, '2025-04-08', 98000);
UPDATE vehicles SET is_available = FALSE WHERE id = 122;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (79, 2, '2025-01-16', 7495);
UPDATE vehicles SET is_available = FALSE WHERE id = 79;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (125, 5, '2025-01-23', 43000);
UPDATE vehicles SET is_available = FALSE WHERE id = 125;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (21, 3, '2025-05-31', 9900);
UPDATE vehicles SET is_available = FALSE WHERE id = 21;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (159, 2, '2025-04-24', 15800);
UPDATE vehicles SET is_available = FALSE WHERE id = 159;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (102, 4, '2025-02-25', 41287);
UPDATE vehicles SET is_available = FALSE WHERE id = 102;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (98, 2, '2025-03-13', 6500);
UPDATE vehicles SET is_available = FALSE WHERE id = 98;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (145, 1, '2025-03-09', 29970);
UPDATE vehicles SET is_available = FALSE WHERE id = 145;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (75, 5, '2025-01-30', 13800);
UPDATE vehicles SET is_available = FALSE WHERE id = 75;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (27, 4, '2025-04-23', 51875);
UPDATE vehicles SET is_available = FALSE WHERE id = 27;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (57, 1, '2025-02-07', 14700);
UPDATE vehicles SET is_available = FALSE WHERE id = 57;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (156, 4, '2025-04-06', 18917);
UPDATE vehicles SET is_available = FALSE WHERE id = 156;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (64, 1, '2025-05-21', 6999);
UPDATE vehicles SET is_available = FALSE WHERE id = 64;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (91, 5, '2025-06-06', 58300);
UPDATE vehicles SET is_available = FALSE WHERE id = 91;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (115, 5, '2025-03-22', 19000);
UPDATE vehicles SET is_available = FALSE WHERE id = 115;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (112, 5, '2025-02-21', 43200);
UPDATE vehicles SET is_available = FALSE WHERE id = 112;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (96, 1, '2025-02-11', 16899);
UPDATE vehicles SET is_available = FALSE WHERE id = 96;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (60, 4, '2025-05-19', 10000);
UPDATE vehicles SET is_available = FALSE WHERE id = 60;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (53, 1, '2025-06-13', 9500);
UPDATE vehicles SET is_available = FALSE WHERE id = 53;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (130, 5, '2025-02-19', 102990);
UPDATE vehicles SET is_available = FALSE WHERE id = 130;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (150, 3, '2025-05-09', 8200);
UPDATE vehicles SET is_available = FALSE WHERE id = 150;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (131, 5, '2025-03-15', 28000);
UPDATE vehicles SET is_available = FALSE WHERE id = 131;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (110, 1, '2025-01-30', 23999);
UPDATE vehicles SET is_available = FALSE WHERE id = 110;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (143, 4, '2025-05-27', 10200);
UPDATE vehicles SET is_available = FALSE WHERE id = 143;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (7, 3, '2025-03-09', 22900);
UPDATE vehicles SET is_available = FALSE WHERE id = 7;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (104, 1, '2025-01-13', 38500);
UPDATE vehicles SET is_available = FALSE WHERE id = 104;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (127, 5, '2025-04-14', 19200);
UPDATE vehicles SET is_available = FALSE WHERE id = 127;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (18, 4, '2025-03-24', 8900);
UPDATE vehicles SET is_available = FALSE WHERE id = 18;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (128, 1, '2025-03-06', 19995);
UPDATE vehicles SET is_available = FALSE WHERE id = 128;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (70, 3, '2025-05-05', 21200);
UPDATE vehicles SET is_available = FALSE WHERE id = 70;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (42, 2, '2025-06-03', 10500);
UPDATE vehicles SET is_available = FALSE WHERE id = 42;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (78, 5, '2025-01-19', 23500);
UPDATE vehicles SET is_available = FALSE WHERE id = 78;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (65, 4, '2025-01-01', 9500);
UPDATE vehicles SET is_available = FALSE WHERE id = 65;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (119, 1, '2025-01-03', 27000);
UPDATE vehicles SET is_available = FALSE WHERE id = 119;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (17, 3, '2025-01-22', 7900);
UPDATE vehicles SET is_available = FALSE WHERE id = 17;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (99, 1, '2025-05-15', 17000);
UPDATE vehicles SET is_available = FALSE WHERE id = 99;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (16, 3, '2025-06-28', 29500);
UPDATE vehicles SET is_available = FALSE WHERE id = 16;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (10, 4, '2025-04-22', 18000);
UPDATE vehicles SET is_available = FALSE WHERE id = 10;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (8, 5, '2025-01-19', 21499);
UPDATE vehicles SET is_available = FALSE WHERE id = 8;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (77, 3, '2025-01-07', 24200);
UPDATE vehicles SET is_available = FALSE WHERE id = 77;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (84, 1, '2025-04-04', 9495);
UPDATE vehicles SET is_available = FALSE WHERE id = 84;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (154, 3, '2025-01-05', 8000);
UPDATE vehicles SET is_available = FALSE WHERE id = 154;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (136, 4, '2025-05-06', 106800);
UPDATE vehicles SET is_available = FALSE WHERE id = 136;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (85, 2, '2025-02-16', 8500);
UPDATE vehicles SET is_available = FALSE WHERE id = 85;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (26, 4, '2025-06-10', 6000);
UPDATE vehicles SET is_available = FALSE WHERE id = 26;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (3, 5, '2025-06-04', 27888);
UPDATE vehicles SET is_available = FALSE WHERE id = 3;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (144, 5, '2025-04-21', 49000);
UPDATE vehicles SET is_available = FALSE WHERE id = 144;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (66, 1, '2025-02-21', 23495);
UPDATE vehicles SET is_available = FALSE WHERE id = 66;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (36, 2, '2025-05-31', 12500);
UPDATE vehicles SET is_available = FALSE WHERE id = 36;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (87, 2, '2025-04-09', 6500);
UPDATE vehicles SET is_available = FALSE WHERE id = 87;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (71, 3, '2025-02-13', 10900);
UPDATE vehicles SET is_available = FALSE WHERE id = 71;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (83, 2, '2025-05-04', 8995);
UPDATE vehicles SET is_available = FALSE WHERE id = 83;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (72, 5, '2025-04-05', 19998);
UPDATE vehicles SET is_available = FALSE WHERE id = 72;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (35, 4, '2025-05-01', 12900);
UPDATE vehicles SET is_available = FALSE WHERE id = 35;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (62, 5, '2025-05-29', 10800);
UPDATE vehicles SET is_available = FALSE WHERE id = 62;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (5, 2, '2025-05-18', 21998);
UPDATE vehicles SET is_available = FALSE WHERE id = 5;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (24, 3, '2025-03-12', 9250);
UPDATE vehicles SET is_available = FALSE WHERE id = 24;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (81, 4, '2025-03-17', 33995);
UPDATE vehicles SET is_available = FALSE WHERE id = 81;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (103, 1, '2025-01-10', 6500);
UPDATE vehicles SET is_available = FALSE WHERE id = 103;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (61, 4, '2025-06-10', 8500);
UPDATE vehicles SET is_available = FALSE WHERE id = 61;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (58, 1, '2025-03-04', 9900);
UPDATE vehicles SET is_available = FALSE WHERE id = 58;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (133, 3, '2025-02-05', 36795);
UPDATE vehicles SET is_available = FALSE WHERE id = 133;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (116, 4, '2025-02-14', 18500);
UPDATE vehicles SET is_available = FALSE WHERE id = 116;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (29, 1, '2025-03-25', 48999);
UPDATE vehicles SET is_available = FALSE WHERE id = 29;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (68, 4, '2025-02-07', 15800);
UPDATE vehicles SET is_available = FALSE WHERE id = 68;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (134, 5, '2025-06-27', 118000);
UPDATE vehicles SET is_available = FALSE WHERE id = 134;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (37, 2, '2025-05-12', 9000);
UPDATE vehicles SET is_available = FALSE WHERE id = 37;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (59, 2, '2025-04-18', 13500);
UPDATE vehicles SET is_available = FALSE WHERE id = 59;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (56, 2, '2025-02-02', 9000);
UPDATE vehicles SET is_available = FALSE WHERE id = 56;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (51, 4, '2025-06-23', 7500);
UPDATE vehicles SET is_available = FALSE WHERE id = 51;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (52, 1, '2025-01-16', 17995);
UPDATE vehicles SET is_available = FALSE WHERE id = 52;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (149, 2, '2025-02-17', 19999);
UPDATE vehicles SET is_available = FALSE WHERE id = 149;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (1, 5, '2025-05-11', 12795);
UPDATE vehicles SET is_available = FALSE WHERE id = 1;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (124, 3, '2025-02-27', 109995);
UPDATE vehicles SET is_available = FALSE WHERE id = 124;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (153, 3, '2025-05-31', 7459);
UPDATE vehicles SET is_available = FALSE WHERE id = 153;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (147, 4, '2025-03-23', 29339);
UPDATE vehicles SET is_available = FALSE WHERE id = 147;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (114, 3, '2025-05-07', 33000);
UPDATE vehicles SET is_available = FALSE WHERE id = 114;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (94, 3, '2025-03-03', 6900);
UPDATE vehicles SET is_available = FALSE WHERE id = 94;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (106, 5, '2025-06-08', 34990);
UPDATE vehicles SET is_available = FALSE WHERE id = 106;
INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (2, 2, '2025-03-13', 18490);
UPDATE vehicles SET is_available = FALSE WHERE id = 2;
