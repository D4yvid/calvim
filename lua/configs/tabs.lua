local setup = function ()
	local barbar = require 'barbar'

	barbar.setup {
		animations = true,

		auto_hide = false,
		clickable = true,

		icons = {
			button = '',
			separator = { left = '▎', right = ' ' },

			maximum_length = 22,

			separator_at_end = true
		},

		sidebar_filetypes = {
			['neo-tree'] = {event = 'BufWipeout'},
		}
	}
end

return { setup = setup }
