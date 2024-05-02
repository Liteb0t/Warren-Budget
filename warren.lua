require("iuplua")
-- require("iupluacontrols")

pboolean = 1
pinteger = 14
preal = 1.1
pinteger2 = 73
preal2 = 0
pangle = 90
spent_this_month = 0
target_this_month = 0
transactions = {{category="Transport", spent=2.95}}
categories = {
	{name="Groceries", spent=15.11, target=73.15}
	,{name="Transport", spent=24.68, target=58.12}
	,{name="Eating out", spent=12.70, target= 31.10}
	,{name="Books", spent=12.99, target=25.00}
	,{name="Kebabs", spent=185.28, target = 7.99}
}

-- function crud_read(next_index)
-- 	local next_index_local, value = next(transactions, next_index)
-- 	if not next_index_local then -- no next index. end of list.
-- 		print(next_index_local)
-- 		return next_index_local
-- 	end
-- 	return next_index_local, value
-- end

function exit_window(self)
    return iup.CLOSE
end

function test(self)
	res, name = iup.GetParam("Title", nil
		, "Give your name: %s\n", "")
	
	if name ~= nil then
		iup.Message("Hello!", name)
		-- transaction_list:appenditem(name)
		print(transaction_list.count)
		transaction_list[1] = "what the skibidi"
		
		for key,value in pairs(getmetatable(transaction_list)) do
			print("member " .. key)
		end

		print(getmetatable(transaction_list).class)
	end
end

function print_something(dialog, param_index)
	-- print("Yo something was printed guys")
	print("brazil")
	-- add_transaction(dialog)
	return 1
end

function add_transaction(self)
	table.insert(transactions,pinteger)
	print(table.unpack(transactions))
	-- table.insert(hbox, name_btn)
end

function getparam_multiple(self)
	res, pboolean, pinteger, preal, pinteger2, preal2, pangle = 
		iup.GetParam("Title-io!", print_something,
					"Boolean: %b\n"..
					"Integer: %i\n"..
					"Real 1: %r\n"..
					"Sep1 %t\n"..
					"Integer 2: %i[0,255]\n"..
					"Real 2: %r[-1.5,1.5]\n"..
					"Sep2 %t\n"..
					"Pangle: %a[0,360]\n",
					pboolean, pinteger, preal, pinteger2, preal2, pangle)
end

function update_button_state()
	if transaction_list.value == "0" then
		del_transaction_btn.active = "NO"
	else
		del_transaction_btn.active = "YES"
	end
end

