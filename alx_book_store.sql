-- alx_book_store.sql

DROP DATABASE IF EXISTS alx_book_store;
CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

-- AUTHORS TABLE
CREATE TABLE IF NOT EXISTS AUTHORS (
  author_id INT AUTO_INCREMENT PRIMARY KEY,
  author_name VARCHAR(215) NOT NULL
) ENGINE=InnoDB;

-- BOOKS TABLE
CREATE TABLE IF NOT EXISTS BOOKS (
  book_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(130) NOT NULL,
  author_id INT NOT NULL,
  price DOUBLE NOT NULL,
  publication_date DATE,
  CONSTRAINT fk_books_authors FOREIGN KEY (author_id) REFERENCES AUTHORS(author_id)
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

-- CUSTOMERS TABLE
CREATE TABLE IF NOT EXISTS CUSTOMERS (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_name VARCHAR(215) NOT NULL,
  email VARCHAR(215) UNIQUE,
  address TEXT
) ENGINE=InnoDB;

-- ORDERS TABLE
CREATE TABLE IF NOT EXISTS ORDERS (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT NOT NULL,
  order_date DATE NOT NULL,
  CONSTRAINT fk_orders_customers FOREIGN KEY (customer_id) REFERENCES CUSTOMERS(customer_id)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

-- ORDER_DETAILS TABLE
CREATE TABLE IF NOT EXISTS ORDER_DETAILS (
  orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT NOT NULL,
  book_id INT NOT NULL,
  quantity DOUBLE NOT NULL,
  CONSTRAINT fk_orderdetails_orders FOREIGN KEY (order_id) REFERENCES ORDERS(order_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_orderdetails_books FOREIGN KEY (book_id) REFERENCES BOOKS(book_id)
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

-- SAMPLE DATA (optional) - useful for quick testing
INSERT INTO AUTHORS (author_name) VALUES
('Chinua Achebe'),
('Jane Austen');

INSERT INTO BOOKS (title, author_id, price, publication_date) VALUES
('Things Fall Apart', 1, 12.99, '1958-06-17'),
('Pride and Prejudice', 2, 9.5, '1813-01-28');

INSERT INTO CUSTOMERS (customer_name, email, address) VALUES
('Gladys Uchola', 'gladys@example.com', 'Abu Dhabi, UAE'),
('John Doe', 'john@example.com', 'Lagos, Nigeria');

INSERT INTO ORDERS (customer_id, order_date) VALUES
(1, '2025-10-16'),
(2, '2025-10-10');

INSERT INTO ORDER_DETAILS (order_id, book_id, quantity) VALUES
(1, 1, 2),
(1, 2, 1),
(2, 2, 3);

-- END OF SCRIPT
COMMIT;
