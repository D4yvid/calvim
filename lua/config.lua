plugins {
	{
		'nvim-telescope/telescope.nvim',

		dependencies = { 'nvim-lua/plenary.nvim' }
	},

	{
		'neovim/nvim-lspconfig',

		dependencies = { 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim' }
	},

	{
		'nvim-treesitter/nvim-treesitter',

		dependencies = {
			'windwp/nvim-ts-autotag',
			'numToStr/Comment.nvim'
		}
	},

	{
		'hrsh7th/nvim-cmp',

		dependencies = {
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-nvim-lsp',

			'dcampos/nvim-snippy',
			'dcampos/cmp-snippy',
		}
	},

	'bluz71/vim-moonfly-colors',
}

options {
	number = true,
	relativenumber = true,
	signcolumn = 'yes',
	fillchars = { eob = ' ' },
	termguicolors = true,
	laststatus = 2,
	tabstop = 2,
	softtabstop = 2,
	shiftwidth = 2,
	smartindent = true,
	autoindent = true,
	smarttab = true
}

colorscheme 'moonfly'

globals {
	mapleader = ' '
}

mappings {
	{ 'n', '<leader>gh', cmd.mark 'h' },
	{ 'n', '<leader>gj', cmd.mark 'j' },
	{ 'n', '<leader>gk', cmd.mark 'k' },
	{ 'n', '<leader>gl', cmd.mark 'l' },
	{ 'n', '<leader>h' , cmd.lua "pcall(vim.cmd, [['h]])" },
	{ 'n', '<leader>j' , cmd.lua "pcall(vim.cmd, [['j]])" },
	{ 'n', '<leader>k' , cmd.lua "pcall(vim.cmd, [['k]])" },
	{ 'n', '<leader>l' , cmd.lua "pcall(vim.cmd, [['l]])" },
	{ 'n', '<leader>f' , cmd.Telescope 'find_files' },
	{ 'n', '<leader>o' , cmd.Telescope 'live_grep' },
	{ 'n', '<leader>e' , vim.cmd.Ntree },
}

treesitter {
	highlight = { enable = true },
	autotag = { enable = true }	
}

completion {
	sources = completion_sources {
		'nvim_lsp',
		'buffer',
		'snippy'
	},

	snippet = {
		expand = function (args)
			require 'snippy'.expand_snippet(args.body)
		end
	},

	mapping = {
		['<Tab>'] = completion_mapping { function (fallback)
			local cmp = require 'cmp'
			local snippy = require 'snippy'

			if cmp.visible() then
				if #cmp.get_entries() == 1 then
					cmp.confirm { select = true }
				else
					cmp.select_next_item()
				end
			elseif snippy.can_expand_or_advance() then
				snippy.expand_or_advance()
			else
				fallback()
			end
		end, { 'i', 's' } },

		['<S-Tab>'] = completion_mapping { function (fallback)
			local cmp = require 'cmp'
			local snippy = require 'snippy'

			if cmp.visible() then
				if #cmp.get_entries() == 1 then
					cmp.confirm { select = true }
				else
					cmp.select_prev_item()
				end
			elseif snippy.can_jump(-1) then
				snippy.previous()
			else
				fallback()
			end
		end, { 'i', 's' } },

		['<C-b>']     = completion_mapping { function (_) require 'cmp'.mapping.scroll_docs(-4) end, { 'i' } },
		['<C-f>']     = completion_mapping { function (_) require 'cmp'.mapping.scroll_docs(4) end, { 'i' } },
		['<C-Space>'] = completion_mapping { function (_) require 'cmp'.mapping.complete() end, { 'i' } },
		['<C-e>']     = completion_mapping { function (_) require 'cmp'.mapping.abort() end, { 'i' } },
		['<CR>']      = completion_mapping { function (fallback)
			local cmp = require 'cmp'

			if cmp.visible() and cmp.get_active_entry() then
				cmp.confirm { select = true }
			else
				fallback()
			end
		end, { 'i' } }
	}
}

lsp_servers {
	server 'clangd',
	server 'lua_ls'
}

lsp_installer {
}

comments {
}
