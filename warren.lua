require("iuplua")
-- require("iupluacontrols")


pboolean = 1
pinteger = 14
preal = 1.1
pinteger2 = 73
preal2 = 0
pangle = 90


function exit_window(self)
    return iup.CLOSE
end

function test(self)
	res, name = iup.GetParam("Title", nil
		, "Give your name: %s\n", "")
	
	if name ~= nil then
		iup.Message("Hello!", name)
	end
end

function print_something(dialog, param_index)
	print("Yo something was printed guys")
	print("brazil")
	return 1
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

name_btn = iup.button{
	title = "Name"
	,action = test
}

multi_btn = iup.button{
	title = "multiple fields"
	,action = getparam_multiple
}

exit_btn = iup.button{
    title = "Exit",
    action = exit_window
}

hbox = iup.hbox{
	name_btn
	,multi_btn
	,exit_btn
	;gap=4
}

dlg = iup.dialog{
    hbox,
    title="Warren Budget",
    size="HALFxHALF"
}

dlg:showxy(iup.CENTER, iup.CENTER)

-- to be able to run this script in anoter context
if (iup.MainLoopLevel()==0) then
	iup.MainLoop()
	iup.Close()
end
