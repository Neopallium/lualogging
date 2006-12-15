# $Id: Makefile,v 1.6 2006-12-15 18:23:20 mascarenhas Exp $

LUA_DIR= /usr/local/share/lua/5.1

LUAS= src/logging/console.lua src/logging/email.lua src/logging/file.lua src/logging/logging.lua src/logging/socket.lua src/logging/sql.lua

build clean:

install:
	mkdir -p $(LUA_DIR)/logging
	cp $(LUAS) $(LUA_DIR)/logging
	ln -s $(LUA_DIR)/logging/logging.lua $(LUA_DIR)/logging.lua
