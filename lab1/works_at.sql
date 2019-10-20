Create Table WorksAt
(
	doctor smallint,
	hospital tinyint,
	foreign key(doctor) references Doctors(did),
	foreign key(hospital) references Hospitals(hid),
	constraint WorksAt_PK Primary Key(doctor, hospital),
)