Select T.medicine
From HasMedicine T
Where T.hospital = 5 And T.hospital Not In
(
	Select T.medicine
	From HasMedicine T
	Where T.hospital = 9

)