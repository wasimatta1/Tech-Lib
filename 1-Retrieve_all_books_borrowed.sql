--List of Borrowed Books: Retrieve all books borrowed by a specific borrower, including those currently unreturned.

DROP FUNCTION IF EXISTS Retrieve_all_books_borrowed;
GO
CREATE FUNCTION Retrieve_all_books_borrowed(@id INT)
RETURNS TABLE
AS
RETURN 
    SELECT BookID, DateBorrowed, DueDate, DateReturned
    FROM Loans
    WHERE BorrowerID = @id;


SELECT * FROM Retrieve_all_books_borrowed(1);

