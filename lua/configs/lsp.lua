if not _G.lsp_servers then
	_G.lsp_servers = {}
end

function add_server(name)
	table.insert(_G.lsp_servers, name)
end

function setup_server(server)
	local lspconfig = require 'lspconfig'
	local cmplsp = require 'cmp_nvim_lsp'
	local capabilities = cmplsp.default_capabilities()

	lspconfig[server].setup {
		capabilities = capabilities,
		root_dir = function (...)
			return vim.loop.cwd()
		end
	}
end

local function diagnostic_symbol(name, icon)
	vim.fn.sign_define(
		'DiagnosticSign' .. name,
		{ text = icon, texthl = 'DiagnosticSign' .. name }
	)
end

local function get_servers()
	local mason_lsp = require 'mason-lspconfig'
	local servers = {}

	for _, item in pairs(mason_lsp.get_installed_servers()) do
		table.insert(servers, item)
	end

	for _, item in pairs(_G.lsp_servers) do
		table.insert(servers, item)
	end

	return servers
end

local setup = function ()
	local mason_lsp = require 'mason-lspconfig'
	local lspconfig = require 'lspconfig'

	require 'mason'.setup {}
	mason_lsp.setup {}

	local servers = get_servers()

	for _, server in pairs(servers) do
		if server == 'sumneko_lua' then
			server = 'lua_ls'
		end

		if server == 'pyright' then
			vim.cmd [[
				au BufRead,BufWrite,BufNew *.py LspStart
			]]
		end

		setup_server(server)
	end

	diagnostic_symbol('Error', '')
	diagnostic_symbol('Warning', '')
	diagnostic_symbol('Info', '󰋽')
	diagnostic_symbol('Hint', '󰋽')

	setup_server('clangd')
end

return {
	setup = setup,
	setup_server = setup_server,
	add_server = add_server
}
