Create Or Alter View ShowWomen As
	Select S.smid, W.wid, W.name, Sum(T.number) As 'Number of Identical Shoes'
	From Transactions T Inner Join Women W On T.wid = W.wid Inner Join Shoes S On S.shoeid = T.shoeid
	Group By S.smid, W.wid, W.name
	Having Sum(T.number) > 1;
Go

Select * From ShowWomen;