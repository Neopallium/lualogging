LUA_DIR= /usr/local/share/lua/5.0
VERSION= 1.1.0
PKG= lualogging-$(VERSION)
DIST_DIR= $(PKG)
TAR_FILE= $(PKG).tar.gz
ZIP_FILE= $(PKG).zip
LUAS= console.lua email.lua file.lua logging.lua socket.lua sql.lua
SRCS= $(LUAS) README Makefile


dist: dist_dir
	tar -czf $(TAR_FILE) $(DIST_DIR)
	zip -lq $(ZIP_FILE) $(DIST_DIR)/*
	rm -rf $(DIST_DIR)

dist_dir:
	mkdir $(DIST_DIR)
	cp $(SRCS) $(DIST_DIR)

install:
	mkdir -p $(LUA_DIR)/logging
	cp $(LUAS) $(LUA_DIR)/logging

clean:
	rm -f $(TAR_FILE) $(ZIP_FILE)
