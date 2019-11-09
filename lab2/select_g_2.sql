--group Medicine by the hospitals they are found at(only Medicine that exists in at least 1 hospital), then show
--the quantity of the lowest medicine

Select Min(t.Quantity) As 'Minimum Quantity', t.Hos
From
(
Select M.name As MedName, HM.quantity As Quantity, HM.hospital As Hos
From Medicine M Inner Join HasMedicine HM On M.mid = HM.medicine Inner Join Hospitals H On H.hid = HM.hospital
) t
Group By t.Hos