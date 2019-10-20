Create Table Doctors
(
	fname varchar(50) not null,
	lname varchar(50) not null,
	did smallint identity(1, 1) primary key,
	phone char(10) default null,
	cnp char(13) default null,
	salary int,
	dob date default null,
)