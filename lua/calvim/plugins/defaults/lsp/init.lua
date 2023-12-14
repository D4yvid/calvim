local setup = function ()
	local lspconfig = require 'lspconfig'
	local mason = require 'mason'
	local mason_lsp = require 'mason-lspconfig'

	local icons = {
		mason = {
			package_installed = calvim.settings.plugins.enable_icons and "󱧘" or 'Installed:',
			package_pending = calvim.settings.plugins.enable_icons and "󰏗" or 'Pending:',
			package_uninstalled = calvim.settings.plugins.enable_icons and "󱧙" or 'Uninstalled:'
		}
	}

	function lsp_installed_handler(server_name)
		setup_server(server_name)
	end

	local settings = calvim.settings.plugins.lspconfig or {}
	local defaults = {
		mason = {
			ui = {
				check_outdated_packages_on_open = true,

				icons = icons.mason,
			}
		},
		mason_lsp = {
			handlers = {
				lsp_installed_handler
			}
		}
	}

	function lsp_on_attach(client, bufnr)
		calvim.mappings:load('lsp', true)

		if calvim.settings.lsp.on_attach then
			calvim.settings.lsp.on_attach(client, bufnr)
		end
	end

	function setup_server(server_name)
		local opts = calvim.settings.lsp[server_name] or {}
		local capabilities = (calvim.plugins.specs.completion or { '' })[1] == 'hrsh7th/nvim-cmp' and require 'cmp_nvim_lsp'.default_capabilities() or nil
		local defaults = {
			on_attach = lsp_on_attach,
			capabilities = capabilities
		}

		local setup_opts = vim.tbl_deep_extend('force', defaults, opts)

		lspconfig[server_name].setup(setup_opts)
	end

	local opts = vim.tbl_deep_extend('force', defaults, settings)

	mason.setup(opts.mason)
	mason_lsp.setup(opts.mason_lsp)
end

return { setup = setup }
