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
        BookID INT,
        FirstName NVARCHAR(100),
        LastName NVARCHAR(100)
    );

    INSERT INTO #OverdueBorrowers (BorrowerID, FirstName, LastName,BookID)
    SELECT B.BorrowerID,B.FirstName,B.LastName,L.BookID
    FROM Borrowers B JOIN Loans L ON B.BorrowerID = L.BorrowerID
    WHERE L.DateReturned IS NULL or L.DueDate < L.DateReturned;

    select * from #OverdueBorrowers;

    SELECT OB.BorrowerID, OB.FirstName, OB.LastName,L.BookID, L.DateBorrowed,L.DueDate,
           IIF(L.DateReturned is null, DATEDIFF(DAY, L.DueDate, GETDATE()), DATEDIFF(DAY, L.DueDate, L.DateReturned)) as OverdueDays
    FROM #OverdueBorrowers OB JOIN  Loans L ON OB.BorrowerID = L.BorrowerID AND OB.BookID = L.BookID
    WHERE L.DateReturned IS NULL or L.DueDate < L.DateReturned
    order by OB.BorrowerID;

    DROP TABLE #OverdueBorrowers;
END;

EXEC sp_GetOverdueBorrowers;
