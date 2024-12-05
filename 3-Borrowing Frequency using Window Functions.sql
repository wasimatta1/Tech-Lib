--Borrowing Frequency using Window Functions: Rank borrowers based on borrowing frequency.

select BorrowerID,ROW_NUMBER() OVER (ORDER BY count(*) DESC) AS BorrowerRank
from Loans
GROUP BY BorrowerID


