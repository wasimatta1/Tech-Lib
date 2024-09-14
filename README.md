# Library Management System: Database Project

## Project Overview:
This project implements a relational database for a local library to manage books, borrowers, and loans. It provides an efficient system to track borrowing, returns, and offers analytical insights into borrowing trends and overdue management.

## Objective:
- Design and implement an SQL database to support library operations.
- Provide complex querying capabilities for library management.
- Automate processes like borrower and book management using stored procedures and triggers.

## Database Design:

### ER Diagram:
- **Entities**: Books, Borrowers, Loans.
- **Attributes**: Each entity has detailed attributes for tracking key information (e.g., BookID, BorrowerID, LoanID, etc.).
- **Relationships**: The relationships between these entities ensure proper database normalization and data integrity.
- **Keys**: Primary and foreign keys are used to link tables.

### Tables:
- **Books**: Stores information on all books available in the library.
- **Borrowers**: Stores personal information of all borrowers.
- **Loans**: Tracks which books have been borrowed, when, and by whom.

## Seeding the Database:
The repository includes SQL scripts to seed the database with 1000 fictional records for each table (`Books`, `Borrowers`, and `Loans`). These scripts populate the database with realistic data for testing and analysis.

- **Books Seed**: `seed_books.sql`
- **Borrowers Seed**: `seed_borrowers.sql`
- **Loans Seed**: `seed_loans.sql`

## Stored Procedures and Functions:
### 1. `sp_AddNewBorrower`:
- **Purpose**: Adds a new borrower if their email does not already exist.
- **Parameters**: FirstName, LastName, Email, DateOfBirth, MembershipDate.
- **Return**: The new BorrowerID or an error message.

### 2. `fn_CalculateOverdueFees`:
- **Purpose**: Calculates the overdue fees for a specific loan.
- **Parameters**: LoanID.
- **Return**: The overdue fee based on the number of overdue days.

### 3. `fn_BookBorrowingFrequency`:
- **Purpose**: Determines how many times a specific book has been borrowed.
- **Parameters**: BookID.
- **Return**: The borrowing count for the book.

### 4. `sp_BorrowedBooksReport`:
- **Purpose**: Generates a report of all books borrowed within a specific date range.
- **Parameters**: StartDate, EndDate.
- **Return**: A tabulated report of borrowed books.

## Triggers:
### 1. `trg_LogBookStatusChange`:
- **Purpose**: Logs an entry into an `AuditLog` table whenever a book’s status changes from 'Available' to 'Borrowed' or vice versa.
- **Captured Data**: BookID, StatusChange, ChangeDate.

## Analytical Queries:
### 1. **Popular Genre Analysis**:
- **Query**: Identifies the most popular genre for a given month using joins and window functions.
  
### 2. **Borrowing Frequency Ranking**:
- **Query**: Ranks borrowers based on how frequently they borrow books.

### 3. **Overdue Analysis**:
- **Query**: Lists all books overdue by more than 30 days with the borrower’s information.

### 4. **Author Popularity**:
- **Query**: Ranks authors based on the borrowing frequency of their books.

## Bonus Feature:
### Weekly Peak Days Analysis:
- **Query**: Determines the top 3 days of the week with the highest number of loans as a percentage of total loans. This helps the library identify peak days to allocate resources efficiently.

## Conclusion:
This database provides a comprehensive solution to manage library operations, automate routine tasks, and provide data insights for better decision-making. All SQL scripts, stored procedures, and triggers are included in this repository.
