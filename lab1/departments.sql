Create Table Departments
(
	name varchar(50) not null,
	description varchar(500) default null,
	did tinyint primary key identity(1, 1),
	budget int,
	importanceFactor tinyint default 0 check(importanceFactor >= 0 AND importanceFactor <= 10),
)