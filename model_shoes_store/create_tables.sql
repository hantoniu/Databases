Drop Table Inventory;
Drop Table Transactions;
Drop Table Shoes;
Drop Table ShoeModels;
Drop Table PresentationShops;
Drop Table Women;

Create Table PresentationShops
(
	psid int primary key,
	name varchar(100),
	city varchar(50)
);

Create Table Women
(
	wid int primary key,
	name varchar(100),
	amount decimal(10, 2)
);

Create Table ShoeModels
(
	smid int primary key,
	name varchar(100),
	season varchar(10)
);

Create Table Shoes
(
	shoeid int primary key,
	price decimal(10, 2),
	smid int references ShoeModels(smid)
);

Create Table Inventory
(
	psid int references PresentationShops(psid),
	shoeid int references Shoes(shoeid),
	number int,
	CONSTRAINT PK_Inventory PRIMARY KEY (psid, shoeid)
);

Create Table Transactions
(
	tid int primary key,
	wid int references Women(wid),
	shoeid int references Shoes(shoeid),
	number int
)

Insert Into ShoeModels(smid, name, season) Values(1, 'Gucci', 'winter');
Insert Into ShoeModels(smid, name, season) Values(2, 'DG', 'summer');
Insert Into Shoes(shoeid, price, smid) Values(1, 100, 1);
Insert Into Shoes(shoeid, price, smid) Values(2, 200, 1);
Insert Into PresentationShops(psid, name, city) Values (1, 'Toni', 'New York');
Insert Into PresentationShops(psid, name, city) Values (2, 'Monica', 'Boston');
Insert Into Women(wid, name, amount) Values (1, 'Mara', 1000);
Insert Into Women(wid, name, amount) Values (2, 'Anca', 1000);
Insert Into Women(wid, name, amount) Values (3, 'Giulia', 1000);
Insert Into Transactions(tid, wid, shoeid, number) Values(1, 1, 1, 1);
Insert Into Transactions(tid, wid, shoeid, number) Values(2, 2, 1, 10);
Insert Into Transactions(tid, wid, shoeid, number) Values(3, 1, 2, 1);
Insert Into Inventory(psid, shoeid, number) Values(1, 1, 50);
Insert Into Inventory(psid, shoeid, number) Values(2, 1, 50);
Insert Into Inventory(psid, shoeid, number) Values(2, 2, 50);