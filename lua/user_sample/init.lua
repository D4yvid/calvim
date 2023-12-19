-- Set the default colorscheme to slate
-- calvim.settings.colorscheme = 'gruvbox'

-- You can have multiple plugin profiles, and append them together in the end or just use one
-- for your configuration
-- calvim.plugins:create_profile('test-profile', {
	-- Add here the plugins that you want
	-- If you want to overwrite default plugins, or you want to overwrite specific plugins for
	-- specific profiles, put their plugin name as the key and set the plugin spec to another spec.
	-- colorscheme = { 'ellisonleao/gruvbox.nvim' },

	-- Otherwise, just add new specs
	-- { 'Civitasv/cmake-tools.nvim' }
-- })

-- If you want to remove all plugins, and use only the plugins that your profile installs,
-- uncomment the line below.
--
-- calvim.plugins.profile = 'test-profile'
-- OR
-- calvim.plugins:load('test-profile') -- To load the profile without setting it as default

-- Append this profile in the current loaded profile
-- overwrite: set to true if you want to overwrite already added plugins
-- calvim.plugins:append_profile('test-profile', --[[overwrite: ]] true)

-- Disable all icons
-- calvim.settings.plugins.enable_icons = false

-- Include presets (see lua/presets/README.md for more info)
local java_preset = require 'presets.java-dev'

java_preset:init()
java_preset:activate()
