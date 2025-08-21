DROP DATABASE IF EXISTS coffee_db;

CREATE DATABASE IF NOT EXISTS coffee_db;

USE coffee_db;

CREATE TABLE ingredients (
    ingredient_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ingredient_name NVARCHAR (100) NOT NULL UNIQUE,
    unit NVARCHAR (20) NOT NULL,
    stock_quantity DECIMAL(10, 2) NOT NULL DEFAULT 0,
    CHECK (stock_quantity >= 0)
);

CREATE TABLE products (
    product_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    product_name NVARCHAR (100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    category ENUM('DRINK', 'FOOD') NOT NULL,
    CHECK (price >= 0)
);

CREATE TABLE product_ingredients (
    product_id INT NOT NULL,
    ingredient_id INT NOT NULL,
    PRIMARY KEY (product_id, ingredient_id),
    FOREIGN KEY (product_id) REFERENCES products (product_id),
    FOREIGN KEY (ingredient_id) REFERENCES ingredients (ingredient_id),
);

CREATE TABLE branches (
    branch_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    branch_name NVARCHAR (100) NOT NULL,
    address NVARCHAR (200) NOT NULL,
    phone NVARCHAR (20)
);


CREATE TABLE employees (
    employee_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    full_name NVARCHAR (100) NOT NULL,
    position NVARCHAR (50) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    branch_id INT NOT NULL,
    FOREIGN KEY (branch_id) REFERENCES branches (branch_id)
);

CREATE TABLE orders (
    order_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    branch_id INT NOT NULL,
    employee_id INT NOT NULL,
    order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (branch_id) REFERENCES branches (branch_id),
    FOREIGN KEY (employee_id) REFERENCES employees (employee_id),
    CHECK (total_amount >= 0)
);

CREATE TABLE order_items (
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders (order_id),
    FOREIGN KEY (product_id) REFERENCES products (product_id),
    CHECK (quantity > 0),
    CHECK (price >= 0)
);