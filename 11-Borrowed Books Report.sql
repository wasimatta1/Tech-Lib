--Stored Procedure - Borrowed Books Report:
--      Procedure Name: sp_BorrowedBooksReport
--      Purpose: Generate a report of books borrowed within a specified date range.borrower.
--      Parameters: StartDate, EndDaterth, MembershipDate.
--      Implementation: Retrieve all books borrowed within the given range, with details like borrower name and borrowing date., add to Borrowers. If existing, return an error message.
--      Return: Tabulated report of borrowed books

Drop Procedure if exists sp_BorrowedBooksReport
GO
create procedure sp_BorrowedBooksReport(
    @StartDate date,
    @EndDate date
)As BEGIN
  select B.BookID, B.Title, Br.FirstName, Br.LastName, L.DateBorrowed
    from dbo.Books B
        join dbo.Loans L on B.BookID = L.BookID
        join dbo.Borrowers Br on Br.BorrowerID = L.BorrowerID
    where L.DateBorrowed between @StartDate and @EndDate
end;



--Test the stored procedure
exec sp_BorrowedBooksReport '2023-11-01','2023-12-01    ';