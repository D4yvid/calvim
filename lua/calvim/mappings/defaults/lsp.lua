return {
	n = {
		['<leader>'] = {
			l = {
				name = ' LSP (Language Server Protocol)',

				f = { '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', '󰦨 Format' },
				r = { '<cmd>lua vim.lsp.buf.rename()<CR>', '󰏫 Rename' },
				s = { '<cmd>lua vim.lsp.buf.signature_help()<CR>', '󰋽 Signature help' },
				a = { '<cmd>lua vim.lsp.buf.code_action()<CR>', ' Code action' },

				d = {
					name = ' Diagnostics',

					h = { '<cmd>lua vim.diagnostic.goto_next()<CR>', ' Next' },
					l = { '<cmd>lua vim.diagnostic.goto_prev()<CR>', ' Previous' },
					c = { '<cmd>lua vim.diagnostic.open_float()<CR>', ' Current' }
				},
			},
		},

		K = { '<cmd>lua vim.lsp.buf.hover()<CR>', '󱁯 Hover' },

		g = {
			name = ' Goto location',

			i = { '<cmd>lua vim.lsp.buf.implementation()<CR>', '󰅩 Implementation' },
			d = { '<cmd>lua vim.lsp.buf.definition()<CR>', ' Definition' },
			t = { '<cmd>lua vim.lsp.buf.type_definition()<CR>', '󰆦 Type definition' },
			r = { '<cmd>lua vim.lsp.buf.references()<CR>', '  References' }
		}
	}
}
