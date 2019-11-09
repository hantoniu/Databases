--dispaly a list of all doctors working both in hospital 1 and 3
Select D.did, D.lname, D.fname
From Doctors D
Where D.did In
(
	Select Distinct WA.doctor
	From WorksAt WA
	Where WA.hospital = 1 Or WA.hospital = 3
)