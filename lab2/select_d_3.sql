--Right Join: Medicine is joined with the hospitals they are found on

Select *
From Medicine M Right Outer Join HasMedicine HM On HM.medicine = M.mid
	Left Outer Join Hospitals H On HM.hospital = H.hid

--the rows where Medicine.name is NULL signals hospitals that have no medicine on their stock