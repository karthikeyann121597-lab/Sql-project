CREATE DATABASE bank_db;
USE bank_db;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50)
);
CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    customer_id INT,
    account_type VARCHAR(50),
    balance DECIMAL(12,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT,
    transaction_type VARCHAR(20),
    amount DECIMAL(10,2),
    transaction_date DATE,
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);
INSERT INTO customers VALUES
(1, 'Rohan Gupta', 'Delhi'),
(2, 'Priya Singh', 'Mumbai');
INSERT INTO accounts VALUES
(101, 1, 'Savings', 50000),
(102, 2, 'Current', 80000);
INSERT INTO transactions VALUES
(1001, 101, 'Deposit', 10000, '2025-01-01'),
(1002, 101, 'Withdraw', 5000, '2025-01-05'),
(1003, 102, 'Deposit', 20000, '2025-01-10');
SELECT c.name, SUM(a.balance) AS total_balance
FROM customers c
JOIN accounts a ON c.customer_id = a.customer_id
GROUP BY c.name;
SELECT transaction_type, SUM(amount) AS total_amount
FROM transactions
GROUP BY transaction_type;