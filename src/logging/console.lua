-------------------------------------------------------------------------------
-- $Id: console.lua,v 1.1 2004-11-16 16:33:10 tuler Exp $
--
-- Prints logging information to console
--
-- Authors:
--   Thiago Costa Ponte (thiago@ideais.com.br)
--
-- Copyright (c) 2004 Kepler Project
-------------------------------------------------------------------------------

require"logging"

function logging.console(logPattern)

    return logging.new(  function(self, level, message)
                            io.stdout:write(logging.prepareLogMsg(logPattern, os.date(), level, message))
                            return true
                        end
                      )
end