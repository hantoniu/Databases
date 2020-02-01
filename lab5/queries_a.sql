--Create Unique Clustered Index idx_ta_aid On Ta(aid);
--a clustered index on the primary key was already create by default

Declare @it int;

Set @it = 0;
While @it < 300
Begin
	Insert Into Ta(a2) Values(@it);
	Insert Into Tb(b2) Values(@it);
	Set @it = @it + 1;
End

Set @it = 0;
While @it < 100
Begin
	Insert Into Tc(aid, bid) Values(1, 1);
	Set @it = @it + 1;
End

Select *
From Ta
Where aid > 10 and aid < 30;
--clustered index seek

Select a2
From Ta
Where a2 % 2 = 0;
--non clustered index scan

Select a2
From Ta
Where a2 > 10 and a2 < 50;
--non clustered index seek

Select *
From Ta
--clustered index scan
--the nonclustered index must be disabled