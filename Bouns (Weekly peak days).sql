-- Bouns
-- Weekly peak days: The library is planning to employ a new part-time worker. This worker will work 3 days weekly in the library.
-- From the data you have, determine the most 3 days in the week that have the most share of the loans and display the result of
-- each day as a percentage of all loans. Sort the results from the highest percentage to the lowest percentage.
-- (eg. 25.18% of the loans happen on Monday...)

with DayBorrowed as (
    select DATENAME(WEEKDAY, DateBorrowed) as Day, count(*) as LoansCount
    from Loans
    group by DATENAME(WEEKDAY, DateBorrowed)
),TotalLoans as (
    select COUNT(*) as TotalLoans from Loans
)select Top (3) Day,  ROUND(D.LoansCount * 100.0 / T.TotalLoans, 2) as Percentage
     from DayBorrowed D  , TotalLoans T
     order by Percentage desc;

	 