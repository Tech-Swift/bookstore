DUMP FOR THE TABLES

BEGIN;

-- 1. Insert into book_language
INSERT INTO book_language (language_name) VALUES
('English'),
('Spanish'),
('French'),
('German'),
('Chinese'),
('Japanese'),
('Russian');

-- 2. Insert into country
INSERT INTO country (country_name) VALUES
('Kenya'),
('Uganda'),
('Tanzania'),
('South Africa'),
('Germany'),
('France'),
('Japan'),
('Spain');

-- 3. Insert into address_status
INSERT INTO address_status (status_name) VALUES
('Primary'),
('Secondary'),
('Business'),
('Shipping'),
('Billing');

-- 4. Insert into publisher
INSERT INTO publisher (name, contact_email, phone_number) VALUES
('Penguin Random House', 'contact@penguinrandomhouse.com', '+1-212-782-9000'),
('HarperCollins', 'info@harpercollins.com', '+1-212-207-7000'),
('Simon & Schuster', 'inquiries@simonandschuster.com', '+1-212-698-7000'),
('Hachette Livre', 'contact@hachette-livre.fr', '+33-1-4392-3000'),
('Macmillan Publishers', 'support@macmillan.com', '+44-20-7014-6000');

-- 5. Insert into author
INSERT INTO author (first_name, last_name) VALUES
('George', 'Orwell'),
('J.K.', 'Rowling'),
('Stephen', 'King'),
('Agatha', 'Christie'),
('Haruki', 'Murakami'),
('Gabriel', 'García Márquez'),
('Jane', 'Austen'),
('Ernest', 'Hemingway');

-- 6. Insert into book
INSERT INTO book (title, isbn, publication_year, price, publisher_id, language_id) VALUES
('1984', '9780451524935', 1949, 9.99, 1, 1),
('Animal Farm', '9780451526342', 1945, 7.99, 1, 1),
('Harry Potter and the Philosopher''s Stone', '9780747532743', 1997, 12.99, 2, 1),
('The Shining', '9780307743657', 1977, 14.99, 3, 1),
('Murder on the Orient Express', '9780062073501', 1934, 10.99, 2, 1),
('Norwegian Wood', '9780375704024', 1987, 11.99, 4, 5),
('One Hundred Years of Solitude', '9780060883287', 1967, 13.99, 2, 2),
('Pride and Prejudice', '9780141439518', 1813, 6.99, 5, 1),
('The Old Man and the Sea', '9780684801223', 1952, 8.99, 3, 1);

-- 7. Insert into book_author
INSERT INTO book_author (book_id, author_id) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 4),
(6, 5),
(7, 6),
(8, 7),
(9, 8);

-- 8. Insert into customer
INSERT INTO customer (first_name, last_name, email, phone) VALUES
('John', 'Smith', 'john.smith@example.com', '+1-555-123-4567'),
('Emily', 'Johnson', 'emily.j@example.com', '+44-20-7123-4567'),
('Carlos', 'Garcia', 'c.garcia@example.com', '+34-91-123-4567'),
('Sophie', 'Martin', 'sophie.m@example.com', '+33-1-2345-6789'),
('Yuki', 'Tanaka', 'y.tanaka@example.com', '+81-3-1234-5678');

-- 9. Insert into address
INSERT INTO address (street, city, postal_code, country_id) VALUES
('123 Main St', 'New York', '10001', 1),
('456 Elm Ave', 'London', 'SW1A 1AA', 2),
('789 Oak Blvd', 'Toronto', 'M5V 2H1', 3),
('10 Rue de la Paix', 'Paris', '75002', 6),
('3-5-1 Marunouchi', 'Tokyo', '100-0005', 7),
('200 Broadway', 'New York', '10038', 1),
('15 Charing Cross Rd', 'London', 'WC2H 0EW', 2);

-- 10. Insert into customer_address
INSERT INTO customer_address (customer_id, address_id, status_id) VALUES
(1, 1, 1),
(1, 6, 4),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(2, 7, 3);

-- 11. Insert into order_status
INSERT INTO order_status (status_name) VALUES
('Pending'),
('Processing'),
('Shipped'),
('Delivered'),
('Cancelled');

-- 12. Insert into shipping_method
INSERT INTO shipping_method (method_name) VALUES
('Standard Shipping'),
('Express Shipping'),
('International Shipping'),
('Store Pickup');

-- 13. Insert into cust_order
INSERT INTO cust_order (customer_id, order_date, shipping_method_id, status_id) VALUES
(1, '2023-05-15 10:30:00', 1, 4),
(2, '2023-06-20 14:15:00', 3, 3),
(3, '2023-07-10 09:45:00', 2, 2),
(1, '2023-08-05 16:20:00', 1, 1),
(4, '2023-08-12 11:10:00', 4, 4);

-- 14. Insert into order_line
INSERT INTO order_line (order_id, book_id, quantity, price) VALUES
(1, 1, 1, 9.99),
(1, 3, 2, 12.99),
(2, 6, 1, 11.99),
(2, 7, 1, 13.99),
(3, 4, 1, 14.99),
(4, 2, 3, 7.99),
(4, 8, 1, 6.99),
(5, 5, 2, 10.99);

-- 15. Insert into order_history
INSERT INTO order_history (order_id, status_id, changed_at, comment) VALUES
(1, 1, '2023-05-15 10:30:00', 'Order placed'),
(1, 2, '2023-05-16 09:15:00', 'Payment confirmed'),
(1, 3, '2023-05-17 14:30:00', 'Shipped via Standard Shipping'),
(1, 4, '2023-05-20 11:45:00', 'Delivered to customer'),
(2, 1, '2023-06-20 14:15:00', 'Order placed'),
(2, 2, '2023-06-21 10:30:00', 'Payment confirmed'),
(2, 3, '2023-06-22 16:45:00', 'Shipped internationally'),
(3, 1, '2023-07-10 09:45:00', 'Order placed'),
(3, 2, '2023-07-10 15:20:00', 'Processing'),
(4, 1, '2023-08-05 16:20:00', 'Order placed'),
(5, 1, '2023-08-12 11:10:00', 'Order placed'),
(5, 4, '2023-08-12 15:30:00', 'Picked up in store');

COMMIT;







