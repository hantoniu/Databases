Create Table Hospitals
(
	name varchar(70),
	hid tinyint primary key identity(1, 1),
	adress varchar(100) default null,
	description varchar(500) default null,
	budget int,
	administrator smallint references Doctors(did),
)