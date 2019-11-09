Select *
From Doctors D
Where D.salary = 
(
	Select Max(D1.salary)
	From Doctors D1
)