alter table Doctors
add specialization tinyint references Specializations(sid);

alter table Doctors
add department tinyint references Departments(did);