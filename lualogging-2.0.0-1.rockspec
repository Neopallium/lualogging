#!/usr/bin/env lua

package	= "lualogging"
version	= "2.0.0-1"
source	= {
	url	= "git://github.com/Neopallium/lualogging.git",
	branch = "v2.0.0",
}
description	= {
	summary	= "A simple API to use logging features",
	detailed	= [[
LuaLogging provides a simple API to use logging features in Lua. Its design was
based on log4j. LuaLogging currently supports, through the use of appenders,
console, file, rolling file, email, socket and SQL outputs.
]],
	homepage	= "https://github.com/Neopallium/lualogging",
	license	= "MIT/X11",
}
dependencies = {
	"luasocket"
}
build	= {
	type		= "none",
	install = {
		lua = {
			['logging.init'] = "src/logging/init.lua",
			['logging.console']  = "src/logging/console.lua",
			['logging.file']  = "src/logging/file.lua",
			['logging.rolling_file']  = "src/logging/rolling_file.lua",
			['logging.email']  = "src/logging/email.lua",
			['logging.sql']  = "src/logging/sql.lua",
			['logging.socket']  = "src/logging/socket.lua",
		}
	},
	copy_directories = {
		"doc/html",
	},
}
