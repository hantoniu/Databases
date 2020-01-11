Drop Table CanBeCharged;
Drop Table Cars;
Drop Table Stations;
Drop Table LivesIn;
Drop Table Cities;
Drop Table Citizens;

Create Table Citizens
(
	cid int primary key,
	name varchar(100),
	age tinyint
);

Create Table Cities
(
	ctid int primary key,
	name varchar(100),
	mayor int references Citizens(cid) On Delete Set Null
);

Create Table LivesIn
(
	ctid int references Cities(ctid),
	cid int references Citizens(cid) On Delete Cascade,
	Constraint PK_LivesIn Primary Key (ctid, cid)
);

Create Table Cars
(
	crid int primary key,
	fuel decimal(5, 2),
	seats tinyint,
	cid int references Citizens(cid) On Delete Set Null
);

Create Table Stations
(
	stid int primary key,
	ctid int references Cities(ctid)
);

Create Table CanBeCharged
(
	stid int references Stations(stid),
	crid int references Cars(crid),
	Constraint PK_CanBeCharged Primary Key (stid, crid)
);

Insert Into Citizens(cid, name, age) Values(1, 'Toni', 21);
Insert Into Citizens(cid, name, age) Values(2, 'Anca', 20);
Insert Into Citizens(cid, name, age) Values(3, 'Adrian', 46);
Insert Into Citizens(cid, name, age) Values(4, 'Sorina', 44);

Insert Into Cities(ctid, name, mayor) Values(1, 'Cluj', 1);
Insert Into Cities(ctid, name, mayor) Values(2, 'Oradea', 3);
Insert Into Cities(ctid, name, mayor) Values(3, 'Severin', 2);
Insert Into Cities(ctid, name, mayor) Values(4, 'Caransebes', 4);

Insert Into LivesIn(ctid, cid) Values(1, 1);
Insert Into LivesIn(ctid, cid) Values(1, 2);
Insert Into LivesIn(ctid, cid) Values(2, 3);
Insert Into LivesIn(ctid, cid) Values(3, 3);


Insert Into Cars(crid, fuel, seats, cid) Values(1, 10, 4, 1);
Insert Into Cars(crid, fuel, seats, cid) Values(2, 10, 4, 1);
Insert Into Cars(crid, fuel, seats, cid) Values(3, 10, 4, 1);
Insert Into Cars(crid, fuel, seats, cid) Values(4, 10, 4, 2);
Insert Into Cars(crid, fuel, seats, cid) Values(5, 10, 4, 2);
Insert Into Cars(crid, fuel, seats, cid) Values(6, 10, 4, 3);
Insert Into Cars(crid, fuel, seats, cid) Values(7, 10, 4, 3);
Insert Into Cars(crid, fuel, seats, cid) Values(8, 10, 4, 3);

Insert Into Stations(stid, ctid) Values(1, 1);
Insert Into Stations(stid, ctid) Values(2, 1);
Insert Into Stations(stid, ctid) Values(3, 1);
Insert Into Stations(stid, ctid) Values(4, 1);
Insert Into Stations(stid, ctid) Values(5, 1);

Insert Into CanBeCharged(stid, crid) Values(1, 1);
Insert Into CanBeCharged(stid, crid) Values(1, 2);
Insert Into CanBeCharged(stid, crid) Values(1, 3);
Insert Into CanBeCharged(stid, crid) Values(2, 1);
Insert Into CanBeCharged(stid, crid) Values(2, 2);
--Insert Into CanBeCharged(stid, crid) Values(3, 1);

