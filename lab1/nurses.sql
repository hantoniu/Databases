Create Table Nurses
(
	fname VARCHAR(50) not null,
	lname VARCHAR(50) not null,
	nid smallint primary key identity(1, 1) NOT NULL,
	cnp char(13),
	salary int,
	doctorSupervisor smallint,
	foreign key(doctorSupervisor) references Doctors(did),
)