local M = {}

function M:load()
	vim.g.mapleader = calvim.settings.globals.mapleader or ' '
end

return M
