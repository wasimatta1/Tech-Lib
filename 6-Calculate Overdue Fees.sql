--Database Function - Calculate Overdue Fees:
--      Function Name: fn_CalculateOverdueFees
--      Purpose: Compute overdue fees for a given loan.owner.
--      Parameter: LoanID MembershipDate.
--      Implementation: Charge fees based on overdue days: $1/day for up to 30 days, $2/day after.d to Borrowers. If existing, return an error message.
--      Return: Overdue fee for the LoanID

Drop function if exists fn_CalculateOverdueFees;
GO
create function fn_CalculateOverdueFees(@LoanId INT)
    RETURNS INT
    As BEGIN
    DECLARE @Due_Date Date;
    DECLARE @Returned_Date Date;
    DECLARE @Overdue_Day INT;
    DECLARE @Overdue_Fee INT;

   if not exists(select * from Loans where LoanID = @LoanId)
    begin
         return 0;
    end

   SELECT @Due_Date = DueDate, @Returned_Date = DateReturned
   FROM Loans
   WHERE LoanID = @LoanID;

    If @Returned_Date is NULL
    BEGIN
        SET @Returned_Date = GETDATE();
    END
    set @Overdue_Day = DATEDIFF(DAY, @Due_Date, @Returned_Date);

    if (@Overdue_Day < 0)
    Begin
        set @Overdue_Fee = 0;
    end
    else If(@Overdue_Day <= 30)
    Begin
        set  @Overdue_Fee = @Overdue_Day;
    end
    else if (@Overdue_Day > 30)
    Begin
        set @Overdue_Fee = 30 + (@Overdue_Day - 30) * 2;
    end
    RETURN @Overdue_Fee;
end;

--Test the function
select dbo.fn_CalculateOverdueFees(1003) as OverdueFee;

select  * from Loans where DATEDIFF(DAY, DueDate, DateReturned) >= 0;


