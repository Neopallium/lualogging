package = "LuaLogging"
version = "cvs-2"
source = {
   url = "cvs://:pserver:anonymous:@cvs.luaforge.net:/cvsroot/lualogging",
   cvs_tag = "HEAD",
}
description = {
   summary = "A simple API to use logging features",
   detailed = [[
      LuaLogging provides a simple API to use logging features in Lua.
      Its design was based on log4j. LuaLogging currently supports,
      through the use of appenders, console, file, email, socket and
      SQL outputs.
   ]],
   license = "MIT/X11",
   homepage = "http://www.keplerproject.org/lualogging/"
}
dependencies = {
   "lua >= 5.1",
   "luasocket >= 2.0"
}
build = {
   type = "make",
   build_pass = false,
   install_variables = {
      LUA_DIR = "$(LUADIR)"
   }
}