function create_new_category()
	res, category_name, spent, target =
		iup.GetParam("Create a new spending category", nil,
					"Category name: %s\n"..
					"Spent already: %r\n"..
					"Monthly target: %r\n"
					,"", 0.0, 0.0)
	
	print(res)
	if res then
		table.insert(categories,{name=category_name, spent=spent, target=target})
		categories_grid[(#categories*4+1)].title = category_name
		categories_grid[(#categories*4+1)+1].title = string.format("%.2f", spent)
		categories_grid[(#categories*4+1)+2].title = string.format("%.2f", target)
		-- categories_grid:append(table.unpack(categories[#categories]))
		-- for i = 0, 3 do
		-- 	categories_grid:append(iup.label{title=categories[#categories][i]})
		-- end
		-- categories_grid:append(iup.label{title="TEST"})
		-- iup.Update(categories_grid)
		-- iup.Refresh(categories_grid)
		-- categories_grid:map()
		-- iup.Redraw(categories_grid, 1)
	end
	-- name_btn.title="Blame"
	-- lbl1test = iup.label{title="TEst 1"}
	-- navbar_box:append(lbl1test)
	-- navbar_box:append(iup.label{title="Test 2"})
end

function edit_category(self)
	local pos = math.tointeger(self.row)
	local temp_category = categories[pos]
	res, category_name, spent, target =
		iup.GetParam("Edit spending category", nil,
					"Category name: %s\n"..
					"Spent already: %r\n"..
					"Monthly target: %r\n"
					,temp_category.name, temp_category.spent, temp_category.target)
	
	print(res)
	if res then
		table.remove(categories, pos)
		table.insert(categories, pos, {name=category_name, spent=spent, target=target})
		categories_grid[(pos*4+1)].title = category_name
		categories_grid[(pos*4+1)+1].title = string.format("%.2f", spent)
		categories_grid[(pos*4+1)+2].title = string.format("%.2f", target)
	end
end

function delete_category(self)
	local pos = math.tointeger(self.row)
	table.remove(categories, pos)
	categories_grid:populate()
end

-- function add_category_to_grid(iup_grid, cat_index)
	
function edit_category1(self)
	edit_category(1)
end

function delete_category1(self)
	print(categories[1].title)
	table.remove(categories,1)
	populate_grid(categories_grid)
	-- print(categories[1].title)
end


function delete_category2(self)
	print(categories[2].title)
	table.remove(categories,2)
	populate_grid(categories_grid)
	-- print(categories[2].title)
end

function edit_category2(self)
	edit_category(2)
end

function delete_category3(self)
	print(categories[3].title)
	table.remove(categories,3)
	populate_grid(categories_grid)
	-- print(categories[3].title)
end

function edit_category3(self)
	edit_category(3)
end

function delete_category4(self)
	print(categories[4].title)
	table.remove(categories,4)
	populate_grid(categories_grid)
	-- print(categories[4].title)
end

function edit_category4(self)
	edit_category(4)
end

function delete_category5(self)
	print(categories[5].title)
	table.remove(categories,5)
	populate_grid(categories_grid)
	-- print(categories[5].title)
end

function edit_category5(self)
	edit_category(5)
end

function delete_category6(self)
	print(categories[6].title)
	table.remove(categories,6)
	populate_grid(categories_grid)
	-- print(categories[6].title)
end

function edit_category6(self)
	edit_category(6)
end

function delete_category7(self)
	print(categories[7].title)
	table.remove(categories,7)
	populate_grid(categories_grid)
	-- print(categories[7].title)
end

function edit_category7(self)
	edit_category(7)
end

function delete_category8(self)
	print(categories[8].title)
	table.remove(categories,8)
	populate_grid(categories_grid)
	-- print(categories[8].title)
end

function edit_category8(self)
	edit_category(8)
end

function delete_category9(self)
	print(categories[9].title)
	table.remove(categories,9)
	populate_grid(categories_grid)
	-- print(categories[9].title)
end

function edit_category9(self)
	edit_category(9)
end

function generate_summary()
	spent_this_month = 0
	target_this_month = 0
	for key, cat in pairs(categories) do
		spent_this_month = spent_this_month + cat.spent
		target_this_month = target_this_month + cat.target
	end
	spent_summary_label.title = string.format("%.2f", spent_this_month)
	target_summary_label.title = string.format("%.2f", target_this_month)
	
	categories_grid:populate()
end

name_btn = iup.button{
	title = "Name"
	,action = test
}

multi_btn = iup.button{
	title = "multiple fields"
	,action = getparam_multiple
}
exit_btn = iup.button{
	title = "Exit"
	,action = exit_window
}

spent_summary_label = iup.label{
	title = "Summary not loaded"
}

target_summary_label = iup.label{
	title = "Summary not loaded"
}

categories_grid = iup.gridbox{
	iup.label{title="Category name", fontstyle="BOLD"}
	,iup.label{title="Amount spent", fontstyle="BOLD"}
	,iup.label{title="Target", fontstyle="BOLD"}
	,iup.label{title="Actions                                     ", fontstyle="BOLD"}

	,iup.label{title=""}
	,iup.label{title=""}
	,iup.label{title=""}
	,iup.hbox{iup.button{title="Edit",action=edit_category, row=1, active="NO"},iup.button{title="Delete",action=delete_category, row=1, active="NO"}, alignment="ACENTER"}
	
	,iup.label{title=""}
	,iup.label{title=""}
	,iup.label{title=""}
	,iup.hbox{iup.button{title="Edit",action=edit_category, row=2, active="NO"},iup.button{title="Delete",action=delete_category, row=2, active="NO"}}

	,iup.label{title=""}
	,iup.label{title=""}
	,iup.label{title=""}
	,iup.hbox{iup.button{title="Edit",action=edit_category, row=3, active="NO"},iup.button{title="Delete",action=delete_category, row=3, active="NO"}}

	,iup.label{title=""}
	,iup.label{title=""}
	,iup.label{title=""}
	,iup.hbox{iup.button{title="Edit",action=edit_category, row=4, active="NO"},iup.button{title="Delete",action=delete_category, row=4, active="NO"}}

	,iup.label{title=""}
	,iup.label{title=""}
	,iup.label{title=""}
	,iup.hbox{iup.button{title="Edit",action=edit_category, row=5, active="NO"},iup.button{title="Delete",action=delete_category, row=5, active="NO"}}

	,iup.label{title=""}
	,iup.label{title=""}
	,iup.label{title=""}
	,iup.hbox{iup.button{title="Edit",action=edit_category, row=6, active="NO"},iup.button{title="Delete",action=delete_category, row=6, active="NO"}}

	,iup.label{title=""}
	,iup.label{title=""}
	,iup.label{title=""}
	,iup.hbox{iup.button{title="Edit",action=edit_category, row=7, active="NO"},iup.button{title="Delete",action=delete_category, row=7, active="NO"}}

	,iup.label{title=""}
	,iup.label{title=""}
	,iup.label{title=""}
	,iup.hbox{iup.button{title="Edit",action=edit_category, row=8, active="NO"},iup.button{title="Delete",action=delete_category, row=8, active="NO"}}

	,iup.label{title=""}
	,iup.label{title=""}
	,iup.label{title=""}
	,iup.hbox{iup.button{title="Edit",action=edit_category, row=9, active="NO"},iup.button{title="Delete",action=delete_category, row=9, active="NO"}}
	;numdiv = 4
	,margin = "10x10"
	,gaplin = "15"
	,gapcol = "10"
	,homogenouslin = "YES"
	,alignmentlin = "ACENTER"
}

function categories_grid:initialise()
	for i = 1, 10*self.numdiv do
		print("Gelling ")
		categories_grid[i] = iup.label{title="C"}
		-- print(categories_grid[i].title)
		-- categories_grid:append(iup.label{title="R"})
		-- categories_grid:map()
	end
end

function categories_grid:insert_category(cat_index)
	print(cat_index * self.numdiv + 1)
	print(self[cat_index * self.numdiv + 1])
	self[cat_index * self.numdiv + 1].title = categories[cat_index].name
	self[cat_index * self.numdiv + 2].title = string.format("%0.2f", categories[cat_index].spent)
	self[cat_index * self.numdiv + 3].title = string.format("%0.2f", categories[cat_index].target)
	self[cat_index * self.numdiv + 4][1].active = "YES"
	self[cat_index * self.numdiv + 4][2].active = "YES"
end

function categories_grid:populate()
	for i = 1, #categories do
		self:insert_category(i)
	end
	if self[#categories * self.numdiv + 5] ~= nil then
		self[#categories* self.numdiv + 5].title = ""
		self[#categories* self.numdiv + 6].title = ""
		self[#categories* self.numdiv + 7].title = ""
		self[#categories * self.numdiv + 8][1].active = "NO"
		self[#categories * self.numdiv + 8][2].active = "NO"
	end

end

-- initialise_grid(categories_grid)
-- categories_grid:initialise()
-- populate_grid(categories_grid)
-- categories_grid:append(iup.button{title="New", action=create_new_category})
categories_grid:populate()
-- categories_grid:insert_category(1)

navbar_box = iup.hbox{
	name_btn
	,multi_btn
	,exit_btn
	,iup.fill{}
	;gap=4
	,margin="5x5"
}

crud_box = iup.hbox{
	categories_grid
	-- ,iup.vbox{
	-- 	add_categories_btn
	-- 	,del_transaction_btn
	-- 	;gap=8
	-- }
	;gap=8
}

summary_box = iup.vbox{
	iup.button{title="Generate summary", action=generate_summary}
	,iup.label{title="Spent this month", fontstyle="BOLD"}
	,spent_summary_label
	,iup.label{title=""}
	,iup.label{title="Target this month", fontstyle="BOLD"}
	,target_summary_label
	--,iup.fill{}
	;margin = "5x5"
}

vbox = iup.vbox{
	iup.frame{
		navbar_box
		;Title="Navigation"
	}
	,iup.hbox{
		iup.frame{
			crud_box
			;Title="Categories"
		}
		,iup.frame{
			summary_box
			;Title="Summary"
		}
	}
}

dlg = iup.dialog{
	vbox
	,title="Warren Budget"
	,size="HALFxHALF"
}

dlg:showxy(iup.CENTER, iup.CENTER)

-- to be able to run this script in anoter context
if (iup.MainLoopLevel()==0) then
	iup.MainLoop()
	iup.Close()
end
