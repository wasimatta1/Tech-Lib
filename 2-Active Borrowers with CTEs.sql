-- Active Borrowers with CTEs: Identify borrowers who've borrowed 2 or more books but haven't returned any using CTEs

WITH BorrowerLoans AS (
    SELECT BorrowerID,
           COUNT(*) AS TotalBorrowed,
           SUM(CASE WHEN DateReturned IS NULL THEN 1 ELSE 0 END) AS UnreturnedCount
    FROM Loans
    GROUP BY BorrowerID
)
SELECT BorrowerID
FROM BorrowerLoans
WHERE TotalBorrowed >= 2 AND TotalBorrowed = UnreturnedCount;



