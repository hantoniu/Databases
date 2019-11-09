--select doctors that supervise no nurse

Select D.did, D.lname, D.fname, D.department
From Doctors D
Where D.did In
(
	Select D.did From Doctors D
	Except
	Select N.doctorSupervisor From Nurses N
)