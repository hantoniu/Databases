--group doctors by specialization, but only if the specialization contains at least 2 doctors
--so it will display the speicalization which have at least 2 doctors

Select D.specialization, Count(*) As Number
From Doctors D
Group By D.specialization
Having Count(*) > 1