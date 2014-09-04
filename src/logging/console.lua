-------------------------------------------------------------------------------
-- Prints logging information to console
--
-- @author Thiago Costa Ponte (thiago@ideais.com.br)
--
-- @copyright 2004-2013 Kepler Project
--
-------------------------------------------------------------------------------

local logging = require"logging"

function logging.console(logPattern, logDatePattern)
	return logging.new( function(self, level, message)
		io.stdout:write(logging.prepareLogMsg(logPattern, os.date(logDatePattern), level, message))
		return true
	end)
end

return logging.console

