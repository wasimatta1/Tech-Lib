
CREATE INDEX IDX_Loans_BookID ON Loans (BookID);

CREATE INDEX IDX_Loans_BorrowerID ON Loans (BorrowerID);

CREATE INDEX IDX_Loans_Email ON Borrowers (Email);

CREATE INDEX IDX_Loans_DateBorrowed ON Loans (DateBorrowed);

CREATE INDEX IDX_Books_CurrentStatus ON Books (CurrentStatus);

CREATE INDEX IDX_Loans_DueDate ON Loans (DueDate);

