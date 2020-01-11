Create Or Alter Procedure udp_DeleteCitizens @ctidp int As
Begin

Delete From Citizens
Where Citizens.cid In
	(
		Select L.cid
		From LivesIn L
		Where L.ctid = @ctidp
	);

End
Go

Exec udp_DeleteCitizens @ctidp = 2;