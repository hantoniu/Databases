Select D.did, D.lname, D.fname, D.salary
From Doctors D
Where D.did In (Select T1.doctor From WorksAt T1 Where T1.hospital = 1)
	And D.did In (Select T1.doctor From WorksAt T1 Where T1.hospital = 10)

--(Select T1.doctor
-- WorksAt T1	
--Where T1.hospital = 1

--Intersect

--Select T2.doctor
--From WorksAt T2
--Where T2.hospital = 10)

--select information about the doctors who work both in hospital 1 and 10