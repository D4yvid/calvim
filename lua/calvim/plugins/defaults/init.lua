return {
	colorscheme = { 'projekt0n/github-nvim-theme' },

	noice_ui = {
		'folke/noice.nvim',

		dependencies = {
			'MunifTanjim/nui.nvim'
		},

		event = 'VimEnter',
		config = true,
		main = 'calvim.plugins.defaults.noice'
	},

	auto_pairs = {
		'windwp/nvim-autopairs',

		event = 'VimEnter',

		config = function (opts)
			require 'nvim-autopairs'.setup(opts)
		end
	},

	lsp_signature = {
		'ray-x/lsp_signature.nvim',

		event = 'LspAttach',

		config = true,
		main = 'calvim.plugins.defaults.lsp.signature_help'
	},

	lspconfig = {
		'neovim/nvim-lspconfig',

		dependencies = {
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim'
		},

		event = 'VeryLazy',
		config = true,

		main = 'calvim.plugins.defaults.lsp'
	},

	completion = {
		'hrsh7th/nvim-cmp',

		dependencies = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'dcampos/nvim-snippy',
			'dcampos/cmp-snippy'
		},

		event = { 'InsertEnter', 'CmdlineEnter' },
		config = true,

		main = 'calvim.plugins.defaults.completion'
	},

	statusline = {
		'nvim-lualine/lualine.nvim',

		event = 'VeryLazy',
		config = true,

		main = 'calvim.plugins.defaults.statusline'
	},

	telescope = {
		'nvim-telescope/telescope.nvim',

		branch = '0.1.x',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope-ui-select.nvim'
		},

		event = 'VeryLazy',
		config = true,

		main = 'calvim.plugins.defaults.telescope'
	},

	file_tree = {
		'nvim-tree/nvim-tree.lua',

		dependencies = {
			'nvim-tree/nvim-web-devicons'
		},

		event = 'VeryLazy',
		config = true,

		main = 'calvim.plugins.defaults.file-tree'
	},

	which_key = {
		'folke/which-key.nvim',

		lazy = false
	},

	harpoon = {
		'ThePrimeagen/harpoon',

		event = 'VeryLazy',
	}
}
