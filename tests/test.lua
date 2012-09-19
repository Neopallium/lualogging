
local test = {
	"testConsole.lua",
	"testFile.lua",
	"testMail.lua",
	"testSocket.lua",
	"testSQL.lua",
}

print ("Start of Logging tests")
for _, filename in ipairs(test) do
	dofile(filename)
end
print ("End of Logging tests")
