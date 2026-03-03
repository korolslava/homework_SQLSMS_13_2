# Bank Commission & Transaction Management (SQL)

## 📌 Project Overview

This repository contains a practical implementation of banking database logic using Microsoft SQL Server (T-SQL). The project focuses on designing a robust relational schema, implementing business rules through scalar functions, and managing financial transactions directly at the database layer.

---

## 🚀 Key Features

### ✅ Database Architecture

Design and implementation of relational tables for managing bank accounts, clients, and transactions.

### ✅ Custom Scalar Functions

Implementation of automatic fee calculation logic (for example, a 2% commission for bank transfers).

### ✅ Data Integrity

Use of primary keys, foreign keys, and constraints to ensure data consistency across the banking system.

### ✅ Advanced Querying

Complex SQL scripts for data retrieval, filtering, and financial reporting.

### ✅ Transaction Simulation

Logic to handle money transfers between accounts while maintaining balance accuracy and transactional consistency.

---

## 🛠 Technology Stack

| Category | Technology                          |
| -------- | ----------------------------------- |
| RDBMS    | Microsoft SQL Server                |
| Language | T-SQL (Transact-SQL)                |
| Tooling  | SQL Server Management Studio (SSMS) |

---

## 📂 Project Structure

```
Scripts/     — SQL files containing table definitions (DDL)
Functions/   — Custom scalar-valued functions for commission and tax calculations
Queries/     — DML scripts for inserting data and testing system logic
Procedures/  — (If applicable) Stored procedures for executing multi-step banking operations
```

---

## ⚙️ Setup and Usage

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/korolslava/homework_SQLSMS_13_2.git
```

---

### 2️⃣ Execute Database Scripts

1. Open SQL Server Management Studio (SSMS).
2. Connect to your local or remote SQL Server instance.
3. Open and execute the main `.sql` file to create the database and tables.

---

### 3️⃣ Deploy Functions

Navigate to the `Functions` directory and execute the scripts to register the commission calculation logic in your database.

---

### 4️⃣ Run Tests

Use the provided query scripts to verify that commissions are calculated correctly during transfers.

---

## 📝 Project Goal

This project was developed as part of a database management course to master the implementation of business rules directly within the SQL layer. It demonstrates the ability to automate financial calculations using advanced T-SQL features and ensure transactional consistency in a banking environment.
