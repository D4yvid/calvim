local M = {}

function M:init()
	self.colorscheme = 'github_dark_default'

	self.vim = require 'calvim.settings.vim_opts'
	self.plugins = require 'calvim.settings.plugins'
	self.lazy = require 'calvim.settings.lazy'
	self.lsp = {}
	self.globals = {}
end

function M:load()
	vim.cmd.colorscheme(self.colorscheme)

	self.vim:load_current()
end

return M
