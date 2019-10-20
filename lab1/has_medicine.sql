Create Table HasMedicine
(
	hospital tinyint references Hospitals(hid),
	medicine int references Medicine(mid),
	expiryData date default null,
	constraint HasMedicine_PK Primary Key(hospital, medicine),
	quantity int not null default 1,
)