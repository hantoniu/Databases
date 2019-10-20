Create Table HospitalizedAt
(
	hospital tinyint,
	pacient smallint,
	firstDay date,
	cost int,
	foreign key(hospital) references Hospitals(hid),
	foreign key(pacient) references Pacients(pid),
	constraint HospitalizedAt_PK Primary Key(hospital, pacient, firstDay)
)