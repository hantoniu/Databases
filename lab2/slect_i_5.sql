--hospital 1 is known to be the best equiped one in the country
--dispaly all hospitals which have greater quantities of a particular medicine than the lowest quantity of medicine
--	found at hospital 1

Select Distinct HM.hospital
From HasMedicine HM
Where HM.hospital<> 1 And HM.quantity > ANY
(
	Select HM1.quantity
	From HasMedicine HM1
	Where HM1.quantity Is Not NULL And HM1.hospital = 1
)