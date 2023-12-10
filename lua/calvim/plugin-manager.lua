local M = {}

function M:ensure_installed()
	local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

	if not vim.loop.fs_stat(lazy_path) then
		vim.notify 'Installing lazy.nvim...'

		vim.fn.system {
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable",
			lazy_path,
		}
	end

	vim.opt.rtp:prepend(lazy_path)

	self.lazy = require 'lazy'
end

function M:setup()
	local plugin_specs = calvim.plugins.specs
	local specs = {}

	for _, spec in pairs(plugin_specs) do
		table.insert(specs, spec)
	end

	self.lazy.setup(specs, calvim.settings.lazy)
end

return M
