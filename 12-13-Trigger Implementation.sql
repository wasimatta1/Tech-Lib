--Trigger Implementation
--Design a trigger to log an entry into a separate AuditLog table whenever a book's status changes
-- from 'Available' to 'Borrowed' or vice versa. The AuditLog should capture BookID, StatusChange, and ChangeDate.


CREATE TABLE AuditLog (
                          LogID INT IDENTITY(1,1) PRIMARY KEY,
                          BookID INT,
                          StatusChange NVARCHAR(100),
                          ChangeDate DATETIME DEFAULT GETDATE()
);
Drop  trigger if exists tr_BookStatusChange;
GO
create trigger tr_BookStatusChange ON dbo.Books
after update AS
Begin
    if update(CurrentStatus)
        Begin
            insert into AuditLog(BookID, StatusChange,ChangeDate)
            select BookID, 'Status Changed to ' + CurrentStatus,
            GETDATE()
            from inserted
        end
end;

--Test the trigger
update dbo.Books set CurrentStatus = 'Borrowed' where BookID = 2;
update dbo.Books set CurrentStatus = 'Available' where BookID = 114;

select * from AuditLog;



