Select *
From Doctors D Full Join Nurses N On D.did = N.doctorSupervisor
	Full Outer Join Hospitals H On H.hid In
	(Select WA.hospital From WorksAt WA Where WA.doctor = D.did)

--Full Join: Doctors to their supervised Nurses, and Doctors to the Hospitals they work at
--only doctors with a supervised Nurse and a current job will be shown

--if did is NULL, we will see a corresponding hospital who has now doctor assigned at the moment