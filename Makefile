# Default prefix
PREFIX = /usr/local

# System's lua directory (where Lua libraries are installed)
LUA_DIR= $(PREFIX)/share/lua/5.1

LUAS= src/logging/init.lua src/logging/console.lua src/logging/email.lua src/logging/file.lua src/logging/rolling_file.lua src/logging/socket.lua src/logging/sql.lua

build clean:

install:
	mkdir -p $(LUA_DIR)/logging
	cp $(LUAS) $(LUA_DIR)/logging
