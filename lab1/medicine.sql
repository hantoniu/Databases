Create Table Medicine
(
	mid int primary key identity(1, 1),
	name varchar(50) NOT NULL,
	description varchar(500),
	cost int,
)