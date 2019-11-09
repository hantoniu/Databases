--show hospitals that have at least 2 pacients

Select H.hid, H.name
From Hospitals H
Where Exists
(
	Select *
	From HospitalizedAt HA
	Where HA.hospital = H.hid
)