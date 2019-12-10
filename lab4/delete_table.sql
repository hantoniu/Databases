Create Or Alter Procedure DeleteTable @TableName nvarchar(100), @Rows Int, @Pos Int
As
Declare @index Int;
Declare @query Nvarchar(100);
Set @index = @Pos;

While @index - @Pos <= @Rows
Begin
	If @TableName = 'SimplePK'
	Begin
		Set @query = N'Delete From SimplePK Where id = ' + Cast(@index As nvarchar);
		--print @query;
	End
	If @TableName = 'MultiPK'
	Begin
		Set @query = N'Delete From MultiPK Where id1 = ' + Cast(@index As nvarchar) + N' AND id2 = ' + 
			Cast(@index As nvarchar);
		--print @query;
	End
	If @TableName = 'FK'
	Begin
		Set @query = N'Delete From FK Where id = ' + Cast(@index As nvarchar);
		--print @query;
	End
	Exec (@query);
	Set @index = @index + 1;
End
Go

--Exec DeleteTable @TableName = N'SimplePK' , @Rows = 10, @Pos = 20;
--Exec DeleteTable @TableName = N'MultiPK' , @Rows = 10, @Pos = 5;
--Exec DeleteTable @TableName = N'FK' , @Rows = 10, @Pos = 5;