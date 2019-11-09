Select Top 4 D.fname, D.lname, D.salary, D.did
From Doctors D
Where D.salary > (Select Avg(salary) From Doctors)
Union All
Select Top 4 N.fname, N.lname, N.salary, N.nid
From Nurses N
Where N.salary > (Select Avg(salary) From Nurses)
Order By salary Desc

--Displays both the doctors and the nurses with over the avarage salary in their category, in descending order by salary.
--Select only the top 4 doctors and nurses.