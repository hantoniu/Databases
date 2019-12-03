Create Or Alter Procedure usp_RemoveForeignKey @TableParam varchar(100), @ConstraintNameParam varchar(100) As
Begin

declare @query nvarchar(1000);
set @query = N'ALTER TABLE ' + @TableParam + N' DROP FOREIGN KEY ' + @ConstraintNameParam;
print @query;
exec sp_executesql @query;

End
Go

Exec usp_RemoveForeignKey @TableParam = 'Doctors', @ConstraintNameParam = 'PK__Doctors__D877D216D3DBA7C6';