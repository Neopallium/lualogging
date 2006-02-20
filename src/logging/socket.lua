-------------------------------------------------------------------------------
-- $Id: socket.lua,v 1.2 2006-02-20 18:07:49 tuler Exp $
--
-- Sends the logging information through a socket using luasocket
--
-- Authors:
--   Thiago Costa Ponte (thiago@ideais.com.br)
--
-- Copyright (c) 2004-2006 Kepler Project
-------------------------------------------------------------------------------

require"logging"
local socket = require"socket"

function logging.socket(address, port, logPattern)

    return logging.new( function(self, level, message)
                            local s = logging.prepareLogMsg(logPattern, os.date(), level, message)

                            local socket, err = socket.connect(address, port)
                            if not socket then
                                return nil, err
                            end
                            
                            local cond, err = socket:send(s)
                            if not cond then
                                return nil, err
                            end
                            socket:close()
                            
                            return true
                        end
                      )
end
