local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.notify 'Installing lazy.nvim...'

	vim.fn.system {
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath
	}
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	{
		'hrsh7th/nvim-cmp',

		dependencies = {
			'nvim-tree/nvim-web-devicons',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
		},

		main = 'configs.completion'
	},

	{
		'neovim/nvim-lspconfig',

		dependencies = {
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',
		},

		main = 'configs.lsp'
	},

	{
		'akinsho/toggleterm.nvim',

		main = 'configs.term'
	},

	{
		'elkowar/yuck.vim',

		event = 'VeryLazy'
	},

	{
		'lewis6991/gitsigns.nvim',

		main = 'configs.git'
	},

	{
		'folke/which-key.nvim',

		main = 'configs.mappings',
		priority = 200
	},

	{
		'nvim-telescope/telescope.nvim',

		dependencies = {
			'nvim-telescope/telescope-ui-select.nvim',
			'nvim-lua/plenary.nvim'
		},

		main = 'configs.telescope'
	},

	{
		'nvim-lualine/lualine.nvim',

		main = 'configs.statusline',
	},

	{ 'nvim-treesitter/nvim-treesitter', main = 'configs.treesitter', event = 'BufReadPre' },

	{
		'folke/noice.nvim',

		dependencies = {
			'MunifTanjim/nui.nvim',
			'rcarriga/nvim-notify'
		},

		main = 'configs.noice',
		event = 'VimEnter'
	},

	{ 'lukas-reineke/indent-blankline.nvim', main = 'configs.indentline' },

	{ 'windwp/nvim-autopairs', main = 'configs.autopairs' },

	{
		'nvim-tree/nvim-tree.lua',

		main = 'configs.nvimtree'
	},

	{
		"catppuccin/nvim",
		name = 'catppuccin',

		event = 'VimEnter',
		main = 'configs.colorscheme'
	},

	{
		'romgrk/barbar.nvim',

		main = 'configs.tabs'
	}
}

for _, plugin in ipairs(plugins) do
	if plugin.main ~= nil then
		plugin.config = true
		
		if (plugin.event or plugin.cmd or plugin.ft) == nil then
			plugin.event = 'VeryLazy'
		end
	end
end

local opts = {
	defaults = {
		lazy = true
	},

	concurrency = vim.loop.available_parallelism()
}

local lazy = require 'lazy'

lazy.setup(plugins, opts)
