--require"logging.email"

local logger = require("logging.email")({
                               rcpt = "mail@host.com",
                               from = "mail@host.com",
                               { 
                                 subject = "[%level] logging.email test", 
                               }, -- headers
})

logger:info("logging.email test")
logger:debug("debugging...")
logger:error("error!")

print("Mail Logging OK")