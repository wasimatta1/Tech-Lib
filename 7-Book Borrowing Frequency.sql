--Database Function - Book Borrowing Frequency:s:
--      Function Name: fn_BookBorrowingFrequency
--      Purpose: Gauge the borrowing frequency of a book. given loan.owner.
--      Parameter: BookID
--      Implementation: Count the number of times the book has been issued.n overdue days: $1/day for up to 30 days, $2/day after.d to Borrowers. If existing, return an error message.
--      Return: Borrowing count of the book.

Drop function if exists fn_BookBorrowingFrequency;
GO
create function fn_BookBorrowingFrequency(@BookID INT)
    RETURNS INT
As BEGIN
   Return  (select  count(*) from Loans where BookID = @BookID);
end;

--Test the function
select dbo.fn_BookBorrowingFrequency(231) as BorrowingCount;

select BookID, COUNT(*) from Loans GROUP BY BookID ;


