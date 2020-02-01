Select b2
From Tb
Where b2 = 20;
--clustered index scan

Create Nonclustered Index idx_tb_b2 On Tb(b2) Include (bid);

Select b2
From Tb
Where b2 = 20;
--this time, the same query uses
--nonclustered index seek