-------------------------------------------------------------------------------
-- Saves the logging information in a table using luasql
--
-- @author Thiago Costa Ponte (thiago@ideais.com.br)
--
-- @copyright 2004-2012 Kepler Project
--
-------------------------------------------------------------------------------

local logging = require"logging"

function logging.sql(params)

	params = params or {}
    params.tablename = params.tablename or "LogTable"
    params.logdatefield = params.logdatefield or "LogDate"
    params.loglevelfield = params.loglevelfield or "LogLevel"
    params.logmessagefield = params.logmessagefield or "LogMessage"

	if params.connectionfactory == nil or type(params.connectionfactory) ~= "function" then
		return nil, "No specified connection factory function"
	end

    local con, err
    if params.keepalive then
        con, err = params.connectionfactory()
    end

    return logging.new( function(self, level, message)
                            if (not params.keepalive) or (con == nil) then
                                con, err = params.connectionfactory()
                                if not con then
                                    return nil, err
                                end
                            end

                            local logDate = os.date("%Y-%m-%d %H:%M:%S")
                            local insert  = string.format("INSERT INTO %s (%s, %s, %s) VALUES ('%s', '%s', '%s')",
                                                          params.tablename, params.logdatefield, params.loglevelfield,
                                                          params.logmessagefield, logDate, level, string.gsub(message, "'", "''"))

                            local ret, err = pcall(con.execute, con, insert)
                            if not ret then
                                con, err = params.connectionfactory()
                                if not con then
                                    return nil, err
                                end
                                ret, err = con:execute(insert)
                                if not ret then
                                    return nil, err
                                end
                            end

                            if not params.keepalive then
                                con:close()
                            end

                            return true
                        end
                      )
end

return logging.sql

