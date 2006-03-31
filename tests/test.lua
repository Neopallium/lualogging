
local test = {
	"testConsole.lua",
	"testFile.lua",
	"testMail.lua",
	"testSocket.lua",
	"testSQL.lua",
}

table.foreachi (test, function (i, filename)
	dofile(filename)
end)
