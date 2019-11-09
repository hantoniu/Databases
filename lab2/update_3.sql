update Hospitals
Set budget = budget + 50000
Where budget <
(Select Avg(Budget)
From Hospitals);