require"logging.sql"
require"luasql.jdbc"

local env, err = luasql.jdbc('com.mysql.jdbc.Driver')

local logger = logging.sql{
                            connectionfactory = function()
                              local con, err = env:connect('jdbc:mysql://localhost/test', 'tcp', '123')
                              assert(con, err)
                              return con
                            end,
                            keepalive = true,
}

logger:info("logging.sql test")
logger:debug("debugging...")
logger:error("error!")
