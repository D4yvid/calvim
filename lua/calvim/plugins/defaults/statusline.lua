local setup = function ()
	local lualine = require 'lualine'

	local settings = calvim.settings.plugins.statusline or {}
	local defaults = {
		options = {
			icons_enabled = calvim.settings.plugins.enable_icons,
			theme         = 'auto',

			component_separators = { left = '', right = '' },
			section_separators   = { left = '', right = '' },

			globalstatus = true
		},

		sections = {
			lualine_a = { 'mode' },
			lualine_b = { 'diagnostics' },
			lualine_c = { 'branch' },

			lualine_x = { 'filetype' },
			lualine_y = { 'location' },
			lualine_z = { }
		},

		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {}
		}
	}

	local opts = vim.tbl_deep_extend('force', defaults, settings)

	lualine.setup(opts)
end

return { setup = setup }
