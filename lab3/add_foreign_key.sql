Create Or Alter Procedure usp_AddForeignKey @ReferencingTable varchar(100), @ReferencingColumn varchar(100), 
@ReferencedTable varchar(100) , @ReferencedColumn varchar(100) As
Begin

declare @query nvarchar(1000);
set @query = N'ALTER TABLE ' + @ReferencingTable + N' ADD FOREIGN KEY (' + @ReferencingColumn +
	N') REFERENCES ' + @ReferencedTable + N'(' + @ReferencedColumn + N')';
print @query;
exec sp_executesql @query;

End
Go

Exec usp_AddForeignKey @ReferencingTable = 'Nurses', @ReferencingColumn = 'doctorSupervisor', 
	@ReferencedTable = 'Doctors', @ReferencedColumn = 'did';