DROP TABLE IF EXISTS pizza_orders;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
  );
  
CREATE TABLE pizza_orders (
  id SERIAL4 PRIMARY KEY,
  quantity INT,
  topping VARCHAR(255),
  customer_id INT REFERENCES customers(id) ON DELETE CASCADE
  );
