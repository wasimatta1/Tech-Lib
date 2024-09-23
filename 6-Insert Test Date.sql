-- Insert new books into the Books table
INSERT INTO Books (Title, Author, ISBN, PublishedDate, Genre, ShelfLocation, CurrentStatus)
VALUES
    ('Mastering SQL', 'John Adams', '978-1-234567-01-0', '2021-01-15', 'Technology', 'A1', 'Available'),
    ('Data Structures in Depth', 'Emily Blake', '978-1-234567-02-7', '2020-05-12', 'Education', 'B2', 'Available'),
    ('Advanced Algorithms', 'David Carter', '978-1-234567-03-4', '2019-11-08', 'Education', 'C3', 'Available'),
    ('The Future of AI', 'Michael Davis', '978-1-234567-04-1', '2022-08-23', 'Science', 'D4', 'Available'),
    ('Machine Learning Applications', 'Sarah Edwards', '978-1-234567-05-8', '2021-10-30', 'Technology', 'E5', 'Borrowed');

-- Case 1: Late return, less than 30 days overdue
INSERT INTO Loans (BookID, BorrowerID, DateBorrowed, DueDate, DateReturned)
VALUES (1001, 102, '2023-08-01', '2023-08-31', '2023-09-10');  -- 10 days late

-- Case 2: Late return, exactly 30 days overdue
INSERT INTO Loans (BookID, BorrowerID, DateBorrowed, DueDate, DateReturned)
VALUES (1002, 103, '2023-06-01', '2023-06-30', '2023-07-30');  -- 30 days late

-- Case 3: Late return, more than 30 days overdue
INSERT INTO Loans (BookID, BorrowerID, DateBorrowed, DueDate, DateReturned)
VALUES (1003, 104, '2023-05-01', '2023-05-31', '2023-07-15');  -- 45 days late

-- Case 4: Returned on time
INSERT INTO Loans (BookID, BorrowerID, DateBorrowed, DueDate, DateReturned)
VALUES (1004, 105, '2023-07-01', '2023-07-31', '2023-07-30');  -- Returned one day early

-- Case 5: Not returned yet (still borrowed)
INSERT INTO Loans (BookID, BorrowerID, DateBorrowed, DueDate, DateReturned)
VALUES (1005, 106, '2023-08-15', '2023-09-14', NULL);  -- Still borrowed, not yet returned
