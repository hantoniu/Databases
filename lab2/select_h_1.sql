--show the no. of doctors in each specialization

(Select COUNT(*) As Number, D.department As Department
From Doctors D
Group By D.department)