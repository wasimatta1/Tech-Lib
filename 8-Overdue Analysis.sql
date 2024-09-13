--Overdue Analysis: List all books overdue by more than 30 days with their associated borrowers.

SELECT L.LoanID,B.FirstName,B.LastName,L.DueDate,L.DateReturned,
    DATEDIFF(DAY, L.DueDate, ISNULL(L.DateReturned, GETDATE())) AS OverdueDays
FROM Loans AS L JOIN Borrowers AS B ON L.BorrowerID = B.BorrowerID
WHERE  DATEDIFF(DAY, L.DueDate, ISNULL(L.DateReturned, GETDATE())) > 30;
