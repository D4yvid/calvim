local M = {
	profile = 'default',
	profiles = {},
}

function M:init()
	local settings = calvim.settings.plugins.which_key or {}
	local defaults = {
		key_labels = {
			["<space>"] = "SPC",
			["<cr>"] = "RET",
			["<tab>"] = "TAB",
		},

		icons = {
			breadcrumb = calvim.settings.plugins.enable_icons and "»" or '>',
			separator = calvim.settings.plugins.enable_icons and "➜" or '->',
			group = "+",
		},

		show_help = false,

		window = {
			position = 'top',
			margin = { 1, 1, 1, 1 },
      padding = { 1, 2, 1, 2 },
			zindex = 2000
		}
	}

	local opts = vim.tbl_deep_extend('force', defaults, settings)

	self.whichkey = require 'which-key'

	self.profiles.default = require 'calvim.mappings.defaults'
	self.profiles.lsp = require 'calvim.mappings.defaults.lsp'

	self.whichkey.setup(opts)
end

function M:load(profile_name, onbuf)
	local buf = onbuf and vim.fn.bufnr('%') or nil
	local profile = self.profiles[profile_name] or {}
	local opts = profile.opts or { silent = true, noremap = true, buffer = buf }

	for mode, mappings in pairs(profile) do
		if mode == 'opts' then
			goto continue
		end

		self.whichkey.register(mappings, vim.tbl_deep_extend('force', opts, { mode = mode }))

		::continue::
	end
end

function M:load_current(onbuf)
	self:load(self.profile, onbuf)
end

function M:create_profile(name, defaults)
	defaults = defaults or {}

	self.profiles[name] = defaults
end

return M
