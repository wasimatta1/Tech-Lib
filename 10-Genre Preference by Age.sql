--Genre Preference by Age using Group By and Having: 
-- Determine the preferred genre of different age groups of borrowers. (Groups are (0,10), (11,20), (21,30)…)

with AgeGroups as(
    select Br.BorrowerID,
        case
            when DATEDIFF(YEAR, Br.DateOfBirth, GETDATE()) between 0 and 10 then '0-10'
            when DATEDIFF(YEAR, Br.DateOfBirth, GETDATE()) between 11 and 20 then '11-20'
            when DATEDIFF(YEAR, Br.DateOfBirth, GETDATE()) between 21 and 30 then '21-30'
            when DATEDIFF(YEAR, Br.DateOfBirth, GETDATE()) between 31 and 40 then '31-40'
            when DATEDIFF(YEAR, Br.DateOfBirth, GETDATE()) between 41 and 50 then '41-50'
            when DATEDIFF(YEAR, Br.DateOfBirth, GETDATE()) between 51 and 60 then '51-60'
            when DATEDIFF(YEAR, Br.DateOfBirth, GETDATE()) between 61 and 70 then '61-70'
            else '71+'
            end as AgeGroup,  B.Genre as Genre
    from Borrowers as Br
        join dbo.Loans L on Br.BorrowerID = L.BorrowerID
        join dbo.Books B on B.BookID = L.BookID
),GenreCount as (select AgeGroup,Genre,RANK() over (partition by AgeGroup order by count(*) desc) as Rank
from AgeGroups
group by AgeGroup, Genre)
select AgeGroup, Genre from GenreCount where Rank = 1





