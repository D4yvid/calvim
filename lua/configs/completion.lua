local cmp = require 'cmp'
local snippy = require 'snippy'

local cmp_kinds = {
	Text = '  ',
	Method = '  ',
	Function = '  ',
	Constructor = '  ',
	Field = '  ',
	Variable = '  ',
	Class = '  ',
	Interface = '  ',
	Module = '  ',
	Property = '  ',
	Unit = '  ',
	Value = '  ',
	Enum = '  ',
	Keyword = '  ',
	Snippet = '  ',
	Color = '  ',
	File = '  ',
	Reference = '  ',
	Folder = '  ',
	EnumMember = '  ',
	Constant = '  ',
	Struct = '  ',
	Event = '  ',
	Operator = '  ',
	TypeParameter = '  ',
}

local setup = function ()
	cmp.setup {
		performance = {
			max_view_entries = 60
		},

		snippet = {
			expand = function (args)
				snippy.expand_snippet(args.body)
			end
		},

		sources = cmp.config.sources {
			{ name = 'buffer'   },
			{ name = 'snippy'   },
			{ name = 'nvim_lsp' }
		},

		window = {
			completion = vim.tbl_deep_extend("force", cmp.config.window.bordered(), {
				col_offset = -3,
				side_padding = 0
			})
		},

		formatting = {
			fields = { 'kind', 'abbr' },

			format = function (entry, vim_item)
				vim_item.kind = ' ' .. (cmp_kinds[vim_item.kind] or '')

				return vim_item
			end
		},

		mapping = vim.tbl_deep_extend('force', cmp.mapping.preset.insert {
			['<C-Space>'] = cmp.mapping.complete(),
			['<C-e>'] = cmp.mapping.abort(),
			['<CR>'] = cmp.mapping.confirm({ select = true })
		}, {
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
				elseif snippy.can_expand_or_advance() then
					snippy.expand_or_advance()
				else
					fallback()
				end
			end, { "i", "s", "c" }),

			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif snippy.can_jump(-1) then
					snippy.previous()
				else
					fallback()
				end
			end, { "i", "s" })
		})
	}

	cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),

		window = {
			completion = vim.tbl_deep_extend("force", cmp.config.window.bordered(), {
				col_offset = -1,
				side_padding = 1
			})
		},

		formatting = {
			fields = { 'abbr', 'kind' },

			format = function (entry, vim_item)
				vim_item.kind = ' ' .. (cmp_kinds[vim_item.kind] or '') .. vim_item.kind .. ' '

				return vim_item
			end
		},

    sources = cmp.config.sources({
      { name = 'path' },
      { name = 'cmdline' }
    })
  })
end

return { setup = setup }
