--show all nurses with salary above any doctors

Select *
From Nurses N
Where N.salary > Any
(
	Select Distinct D.salary
	From Doctors D
	Where D.salary Is Not Null
)