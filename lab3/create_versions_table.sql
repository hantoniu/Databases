CREATE TABLE Versions( 
	Number INT NOT NULL, 
	Do NVARCHAR(1000),
	Undo NVARCHAR(1000),
	PRIMARY KEY (Number)
);

Create Table CurrentVersion
(
	Number Int Not NULL,
	ChangingVersions Bit,
	PRIMARY KEY (Number)
);

Insert Into CurrentVersion(Number, ChangingVersions)
Values(0, 0);
