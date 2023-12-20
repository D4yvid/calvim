local M = {
	settings = {}
}

function M:load()
	local user_rtp = USER_DIR

	-- Load extra user settings, like filetype-plugins, etc.
	vim.opt.runtimepath:append(user_rtp)

	-- Load user options
	local success, settings = pcall(require, 'user')

	if not success then
		vim.notify('Could not load user configuration: ' .. settings, 'error')

		return
	end

	self.settings = settings

	if type(self.settings) == 'table' then
		-- The user returned options in the script,
		-- set them all in `calvim.settings`

		local settings = calvim.settings

		calvim.settings = vim.tbl_deep_extend('force', settings, self.settings)
	end
end

return M
