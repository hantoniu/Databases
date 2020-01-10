Create Or Alter Procedure usp_AddShoe @psidp int, @shoeidp int, @numberp int As
Begin

If Exists (Select * From Inventory I Where I.psid = @psidp And I.shoeid = @shoeidp)
Update Inventory
Set Inventory.number = Inventory.number + @numberp
Where Inventory.psid = @psidp And Inventory.shoeid = @shoeidp;
Else
Insert Into Inventory(psid, shoeid, number) Values(@psidp, @shoeidp, @numberp);

End
Go

Exec usp_AddShoe @psidp = 1, @shoeidp = 2, @numberp = 100;