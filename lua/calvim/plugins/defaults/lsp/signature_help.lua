local setup = function ()
	local lsp_signature = require 'lsp_signature'

	local hint_prefix = calvim.settings.plugins.enable_icons and ' ' or 'fn(): '

	local settings = calvim.settings.plugins.lsp_signature or {}
	local defaults = {
		bind = true,
		floating_window = false,

		hint_prefix = hint_prefix
	}

	local opts = vim.tbl_deep_extend('force', defaults, settings)

	lsp_signature.on_attach(opts)
end

return { setup = setup }
