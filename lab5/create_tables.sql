Drop Table Tc;
Drop Table Ta;
Drop Table Tb;

Create Table Ta
(
	aid int primary key identity(1, 1),
	a2 int unique,
	name char(255)
);

Create Table Tb
(
	bid int primary key identity(1, 1),
	b2 int
)

Create Table Tc
(
	cid int primary key identity(1, 1),
	aid int References Ta(aid),
	bid int References Tb(bid)
);