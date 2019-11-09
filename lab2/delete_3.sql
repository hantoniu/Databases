Delete
From Doctors
Where salary > Any
(Select Distinct D2.salary
From Doctors D2
Where D2.fname Like '%Toni%' Or D2.lname Like '%Toni%');