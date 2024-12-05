--Stored Procedure - Add New Borrowers:
--      Procedure Name: sp_AddNewBorrower
--      Purpose: Streamline the process of adding a new borrower.
--      Parameters: FirstName, LastName, Email, DateOfBirth, MembershipDate.
--      Implementation: Check if an email exists; if not, add to Borrowers. If existing, return an error message.
--      Return: The new BorrowerID or an error message.

Drop Procedure if exists sp_AddNewBorrower
GO
create procedure sp_AddnewBorrower(
    @FirstName varchar(20),
    @LastName varchar(20),
    @Email varchar(255),
    @DateOfBirth date,
    @MembershipDate date
)As BEGIN
    if exists(select * from Borrowers where Email = @Email)
    Begin
        select 'Email already exists. Please try again with a different email.' as ErrorMessage;
        Return ;
    End
    else
    Begin
        insert into Borrowers(FirstName, LastName, Email, DateOfBirth, MembershipDate)
        values(@FirstName, @LastName, @Email, @DateOfBirth, @MembershipDate);
        select BorrowerID from Borrowers where Email = @Email;
        Return ;
    End
end;

--Test the stored procedure:
Exec sp_AddNewBorrower 'wasim', 'atta', 'wasim33@gmail.com', '1990-01-01', '2021-01-01';
