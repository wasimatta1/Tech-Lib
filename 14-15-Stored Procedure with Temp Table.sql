--SQL Stored Procedure with Temp Table:
--Design a stored procedure that retrieves all borrowers who have overdue books. Store these borrowers in a temporary table,
-- then join this temp table with the Loans table to list out the specific overdue books for each borrower.

Drop Procedure if exists sp_GetOverdueBorrowers;
GO
CREATE PROCEDURE sp_GetOverdueBorrowers
AS
BEGIN
    CREATE TABLE #OverdueBorrowers
    (
        BorrowerID INT,
        FirstName NVARCHAR(100),
        LastName NVARCHAR(100)
    );

    INSERT INTO #OverdueBorrowers (BorrowerID, FirstName, LastName)
    SELECT B.BorrowerID,B.FirstName,B.LastName
    FROM Borrowers B JOIN Loans L ON B.BorrowerID = L.BorrowerID
    WHERE L.DateReturned IS NULL AND L.DueDate < GETDATE();

    SELECT OB.BorrowerID, OB.FirstName, OB.LastName,L.BookID, L.DateBorrowed,L.DueDate,
           DATEDIFF(DAY, L.DueDate, GETDATE()) AS OverdueDays
    FROM #OverdueBorrowers OB JOIN  Loans L ON OB.BorrowerID = L.BorrowerID
    WHERE L.DateReturned IS NULL AND L.DueDate < GETDATE();

    DROP TABLE #OverdueBorrowers;
END;

EXEC sp_GetOverdueBorrowers;
