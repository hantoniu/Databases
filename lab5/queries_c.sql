Create Or Alter View view_join As
Select Tc.aid, Tc.bid, Tc.cid, Tb.b2
From Tb Inner Join Tc On Tc.bid = Tb.bid;
Go

Select * From view_join;
--clustered index seek(tb) and clustered index scan(tc), followed by an inner join
--estimated operator costs: 0.018; 0.003; 0 => 0.021

Create Nonclustered Index idx_tc_bid On Tc(bid) Include (cid, aid);

Select * From view_join;
--estimated operator costs: 0.003; 0.003 0.006 => 0.012