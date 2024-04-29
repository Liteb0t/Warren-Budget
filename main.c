#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>
#include <iup.h>
#include <iuplua.h>
// as an alternative to meson...
// gcc -Wall -Wextra -g main.c -I/usr/local/include/iup -L/usr/local/lib -liup -llua -liuplua54

int main(int argc, char* argv[])
{
	lua_State *L = luaL_newstate();
	// IupOpen(&argc, &argv);

	luaL_openlibs(L);
	// luaopen_string(L);
	// luaopen_math(L);
	// luaopen_io(L);  
	
	
	iuplua_open(L); 
	luaL_dofile(L, "warren.lua");
	// luaL_dofile(L, "testprint.lua");
	
	// IupClose();
	lua_close(L);
}
