create table Pacients
(
	fname varchar(50) not null,
	lname varchar(50) not null,
	pid smallint identity(1, 1) primary key,
	phone char(10) default null,
	cnp char(13) default null,
	dob date default null,
)