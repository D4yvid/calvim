local noice = require 'noice'
local opts = {
	cmdline = {
		enabled = true,
		view = 'cmdline_popup'
	},
	lsp = {
		signature = {
			enabled = false
		}
	}
}

return { setup = function () noice.setup(opts) end }
