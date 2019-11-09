Select T.medicine
From HasMedicine T
Where T.hospital = 5

Intersect

Select T.medicine
From HasMedicine T
Where T.hospital = 9

--select the medicine which are found both on hospital 5 and 9