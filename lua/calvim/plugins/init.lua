local M = {
	profile = 'default',
	profiles = {
		default = require 'calvim.plugins.defaults',
	},
	specs = {}
}

function M:load(profile)
        self.specs = self.profiles[profile] or self.profiles[self.profile] or {}
end
 
function M:load_current()
        self:load(self.profile)
end

function M:append_profile(profile, overwrite)
	local specs = self.specs
	local profile_specs = self.profiles[profile] or {}

	self.specs = vim.tbl_deep_extend(overwrite and 'force' or 'keep', specs, profile_specs)
end

function M:create_profile(name, defaults)
        defaults = defaults or {}
 
        self.profiles[name] = defaults
end

return M
