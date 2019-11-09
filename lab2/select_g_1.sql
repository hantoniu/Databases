--display the salary each hospital has to pay to its doctors

Select t.HosId, Sum(t.Salary) / 1000 As 'Salary in 1000s'
From
	(Select H.hid As HosId, D.salary As Salary From Hospitals H Inner Join WorksAt WA On H.hid = WA.hospital 
	Inner Join Doctors D On D.did = WA.doctor) t
Group By t.HosId

--copied from h.3