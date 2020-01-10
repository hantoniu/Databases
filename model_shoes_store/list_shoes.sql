CREATE OR ALTER FUNCTION ufListShoes(@value int)
RETURNS @ListWithShoes TABLE (shoeid int)
As
Begin
	Insert Into @ListWithShoes
	Select S.shoeid
	From Inventory I Inner Join PresentationShops P On I.psid = P.psid Inner Join Shoes S On S.shoeid = I.shoeid
	Group By S.shoeid
	Having Count(*) >= @value;
	
	Return;
End
Go

Select * From ufListShoes(1);