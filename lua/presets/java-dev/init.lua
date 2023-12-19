local M = {}

local PRESET_PATH = vim.fn.stdpath('config') .. '/presets/java-dev'

function M:init()
	vim.opt.runtimepath:append(PRESET_PATH)

	calvim.plugins:create_profile('java-dev', {
		{
			'mfussenegger/nvim-jdtls',

			ft = 'java',
		}
	})
end

function M:activate()
	calvim.plugins:append_profile('java-dev')
end

return M
