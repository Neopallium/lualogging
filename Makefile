# $Id: Makefile,v 1.8 2007-05-17 22:47:20 hisham Exp $

LUA_DIR= /usr/local/share/lua/5.1

LUAS= src/logging/console.lua src/logging/email.lua src/logging/file.lua src/logging/socket.lua src/logging/sql.lua
ROOT_LUAS= src/logging/logging.lua 

build clean:

install:
	mkdir -p $(LUA_DIR)/logging
	cp $(LUAS) $(LUA_DIR)/logging
	cp $(ROOT_LUAS) $(LUA_DIR)
