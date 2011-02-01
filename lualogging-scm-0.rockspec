#!/usr/bin/env lua

package	= 'lualogging'
version	= 'scm-0'
source	= {
	url	= 'git://github.com/Neopallium/lualogging.git'
}
description	= {
	summary	= "A simple API to use logging features",
	detailed	= [[
LuaLogging provides a simple API to use logging features in Lua. Its design was
based on log4j. LuaLogging currently supports, through the use of appenders,
console, file, email, socket and SQL outputs.
]],
	homepage	= 'http://www.keplerproject.org/lualogging/',
	license	= 'MIT/X11',
}
dependencies = {
	'luasocket'
}
build	= {
	type		= 'none',
	install = {
		lua = {
			['logging'] = "src/logging.lua",
			['logging.console']  = "src/logging/console.lua",
			['logging.file']  = "src/logging/file.lua",
			['logging.email']  = "src/logging/email.lua",
			['logging.sql']  = "src/logging/sql.lua",
			['logging.socket']  = "src/logging/socket.lua",
		}
	}
}
