-------------------------------------------------------------------------------
-- $Id: console.lua,v 1.3 2007-08-08 20:35:38 carregal Exp $
--
-- Prints logging information to console
--
-- Authors:
--   Thiago Costa Ponte (thiago@ideais.com.br)
--
-- Copyright (c) 2004-2007 Kepler Project
-------------------------------------------------------------------------------

require"logging"

function logging.console(logPattern)

    return logging.new(  function(self, level, message)
                            io.stdout:write(logging.prepareLogMsg(logPattern, os.date(), level, message))
                            return true
                        end
                      )
end