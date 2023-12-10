local M = {
	profile = 'default',
	profiles = {
		default = {
			tabstop = 2,
			softtabstop = 2,
			shiftwidth = 2
		}
	}
}

-- Set the option 'key' with value 'value' to the current
-- profile, if the profile doesn't exist, create a new one
function M:set(key, value)
	local opt = self.profiles[self.profile] or {}

	opt[key] = value

	self.profiles[self.profile] = opt
end

function M:load(profile, onbuf)
	local opt = onbuf and vim.bo or vim.opt
	local opts = self.profiles[profile] or {}

	for k, v in pairs(opts) do
		opt[k] = v
	end
end

function M:load_current(onbuf)
	self:load(self.profile, onbuf)
end

function M:create_profile(name, defaults)
	defaults = defaults or {}

	self.profiles[name] = defaults
end

function M:append_profile(profile, overwrite)
	local opts = self.opts
	local profile_opts = self.profiles[profile] or {}

	self.opts = vim.tbl_deep_extend(overwrite and 'force' or 'keep', opts, profile_opts)
end

setmetatable(M, {
	__newindex = function (tbl, key, value)
		tbl:set(key, value)
	end
})

return M
