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
	add_transaction(dialog)
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

function populate_grid(iup_grid)
	for k, category in pairs(categories) do
		print(category.name)
		iup_grid:append(iup.label{title=category.name})
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

transaction_grid = iup.gridbox{
	iup.label{title="Column 1"}
	,iup.label{title="Col2 :)"}
	,iup.label{title="Third coluumn"}

	,iup.label{title="$1,000"}
	,iup.label{title="Yeezys"}
	,exit_btn

	-- ,populate_grid()
	;numdiv = 3
	,margin = "10x10"
	,gaplin = "10"
	,gapcol = "10"
}
populate_grid(transaction_grid)
transaction_grid:append(iup.button{title="New", action=update_button_state})

navbar_box = iup.hbox{
	name_btn
	,multi_btn
	,exit_btn
	;gap=4
	,margin="5x5"
}

crud_box = iup.hbox{
	transaction_grid
	-- ,iup.vbox{
	-- 	add_transaction_btn
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
