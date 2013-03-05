local log_console = require"logging.console"

local logger = log_console()

logger:info("logging.console test")
logger:debug("debugging...")
logger:error("error!")
logger:debug("string with %4")
print("Console Logging OK")