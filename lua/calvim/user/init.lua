local M = {
	settings = {}
}

function M:load()
	local user_rtp = USER_DIR

	-- Load extra user settings, like filetype-plugins, etc.
	vim.opt.runtimepath:append(user_rtp)

	-- Load user options
	self.settings = require 'user'

	if type(self.settings) == 'table' then
		-- The user returned options in the script,
		-- set them all in `calvim.settings`

		local settings = calvim.settings

		calvim.settings = vim.tbl_deep_extend('force', settings, self.settings)
	end
end

return M
