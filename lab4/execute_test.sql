Create Or Alter Procedure executeTest @TestNr Int As
Declare @TestName nvarchar(50);
Select @TestName = T.Name
From Tests T
Where T.TestID = @TestNr;
--print @TestName;

Insert Into TestRuns(Description, StartAt)
Values(@TestName, SYSDATETIME());

Declare @TestRunId Int;
Set @TestRunId = @@IDENTITY;
--print @TestRunId;

Declare @Rows Int, @Pos Int, @TableNr Int, @ViewNr Int;
Declare @StartTime datetime2(7), @EndTime datetime2(7);
Declare TablesCursor Cursor For
Select NoOfRows, Position, TableID
From TestTables
Where TestId = @TestNr;

Open TablesCursor;
Fetch TablesCursor Into @Rows, @Pos, @TableNr;
WHILE @@FETCH_STATUS = 0
Begin
	--print @Rows;
	--print @Pos;
	Declare @TableName varchar(100);
	Select @TableName = Name From Tables Where TableID = @TableNr;
	--print @TableName;
	Set @StartTime = SYSDATETIME();
	Exec InsertTable @TableName = @TableName , @Rows = @Rows, @Pos = @Pos;
	Exec DeleteTable @TableName = @TableName , @Rows = @Rows, @Pos = @Pos;
	Set @EndTime = SYSDATETIME();
	Insert Into TestRunTables(TestRunID, TableID, StartAt, EndAt)
	Values(@TestRunId, @TableNr, @StartTime, @EndTime);
	Fetch TablesCursor Into @Rows, @Pos, @TableNr;
End
Close TablesCursor;
Deallocate TablesCursor;

Declare ViewsCursor Cursor For
Select ViewID
From TestViews
Where TestId = @TestNr;

Open ViewsCursor;
Fetch ViewsCursor Into @ViewNr;
WHILE @@FETCH_STATUS = 0
Begin
	Declare @ViewName varchar(100);
	Select @ViewName = Name From Views Where ViewID = @ViewNr;
	--print @ViewName;
	Declare @query nvarchar(1000);
	Set @query = N'Select * From ' + @ViewName;
	Set @StartTime = SYSDATETIME();
	Exec(@query);
	Set @EndTime = SYSDATETIME();
	Insert Into TestRunViews(TestRunID, ViewID, StartAt, EndAt)
	Values(@TestRunId, @ViewNr, @StartTime, @EndTime);
	Fetch ViewsCursor Into @ViewNr;
End
Close ViewsCursor;
Deallocate ViewsCursor;

Set @EndTime = SYSDATETIME();
Update TestRuns
Set EndAt = @EndTime
Where TestRunID = @TestRunId;

GO

Exec executeTest @TestNr = 5;