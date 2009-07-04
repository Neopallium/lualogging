_pwd := $(pwd)

include $(make-common.dir)/tool/cp.mk
include $(make-common.dir)/tool/lua.mk
include $(make-common.dir)/layout.mk

$(lua.lib.dir)/%.lua: $(_pwd)/src/%.lua
	$(cp.rule)

$(lua.lib.dir)/%.lua: $(_pwd)/src/logging/%.lua
	$(cp.rule)

all: $(addprefix $(lua.lib.dir)/, \
	logging/console.lua \
	logging/email.lua \
	logging/file.lua \
	logging/socket.lua \
	logging/sql.lua \
	logging.lua \
)

# How to run lualogging tests:
.PHONY: lualogging.test
test: | lualogging.test

lua ?= lua
lualogging.test: lua.path += $(_pwd)
lualogging.test: test.dir  = $(_pwd)/tests
lualogging.test:
	cd $(test.dir); env -i $(lua.run) $(lua) test.lua
