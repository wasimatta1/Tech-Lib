-- Insert into Books
INSERT INTO Books (Title, Author, ISBN, PublishedDate, Genre, ShelfLocation, CurrentStatus)
VALUES
('The Catcher in the Rye', 'J.D. Salinger', '9780316769488', '1951-07-16', 'Fiction', 'Shelf 1', 'Available'),
('Brave New World', 'Aldous Huxley', '9780060850524', '1932-08-30', 'Dystopian', 'Shelf 2', 'Borrowed'),
('The Great Gatsby', 'F. Scott Fitzgerald', '9780743273565', '1925-04-10', 'Fiction', 'Shelf 3', 'Available'),
('1984', 'George Orwell', '9780451524935', '1949-06-08', 'Dystopian', 'Shelf 4', 'Borrowed'),
('To Kill a Mockingbird', 'Harper Lee', '9780060935463', '1960-07-11', 'Fiction', 'Shelf 5', 'Available'),
('Pride and Prejudice', 'Jane Austen', '9780141439518', '1813-01-28', 'Romance', 'Shelf 6', 'Borrowed'),
('The Hobbit', 'J.R.R. Tolkien', '9780547928227', '1937-09-21', 'Fantasy', 'Shelf 7', 'Available'),
('Frankenstein', 'Mary Shelley', '9780486282114', '1818-01-01', 'Gothic', 'Shelf 8', 'Borrowed'),
('Moby-Dick', 'Herman Melville', '9781503280786', '1851-10-18', 'Adventure', 'Shelf 9', 'Available'),
('Les Misérables', 'Victor Hugo', '9780451419439', '1862-01-01', 'Historical', 'Shelf 10', 'Borrowed');
-- Insert into Borrowers
INSERT INTO Borrowers (FirstName, LastName, Email, DateOfBirth, MembershipDate)
VALUES
('John', 'Doe', 'john.doe@example.com', '1990-05-15', '2024-01-10'),
('Jane', 'Smith', 'jane.smith@example.com', '1985-11-22', '2023-09-05'),
('Emily', 'Johnson', 'emily.johnson@example.com', '1992-03-09', '2024-02-18'),
('Michael', 'Brown', 'michael.brown@example.com', '1988-07-30', '2024-03-25'),
('Sarah', 'Davis', 'sarah.davis@example.com', '1995-12-01', '2023-12-15'),
('David', 'Wilson', 'david.wilson@example.com', '1993-06-20', '2024-05-30'),
('Laura', 'Taylor', 'laura.taylor@example.com', '1991-09-14', '2024-04-10'),
('Robert', 'Anderson', 'robert.anderson@example.com', '1987-02-28', '2023-10-25'),
('Olivia', 'Thomas', 'olivia.thomas@example.com', '1994-08-19', '2024-01-22'),
('James', 'Martinez', 'james.martinez@example.com', '1989-12-09', '2023-11-14');
-- Insert into Loans
INSERT INTO Loans (BookID, BorrowerID, DateBorrowed, DueDate, DateReturned)
VALUES
(1, 1, '2024-08-01', '2024-08-15', '2024-08-15'), -- Returned on time
(2, 2, '2024-08-01', '2024-08-15', '2024-08-20'), -- Returned late
(3, 3, '2024-08-01', '2024-08-15', NULL),           -- Not yet returned
(4, 4, '2024-08-01', '2024-08-15', '2024-08-10'),    -- Returned before the due date
(5, 5, '2024-08-01', '2024-08-01', '2024-08-01'),    -- Returned on the same day as borrowed
(6, 6, '2024-01-01', '2024-06-01', '2024-09-01'),    -- Returned after an extended period
(7, 7, '2024-03-01', '2024-04-01', '2024-03-31'),    -- Returned one day early
(8, 8, '2024-07-01', '2024-08-01', '2024-08-01'),    -- Returned on the due date
(9, 9, '2024-02-01', '2024-03-01', NULL),            -- Currently borrowed
(10, 10, '2024-05-01', '2024-06-01', '2024-06-05');  -- Returned 4 days late
