Create Or Alter Procedure InsertTable @TableName nvarchar(100), @Rows Int, @Pos Int
As
Declare @index Int;
Declare @query Nvarchar(100);
Set @index = @Pos;
Declare @foreignKey Int;

While @index - @Pos <= @Rows
Begin
	If @TableName = 'SimplePK'
	Begin
		SET QUOTED_IDENTIFIER OFF;
		Set @query = N'Insert Into SimplePK(id, name) Values(' + Cast(@index As nvarchar) + N',' + 
			N" 'I m gonna show u where its dark but have no fear') ";
		SET QUOTED_IDENTIFIER ON;
		--print @query;
	End
	If @TableName = 'MultiPK'
	Begin
		Set @query = N'Insert Into MultiPK(id1, id2, name) Values(' + Cast(@index As nvarchar) + N',' +
		Cast(@index As nvarchar) + N',' +
		N'''I m gonna show u where its dark but have no fear'')';
		--print @query;
	End
	If @TableName = 'FK'
	Begin
		Set @query = N'Insert Into FK(id, foreignId, name) Values(' + Cast(@index As nvarchar) + N',1,' +
			N'''I m gonna show u where its dark but have no fear'')';
	End
	Exec (@query);
	Set @index = @index + 1;
End
Go

Exec InsertTable @TableName = N'SimplePK' , @Rows = 10, @Pos = 20;
--Exec InsertTable @TableName = N'MultiPK' , @Rows = 10, @Pos = 5;
Exec InsertTable @TableName = N'FK' , @Rows = 10, @Pos = 5;