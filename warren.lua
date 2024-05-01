require("iuplua")
-- require("iupluacontrols")


pboolean = 1
pinteger = 14
preal = 1.1
pinteger2 = 73
preal2 = 0
pangle = 90
transactions = {{category="Transport", spent=2.95}}
categories = {
	{name="Groceries", spent=15.11, target=73.15}
	,{name="Transport", spent=24.68, target=58.12}
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
					"Spent already: %i\n"..
					"Monthly target: %r\n"
					,"", 0.0, 0.0)
	
	print(res)
	if res then
		table.insert(categories,{name=category_name, spend=spent, target=target})
		-- categories_grid:append(table.unpack(categories[#categories]))
		for i = 0, 3 do
			categories_grid:append(iup.label{title=categories[#categories][i]})
		end
		categories_grid:append(iup.label{title="TEST"})
		iup.Update(categories_grid)
		iup.Refresh(categories_grid)
		categories_grid:map()
		iup.Redraw(categories_grid, 1)
	end
	name_btn.title="Blame"
	lbl1test = iup.label{title="TEst 1"}
	navbar_box:append(lbl1test)
	navbar_box:append(iup.label{title="Test 2"})
end

function populate_grid(iup_grid)
	for k, category in pairs(categories) do
		print(category.name)
		iup_grid:append(iup.label{title=category.name})
		iup_grid:append(iup.label{title=category.spent})
		iup_grid:append(iup.label{title=category.target})
	end
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

categories_grid = iup.gridbox{
	iup.label{title="Category name", fontstyle="BOLD"}
	,iup.label{title="Amount spent", fontstyle="BOLD"}
	,iup.label{title="Target", fontstyle="BOLD"}

	;numdiv = 3
	,margin = "10x10"
	,gaplin = "10"
	,gapcol = "10"
}
populate_grid(categories_grid)
categories_grid:append(iup.button{title="New", action=create_new_category})

navbar_box = iup.hbox{
	name_btn
	,multi_btn
	,exit_btn
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

vbox = iup.vbox{
	iup.frame{
		navbar_box
		;Title="Navigation"
	}
	,iup.frame{
		crud_box
		;Title="Budgeting"
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
