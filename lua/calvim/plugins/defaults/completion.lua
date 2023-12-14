local setup = function ()
	local cmp = require 'cmp'
	local snippy = require 'snippy'

	local settings = calvim.settings.plugins.cmp or {}
	local user_kinds = settings.cmp_kinds or {}
	local cmp_kinds = {
		Text					 = calvim.settings.plugins.enable_icons and ' ' or 'Text',
		Method				 = calvim.settings.plugins.enable_icons and ' ' or 'Method',
		Function			 = calvim.settings.plugins.enable_icons and ' ' or 'Function',
		Constructor		 = calvim.settings.plugins.enable_icons and ' ' or 'Constructor',
		Field					 = calvim.settings.plugins.enable_icons and ' ' or 'Field',
		Variable			 = calvim.settings.plugins.enable_icons and ' ' or 'Variable',
		Class					 = calvim.settings.plugins.enable_icons and ' ' or 'Class',
		Interface			 = calvim.settings.plugins.enable_icons and ' ' or 'Interface',
		Module				 = calvim.settings.plugins.enable_icons and ' ' or 'Module',
		Property			 = calvim.settings.plugins.enable_icons and ' ' or 'Property',
		Unit					 = calvim.settings.plugins.enable_icons and ' ' or 'Unit',
		Value					 = calvim.settings.plugins.enable_icons and ' ' or 'Value',
		Enum					 = calvim.settings.plugins.enable_icons and ' ' or 'Enum',
		Keyword				 = calvim.settings.plugins.enable_icons and ' ' or 'Keyword',
		Snippet				 = calvim.settings.plugins.enable_icons and ' ' or 'Snippet',
		Color					 = calvim.settings.plugins.enable_icons and ' ' or 'Color',
		File					 = calvim.settings.plugins.enable_icons and ' ' or 'File',
		Reference			 = calvim.settings.plugins.enable_icons and ' ' or 'Reference',
		Folder				 = calvim.settings.plugins.enable_icons and ' ' or 'Folder',
		EnumMember		 = calvim.settings.plugins.enable_icons and ' ' or 'EnumMember',
		Constant			 = calvim.settings.plugins.enable_icons and ' ' or 'Constant',
		Struct				 = calvim.settings.plugins.enable_icons and ' ' or 'Struct',
		Event					 = calvim.settings.plugins.enable_icons and ' ' or 'Event',
		Operator			 = calvim.settings.plugins.enable_icons and ' ' or 'Operator',
		TypeParameter	 = calvim.settings.plugins.enable_icons and ' ' or 'TypeParameter',
		Command				 = calvim.settings.plugins.enable_icons and ' ' or 'Command'
	}

	cmp_kinds = vim.tbl_deep_extend('force', cmp_kinds, user_kinds)

	local defaults = {
		cmdline = {
			mapping = cmp.mapping.preset.cmdline {
				['<Tab>'] = {
					c = function(_)
						if cmp.visible() then
							if #cmp.get_entries() == 1 then
								cmp.confirm({ select = true })
							else
								cmp.select_next_item()
							end
						else
							cmp.complete()
							if #cmp.get_entries() == 1 then
								cmp.confirm({ select = true })
							end
						end
					end
				}
			},

			sources = {
				{ name = 'cmdline' },
				{ name = 'path' }
			}
		},

		search = {
			mapping = cmp.mapping.preset.cmdline(),

			sources = {
				{ name = 'buffer', keyword_length = 3 }
			}
		},

		default = {
			snippet = {
				expand = function(args)
					snippy.expand_snippet(args.body)
				end
			},

			sources = cmp.config.sources {
				{ name = 'nvim_lsp', priority = 10 },
				{ name = 'snippy', priority = 9 },
				{ name = 'buffer', priority = 0, keyword_length = 3 },
			},

			mapping = vim.tbl_deep_extend('force', cmp.mapping.preset.insert(), {
				["<CR>"] = cmp.mapping {
				  i = function(fallback)
						if cmp.visible() and cmp.get_active_entry() then
     		      cmp.confirm { behavior = cmp.ConfirmBehavior.Replace, select = false }
     		    else
     		      fallback()
     		    end
     		  end,
     		  s = cmp.mapping.confirm { select = true },
					c = function (fallback)
						if cmp.visible() and cmp.get_active_entry() then
     		      cmp.confirm { behavior = cmp.ConfirmBehavior.Replace, select = false }
     		    else
     		      fallback()
     		    end
					end
     		},

				['<Tab>'] = cmp.mapping(function(fallback)
					if cmp.visible() and #cmp.get_entries() == 1 then
							cmp.confirm { select = true }
					elseif cmp.visible() then
							cmp.select_next_item()
					elseif snippy.can_expand_or_advance() then
						snippy.expand_or_advance()
					else
						fallback()
					end
				end, { "i", "s" }),

    		["<S-Tab>"] = cmp.mapping(function(fallback)
    		  if cmp.visible() then
    		    cmp.select_prev_item()
    		  elseif snippy.can_jump(-1) then
    		    snippy.previous()
    		  else
    		    fallback()
    		  end
    		end, { "i", "s" })
			}),

			window = {
				completion = {
					col_offset = -3,
					side_padding = 0
				}
			},

			formatting = {
				fields = { 'kind', 'abbr', 'menu' },

				format = function (entry, vim_item)
					vim_item.menu = '  [' .. ({
						nvim_lsp = 'LSP',
						buffer = 'Text',
						cmdline = 'Command',
						snippy = 'Snippet',
						path = 'Path'
					})[entry.source.name] .. ']'
					vim_item.kind = ' ' .. (entry.source.name == 'cmdline' and cmp_kinds['Command'] or cmp_kinds[vim_item.kind])

					return vim_item
				end
			},

			view = {
				docs = {
					auto_open = false
				}
			}
		}
	}

	local opts = vim.tbl_deep_extend('force', defaults, settings)

	cmp.setup(opts.default)

	cmp.setup.cmdline({ ':' }, opts.cmdline or {})
	cmp.setup.cmdline({ '?', '/' }, opts.search or {})
end

return { setup = setup }
