local noice = require 'noice'
local opts = {
	cmdline = {
		enabled = true,
		view = 'cmdline_popup'
	}
}

return { setup = function () noice.setup(opts) end }
