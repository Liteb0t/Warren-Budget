project ('iupwarrenbudget', 'c')

incdir = include_directories ('/usr/local/include/iup')

lua_dep = dependency('lua54')

cc = meson.get_compiler('c')
iuplua_dep = cc.find_library('iuplua54')

executable ('rabbit', 'main.c', include_directories : incdir,
            dependencies: [lua_dep, iuplua_dep])
