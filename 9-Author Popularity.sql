--Author Popularity using Aggregation: Rank authors by the borrowing frequency of their books.

select B.Author,RANK() over (order by COUNT(L.BookID) desc) as Rank, COUNT(L.BookID) as Borrowed
from Loans AS L join dbo.Books B on B.BookID = L.BookID
group by B.Author
