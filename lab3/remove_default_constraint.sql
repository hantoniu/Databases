Create Or Alter Procedure usp_RemoveDefaultConstraint @TableParam varchar(100), @ColumnParam varchar(100), @OldDefaultValue
varchar(100) As
Begin

declare @versionNumber int;
declare @flag bit;

Select @flag = ChangingVersions From CurrentVersion;

Select @versionNumber = Count(*) From Versions;
Set @versionNumber = @versionNumber + 1;

IF @flag = 0
Update CurrentVersion
Set Number = @versionNumber;

declare @query nvarchar(1000);
set @query = N'ALTER TABLE ' + @TableParam + N' DROP CONSTRAINT df_' + @ColumnParam;

declare @undoQuery nvarchar(1000);
set @undoQuery = N'usp_AddDefaultConstraint @TableParam = ''' + @TableParam + N''', @ColumnParam = ''' + 
	@ColumnParam + N''', @DefaultValueParam = ''' + @OldDefaultValue + N'''';

IF @flag = 0
Insert Into Versions(Number, Do, Undo)
Values(@versionNumber, @query, @undoQuery);

exec sp_executesql @query;

End
Go

Exec usp_RemoveDefaultConstraint @TableParam = 'Doctors', @ColumnParam = 'salary', @OldDefaultValue = '777';