require("iuplua")
-- require("iupluacontrols")

--[[
	I am deeply sorry for whoever might have to read this code...
	It's a little embarrasing
]]--


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
		categories_grid[(#categories*4+1)+1].title = spent
		categories_grid[(#categories*4+1)+2].title = target
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

function edit_category(pos)
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
		categories_grid[(pos*4+1)+1].title = spent
		categories_grid[(pos*4+1)+2].title = target
	end
end

function initialise_grid(iup_grid)
	for i = 1, 30 do
		iup_grid:append(iup.label{title="."})
	end
end

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
function populate_grid(iup_grid)
	local grid_index = 1
	for i = 1, #categories do
		grid_index = (i * 4) + 1
		-- print(grid_index)
		-- print(#categories)
		-- print(#iup_grid)
	
		if iup_grid[grid_index] ~= nil then
			iup_grid[grid_index].title = categories[i].name
			iup_grid[grid_index+1].title = categories[i].spent
			iup_grid[grid_index+2].title = categories[i].target
		end
	end
	iup_grid[grid_index+4].title=""
	iup_grid[grid_index+5].title=""
	iup_grid[grid_index+6].title=""
	-- iup_grid[grid_index+5].title=""
	-- for k, category in pairs(categories) do
	-- 	print(category.name)
	-- 	iup_grid:append(iup.label{title=category.name})
	-- 	iup_grid:append(iup.label{title=category.spent})
	-- 	iup_grid:append(iup.label{title=category.target})
	-- end
end

function generate_summary()
	spent_this_month = 0
	target_this_month = 0
	for key, cat in pairs(categories) do
		spent_this_month = spent_this_month + cat.spent
		target_this_month = target_this_month + cat.target
	end
	spent_summary_label.title = spent_this_month
	target_summary_label.title = target_this_month
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
	,iup.hbox{iup.button{title="Edit",action=edit_category1},iup.button{title="Delete",action=delete_category1}}
	
	,iup.label{title=""}
	,iup.label{title=""}
	,iup.label{title=""}
	,iup.hbox{iup.button{title="Edit",action=edit_category2},iup.button{title="Delete",action=delete_category2}}

	,iup.label{title=""}
	,iup.label{title=""}
	,iup.label{title=""}
	,iup.hbox{iup.button{title="Edit",action=edit_category3},iup.button{title="Delete",action=delete_category3}}

	,iup.label{title=""}
	,iup.label{title=""}
	,iup.label{title=""}
	,iup.hbox{iup.button{title="Edit",action=edit_category4},iup.button{title="Delete",action=delete_category4}}

	,iup.label{title=""}
	,iup.label{title=""}
	,iup.label{title=""}
	,iup.hbox{iup.button{title="Edit",action=edit_category5},iup.button{title="Delete",action=delete_category5}}

	,iup.label{title=""}
	,iup.label{title=""}
	,iup.label{title=""}
	,iup.hbox{iup.button{title="Edit",action=edit_category6},iup.button{title="Delete",action=delete_category6}}

	,iup.label{title=""}
	,iup.label{title=""}
	,iup.label{title=""}
	,iup.hbox{iup.button{title="Edit",action=edit_category7},iup.button{title="Delete",action=delete_category7}}

	,iup.label{title=""}
	,iup.label{title=""}
	,iup.label{title=""}
	,iup.hbox{iup.button{title="Edit",action=edit_category8},iup.button{title="Delete",action=delete_category8}}

	,iup.label{title=""}
	,iup.label{title=""}
	,iup.label{title=""}
	,iup.hbox{iup.button{title="Edit",action=edit_category9},iup.button{title="Delete",action=delete_category9}}
	;numdiv = 4
	,margin = "10x10"
	,gaplin = "20"
	,gapcol = "10"
}
-- initialise_grid(categories_grid)
populate_grid(categories_grid)
categories_grid:append(iup.button{title="New", action=create_new_category})

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
