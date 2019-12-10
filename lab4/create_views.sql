Create Or Alter View View1 As
Select *
From SimplePK T
Where T.id > 12
Go

Create Or Alter View View2 As
Select F.id, F.name, F.foreignId, S.name As 'Other Name'
From FK F Inner Join SimplePK S On F.foreignId = S.id
Where F.id % 4 = 0
Go

Create Or Alter View View3 As
Select Sum(F.id) As 'Sum of FK IDs' , Sum(S.id) As 'Sum of PK IDs', F.name As 'Foreign Key Name'
From FK F Inner Join SimplePK S On F.foreignId = S.id
Group By (F.name)
Go