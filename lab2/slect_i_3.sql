--find the nurse to the lowest salary and give her a raise of 1000

Select *, N.salary + 1000 As 'New Salary'
From Nurses N
Where N.salary <= ALL
(
	Select N1.salary
	From Nurses N1
	Where N1.salary Is Not Null
)
