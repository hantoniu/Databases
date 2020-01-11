Create Or Alter View udv_ShowCars As

Select	Cars.crid
From Cars
Where Cars.crid In
	(
		Select CBC.crid
		From CanBeCharged CBC
		Group By CBC.crid
		Having Count(*) = (Select Max(t.myCount) From (Select Count(*) As 'myCount' From CanBeCharged Aux Group By Aux.crid)t )
	);

Go

Select * From udv_ShowCars;