Create Or Alter Procedure usp_ModifyColumn @TableParam nvarchar(100), @ColumnParam nvarchar(100), @NewTypeParam nvarchar(100) As
Begin

declare @oldType nvarchar(100);
declare @versionNumber int;
declare @flag bit;

Select @flag = ChangingVersions From CurrentVersion;

Select @versionNumber = Count(*) From Versions;
Set @versionNumber = @versionNumber + 1;

IF @flag = 0
Update CurrentVersion
Set Number = @versionNumber;

SELECT @oldType = DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = @TableParam AND COLUMN_NAME = @ColumnParam
IF @oldType = 'varchar' OR @oldType = 'char' OR @oldType = 'nvarchar' OR @oldType = 'binary'
	set @oldType = @oldType + '(50)';

declare @query nvarchar(1000);
set @query = N'ALTER TABLE ' + @TableParam + N' ALTER COLUMN ' + @ColumnParam + N' ' + + @NewTypeParam;

declare @undoQuery nvarchar(1000);
set @undoQuery = N'usp_ModifyColumn @TableParam = ''' + @TableParam + N''' ,@ColumnParam = ''' + @ColumnParam + 
	N''' ,@NewTypeParam = ''' + @oldType + N'''';

IF @flag = 0
Insert Into Versions(Number, Do, Undo)
Values(@versionNumber, @query, @undoQuery);

SET ANSI_WARNINGS  OFF;

exec sp_executesql @query;

SET ANSI_WARNINGS ON;

End
Go

Exec usp_ModifyColumn @TableParam = 'Doctors', @ColumnParam = 'fname', @NewTypeParam = 'varchar(180)';