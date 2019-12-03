Create Or Alter Procedure usp_ChangeVersion @targetVersion int As
Begin

declare @versionNumber int;
declare @query nvarchar(1000);

Update CurrentVersion
Set ChangingVersions = 1;

Select @versionNumber = Number From CurrentVersion;
While @targetVersion <> @versionNumber
Begin
	If @targetVersion < @versionNumber
	Begin
		Select @query = Undo From Versions Where Number = @versionNumber;
		Set @versionNumber = @versionNumber - 1;
		print @query;
		exec sp_executesql @query;
	End
	Else
	Begin
		Set @versionNumber = @versionNumber + 1
		Select @query = Do From Versions Where Number = @versionNumber;
		print @query;
		exec sp_executesql @query;
	End
End

Update CurrentVersion
Set Number = @targetVersion;
Update CurrentVersion
Set ChangingVersions = 0;

End
Go

Exec usp_ChangeVersion @targetVersion = 5;