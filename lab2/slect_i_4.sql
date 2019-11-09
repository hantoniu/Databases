Select *, N.salary + 1000 As 'New Salary'
From Nurses N
Where N.salary = 
(
	Select Min(N1.salary)
	From Nurses N1
)