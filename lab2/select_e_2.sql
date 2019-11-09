--let us see all the pacients hospitalized at hospitals with ID 1, 2, 3

Select  P.pid, P.fname, P.lname, P.cnp
From Pacients P
Where P.pid In
(
	Select HA.pacient
	From HospitalizedAt HA
	Where HA.hospital = 1 Or HA.hospital = 2 Or HA.hospital = 3
)