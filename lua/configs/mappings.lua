local whichkey = require 'which-key'

vim.g.mapleader = ' '

local setup = function ()
	whichkey.setup {
		plugins = {
			marks = false,
			registers = false
		},

		key_labels = {
			['<space>'] = 'Space',
			['<cr>'] = 'Enter',
			['<tab>'] = 'Tab',
		},

		icons = {
			breadcrumb = '',
			separator = '',
			group = ''
		},

		popup_mappings = {
			scroll_up = '<Up>',
			scroll_down = '<Down>'
		},

		window = {
			border = 'none',
			position = 'top',
			margin = { 1, 1, 1, 1 },
			padding = { 1, 1, 0, 1 },
			winblend = 10
		},

		ignore_missing = true,
		hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
		show_help = false,
		show_keys = false,

		disable = {
			filetypes = { 'fine-cmdline' }
		}
	}

	whichkey.register({
		l = {
			name = ' LSP (Language Server Protocol)',

			f = { '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', '󰦨 Format' },
			h = { '<cmd>lua vim.lsp.buf.hover()<CR>', '󱁯 Hover' },
			r = { '<cmd>lua vim.lsp.buf.rename()<CR>', '󰏫 Rename' },
			s = { '<cmd>lua vim.lsp.buf.signature_help()<CR>', '󰋽 Signature help' },
			a = { '<cmd>lua vim.lsp.buf.code_action()<CR>', ' Code action' },
			d = {
				name = ' Diagnostics',

				h = { '<cmd>lua vim.diagnostic.goto_next()<CR>', ' Next' },
				l = { '<cmd>lua vim.diagnostic.goto_prev()<CR>', ' Previous' },
				c = { '<cmd>lua vim.diagnostic.open_float()<CR>', ' Current' }
			},
			g = {
				name = ' Goto location',

				i = { '<cmd>lua vim.lsp.buf.implementation()<CR>', '󰅩 Implementation' },
				d = { '<cmd>lua vim.lsp.buf.definition()<CR>', ' Definition' },
				t = { '<cmd>lua vim.lsp.buf.type_definition()<CR>', '󰆦 Type definition' },
				r = { '<cmd>lua vim.lsp.buf.references()', '  References' }
			}
		},

		e = { '<cmd>NvimTreeToggle<CR>', '󰙅 Toggle file tree' },
		f = { '<cmd>Telescope find_files<CR>', '󰱼 Find file' },
		b = { '<cmd>Telescope buffers<CR>', '󱎸 Find buffer' },

		k = { '<cmd>BufferNext<CR>', ' Next tab' },
		j = { '<cmd>BufferPrevious<CR>', ' Previous tab' },

		t = {	'<cmd>ToggleTerm direction=horizontal<CR>', ' Toggle terminal' }
	}, { prefix = '<leader>' })
end

return { setup = setup }
