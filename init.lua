local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

function mappings(mappings)
	local map = function (m, k, f, o) vim.keymap.set(m, k, f, o) end

	for _, v in ipairs(mappings) do
		local mode = v[1]
		local key = v[2]
		local fn = v[3]
		local extra_opts = v[4] or {}
		
		local opts = vim.tbl_deep_extend('force', { silent = true, noremap = true }, extra_opts)

		map(mode, key, fn, opts)
	end
end

function lsp_servers(servers)
	for _, v in ipairs(servers) do
		local server_name = v[1]
		local opts = v[2] or {}
		local success, cmp_lsp = pcall(require, 'cmp_nvim_lsp')

		if success then
			opts.capabilities = cmp_lsp.default_capabilities()
		end

		require 'lspconfig'[server_name].setup(opts)
	end
end

function server(name, opts)
	return { name, opts }
end

function treesitter(opts)
	require 'nvim-treesitter.configs'.setup(opts)
end

function comments(opts)
	require 'Comment'.setup(opts)
end

function lsp_installer(lspconfig_opts, meson_opts)
	require 'mason'.setup(meson_opts or {})
	require 'mason-lspconfig'.setup(lspconfig_opts or {})
end

function globals(globs)
	for k, v in pairs(globs) do
		vim.g[k] = v
	end
end

function options(opts)
	for k, v in pairs(opts) do
		vim.opt[k] = v
	end
end

function plugins(pls)
	require 'lazy'.setup(pls, { show_ui = false })
end

function completion(opts)
	require 'cmp'.setup(opts)
end

function completion_sources(sources)
	local ret = {}

	for _, source in ipairs(sources) do
		table.insert(ret, { name = source })
	end

	return ret
end

function completion_mapping(opts)
	return require 'cmp'.mapping(unpack(opts))
end

function telescope(opts)
	require 'telescope'.setup(opts.opts or {})

	for _, ext in ipairs(opts.plugins or {}) do
		require 'telescope'.load_extension(ext)
	end
end

function autopairs(opts)
	require 'nvim-autopairs'.setup(opts)
end

local cmd = {}
setmetatable(cmd, {
	__index = function (_, key)
		return function (...)
			local args = { ... }

			return function ()
				vim.cmd[key](unpack(args))
			end
		end
	end
})

_G.cmd = cmd
_G.colorscheme = vim.cmd.colorscheme

require 'config'
