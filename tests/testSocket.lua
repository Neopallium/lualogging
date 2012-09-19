local logger = require("logging.socket")("localhost", 5000)

logger:info("logging.socket test")
logger:debug("debugging...")
logger:error("error!")

print("Socket Logging OK")