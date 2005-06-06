# $Id: Makefile,v 1.5 2005-06-06 20:08:45 tomas Exp $

LUA_DIR= /usr/local/share/lua/5.0

LUAS= src/logging/console.lua src/logging/email.lua src/logging/file.lua src/logging/logging.lua src/logging/socket.lua src/logging/sql.lua


build clean:

install:
	mkdir -p $(LUA_DIR)/logging
	cp $(LUAS) $(LUA_DIR)/logging
