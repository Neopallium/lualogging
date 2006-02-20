-------------------------------------------------------------------------------
-- $Id: console.lua,v 1.2 2006-02-20 18:07:49 tuler Exp $
--
-- Prints logging information to console
--
-- Authors:
--   Thiago Costa Ponte (thiago@ideais.com.br)
--
-- Copyright (c) 2004-2006 Kepler Project
-------------------------------------------------------------------------------

require"logging"

function logging.console(logPattern)

    return logging.new(  function(self, level, message)
                            io.stdout:write(logging.prepareLogMsg(logPattern, os.date(), level, message))
                            return true
                        end
                      )
end