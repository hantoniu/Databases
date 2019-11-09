--display the salary each hospital has to pay to its doctors, considering hospitals with more than 2 doctors

Select t.HosId, AVG(t.Salary) As Salary
From
	(Select H.hid As HosId, D.salary As Salary From Hospitals H Inner Join WorksAt WA On H.hid = WA.hospital 
	Inner Join Doctors D On D.did = WA.doctor) t
Group By t.HosId
Having 1 <
(
	Select Count(*)
	From WorksAt WA1
	Where WA1.hospital = t.HosId
)

Select *
From Hospitals

Select*
From WorksAt