Select Top 50 Percent D.name, D.description, D.did
From Departments D
Where 2 <=
(Select Count(*)
From Doctors Dr1
Where Dr1.department = D.did)
Or D.importanceFactor = 10

Union

Select Top 50 Percent S.name, S.description, S.sid
From Specializations S
Where 2 <=
(Select Count(*)
From Doctors Dr2
Where Dr2.specialization = S.sid)

--make a list of the important specializations and departments; that is departments with at least 2 members or importance factor 10
--and specializations with at least 2 memebers

--obs. there is surgery both as department and specialization