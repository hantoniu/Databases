--we want to raise salaries of some doctors; but the budget on hospital with id 1 is too tight
--so display all doctors with over the average salary that do not work at hospital 1

Select D.did, D.lname, D.fname, D.salary / 1000 As 'Salary in 1000s'
From Doctors D
Where D.did In
(
	Select D.did From Doctors D Where D.salary < ( Select Avg(D.salary) From Doctors D ) And D.did Not In
	(
		Select WA.doctor From WorksAt WA Where WA.hospital = 1
	)
)
Order By D.salary Asc

--copied from 2.c