local setup = function ()
	local telescope = require 'telescope'

	local settings = calvim.settings.plugins.telescope or {}
	local defaults = {
		extensions = {
			'ui-select'
		},
		opts = {}
	}

	local opts = vim.tbl_deep_extend('force', defaults, settings)

	telescope.setup(opts.opts)

	for _, v in ipairs(defaults.extensions) do
		telescope.load_extension(v)
	end
end

return { setup = setup }
