
local page = arg[1] or 'index.html'
local lang = arg[2] or 'us/'

local function dump_file(out, file)
	local fd = assert(io.open(file))
	out:write(fd:read("*a"))
	fd:close()
end

local function dump_page(out, page, lang)
	local page_template = page:gsub(".html$", ".tpl")
	-- check if the template for this page exists.
	local f_template = io.open(lang .. page_template)
	if not f_template then
		print("no template for page '" .. page .. "' of language '" .. lang .. "'")
		return
	end
	-- dump page
	local out = assert(io.open(out, 'w'))
	dofile(lang .. "menu.lua")
	dump_file(out, lang .. 'header.tpl')
	dump_menu(out, page)
	dump_file(out, lang .. page_template)
	dump_file(out, lang .. 'footer.tpl')
	out:close()
end

local pages = {
	"index.html",
	"manual.html",
	"license.html",
	-- appenders
	"console.html",
	"file.html",
	"rolling_file.html",
	"sql.html",
	"socket.html",
	"email.html",
}
local languages = {
	"us",
	"br",
}

for l=1,#languages do
	local lang = languages[l] .. '/'
	for p=1,#pages do
		local page = pages[p]
		dump_page(lang .. page, page, lang)
	end
end

