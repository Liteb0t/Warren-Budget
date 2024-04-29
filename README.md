## Dependencies
Iup and Iuplua 3.31: https://sourceforge.net/projects/iup/files/3.31/ <br>
Lua 5.4: https://www.lua.org/download.html

## Build
Use `ninja -C builddir` to build and `./builddir/rabbit` to run<br>
Alternatively, the gcc command is `gcc -Wall -Wextra -g main.c -I/usr/local/include/iup -liup -llua -liuplua54`
