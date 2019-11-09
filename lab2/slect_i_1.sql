--show the doctor with the highest salarty

Select *
From Doctors D
Where D.salary >= ALL
(
	Select Distinct D1.salary
	From Doctors D1
	Where D1.salary Is Not Null
)