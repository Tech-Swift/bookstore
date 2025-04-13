CREATE DATABASE bookstore_db;

CREATE TABLE book_language (
    id SERIAL PRIMARY KEY,
    language_name VARCHAR(50) NOT NULL
);

CREATE TABLE publisher (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    contact_email VARCHAR(100),
    phone_number VARCHAR(20)
);

CREATE TABLE book (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    isbn VARCHAR(20) UNIQUE,
    publication_year INT,
    price DECIMAL(10, 2),
    publisher_id INT,
    language_id INT,
    FOREIGN KEY (publisher_id) REFERENCES publisher(id),
    FOREIGN KEY (language_id) REFERENCES book_language(id)
);

CREATE TABLE author (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100)
);

CREATE TABLE book_author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(id),
    FOREIGN KEY (author_id) REFERENCES author(id)
);

CREATE TABLE country (
    id SERIAL PRIMARY KEY,
    country_name VARCHAR(100) NOT NULL
);

CREATE TABLE address_status (
    id SERIAL PRIMARY KEY,
    status_name VARCHAR(50) NOT NULL 
);

CREATE TABLE address (
    id SERIAL PRIMARY KEY,
    street VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    postal_code VARCHAR(20),
    country_id INT REFERENCES country(id)
);

CREATE TABLE customer (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    phone VARCHAR(20)
);

CREATE TABLE customer_address (
    customer_id INT REFERENCES customer(id),
    address_id INT REFERENCES address(id),
    status_id INT REFERENCES address_status(id),
    PRIMARY KEY (customer_id, address_id)
);

CREATE TABLE order_status (
    id SERIAL PRIMARY KEY,
    status_name VARCHAR(50) NOT NULL 
);

CREATE TABLE shipping_method (
    id SERIAL PRIMARY KEY,
    method_name VARCHAR(100) NOT NULL
);

CREATE TABLE cust_order (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customer(id),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    shipping_method_id INT REFERENCES shipping_method(id),
    status_id INT REFERENCES order_status(id)
);

CREATE TABLE order_line (
    id SERIAL PRIMARY KEY,
    order_id INT REFERENCES cust_order(id),
    book_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE order_history (
    id SERIAL PRIMARY KEY,
    order_id INT REFERENCES cust_order(id),
    status_id INT REFERENCES order_status(id),
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    comment TEXT
);

ALTER TABLE order_line ADD FOREIGN KEY (book_id) REFERENCES book(id);


