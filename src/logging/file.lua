-------------------------------------------------------------------------------
-- Saves logging information in a file
--
-- @author Thiago Costa Ponte (thiago@ideais.com.br)
--
-- @copyright 2004-2013 Kepler Project
--
-------------------------------------------------------------------------------
local logging = require"logging"
logging_fileHandler = {} -- store the file handlers

function openFileLogger(filename, datePattern)
	local filename = string.format(filename, os.date(datePattern))
	if logging_fileHandler[filename] == nil then
		f = io.open(filename, "a")
		if (f) then
			f:setvbuf ("line")
			logging_fileHandler[filename] = f
			return f
		else
			return nil, string.format("file `%s' could not be opened for writing", filename)
		end
	else
		return logging_fileHandler[filename]
	end
end

function logging.file(filename, datePattern, logPattern)
	if type(filename) ~= "string" then
		filename = "lualogging.log"
	end

	return logging.new( function(self, level, message)
		local f, msg = openFileLogger(filename, datePattern)
		if not f then
			return nil, msg
		end
		local s = logging.prepareLogMsg(logPattern, os.date(), level, message)
		f:write(s)
		return true
	end)
end

return logging.file
