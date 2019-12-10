Create Table SimplePK
(
	id int not null,
	name char(50) not null,
	Primary Key(id)
);

Create Table MultiPK
(
	id1 int not null,
	id2 int not null,
	name char(50) not null,
	Primary Key(id1, id2)
);

Create Table FK
(
	id int not null,
	foreignId int References SimplePK(id),
	name char(50) not null,
	Primary Key(id)
);