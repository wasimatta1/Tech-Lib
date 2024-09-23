-- Popular Genre Analysis using Joins and Window Functions: Identify the most popular genre for a given month

create  function PopularGenre(@Month int)
RETURNS  TABLE AS
RETURN
with GebreFrequnecy as
         (select B.Genre AS Genre , Count(*) AS BorrowCount, RANK() over (order by COUNT(*)) as Rank
          from Loans AS L
                   JOIN dbo.Books B on B.BookID = L.BookID
          where MONTH(L.DateBorrowed) = @Month
          group by B.Genre) select Genre ,BorrowCount from GebreFrequnecy where Rank = 1;

--Test the Function
select * from PopularGenre(2);