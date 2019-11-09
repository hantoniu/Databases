Insert Into Departments(name, description, budget, importanceFactor)
Values('Management', 'generic description.', 4, 4);

Insert Into Departments(name, description, budget, importanceFactor)
Values('Intensive Care Unit', 'generic description.', 20, 10);

Insert Into Departments(name, description, budget, importanceFactor)
Values('Physiotherapy', 'generic description.', 8, 6);

--error: error because of importanceFactor check
Insert Into Departments(name, description, budget, importanceFactor)
Values('Anesthetics', 'generic description.', 20, 20);
