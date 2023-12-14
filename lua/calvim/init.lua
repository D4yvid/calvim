local M = {}

function M:init()
	self.user = require 'calvim.user'
	self.settings = require 'calvim.settings'
	self.plugins = require 'calvim.plugins'
	self.plugin_manager = require 'calvim.plugin-manager'
	self.mappings = require 'calvim.mappings'

	self.plugins:load_current()

	self.settings:init()

	self.plugin_manager:ensure_installed()
end

function M:start()
	self.plugin_manager:setup()

	self.mappings:init()

	self.settings:load()

	self.mappings:load_current(false)

	require 'calvim.globals':load()
end

return M
