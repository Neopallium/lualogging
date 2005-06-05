# $Id: Makefile,v 1.4 2005-06-05 17:21:42 tomas Exp $

LUA_DIR= /usr/local/share/lua/5.0

LUAS= src/console.lua src/email.lua src/file.lua src/logging.lua src/socket.lua src/sql.lua


build clean:

install:
	mkdir -p $(LUA_DIR)/logging
	cp $(LUAS) $(LUA_DIR)/logging
