Select *
From Doctors D Inner Join WorksAt WA On WA.hospital = D.did Inner Join Hospitals H On H.hid = WA.hospital
	Inner Join HospitalizedAt HA On HA.hospital = H.hid Inner Join Pacients P On HA.pacient = P.pid