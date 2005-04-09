LUA_DIR= /usr/local/share/lua/5.0
VERSION= 1.1.0
PKG= lualogging-$(VERSION)
DIST_DIR= $(PKG)
TAR_FILE= $(PKG).tar.gz
ZIP_FILE= $(PKG).zip
LUAS= src/console.lua src/email.lua src/file.lua src/logging.lua src/socket.lua src/sql.lua
SRCS= $(LUAS)


dist: dist_dir
	tar -czf $(TAR_FILE) $(DIST_DIR)
	zip -rq $(ZIP_FILE) $(DIST_DIR)/*
	rm -rf $(DIST_DIR)

dist_dir:
	mkdir $(DIST_DIR)
	cp README Makefile $(DIST_DIR)
	cp $(SRCS) $(DIST_DIR)/src

install:
	mkdir -p $(LUA_DIR)/logging
	cp $(LUAS) $(LUA_DIR)/logging

clean:
	rm -f $(TAR_FILE) $(ZIP_FILE)
