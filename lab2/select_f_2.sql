--display all Medicine that is found in NO hospital

Select M.mid, M.name, M.description, M.cost * 10 As 'Cost Needed To Buy 10 Units'
From Medicine M
Where Not Exists
(
	Select *
	From HasMedicine HM
	Where HM.medicine = M.mid
)
Order By M.cost Desc