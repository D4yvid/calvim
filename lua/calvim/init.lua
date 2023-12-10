local M = {}

function M:init()
	self.user = require 'calvim.user'
	self.settings = require 'calvim.settings'
	self.plugins = require 'calvim.plugins'
	self.plugin_manager = require 'calvim.plugin-manager'

	self.plugins:load_current()
	self.settings:init()
	self.plugin_manager:ensure_installed()
end

function M:start()
	self.plugin_manager:setup()
	self.settings:load()
end

return M
