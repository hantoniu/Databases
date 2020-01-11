CREATE OR ALTER FUNCTION ufListCities(@value int)
RETURNS @ListWithCities TABLE (ctid int)
As
Begin

Insert Into @ListWithCities
Select Distinct L.ctid
From LivesIn L
Where L.cid In
	(
	Select CT.cid
	From Citizens CT Inner Join Cars CR On Cr.cid = CT.cid
	Group By CT.cid
	Having Count(*) >= @value
	)

Return;

End
Go

Select * From ufListCities(3);