local setup = function ()
	local noice = require 'noice'

	local icons = {
		cmd_icon = calvim.settings.plugins.enable_icons and '' or 'Command:',
		search_down = calvim.settings.plugins.enable_icons and ' ' or 'Search Down:',
		search_up = calvim.settings.plugins.enable_icons and ' ' or 'Search Up:',
		lua_icon = calvim.settings.plugins.enable_icons and '' or 'Lua:',
		help = calvim.settings.plugins.enable_icons and '' or 'Help:'
	}
	local settings = calvim.settings.plugins.noice or {}
	local defaults = {
		cmdline = {
			enabled = true,
			view = "cmdline",
			format = {
				cmdline = { pattern = "^:", icon = icons.cmd_icon, lang = "vim" },
				search_down = { kind = "search", pattern = "^/", icon = icons.search_down, lang = "regex" },
				search_up = { kind = "search", pattern = "^%?", icon = icons.search_up, lang = "regex" },
				filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
				lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = icons.lua_icon, lang = "lua" },
				help = { pattern = "^:%s*he?l?p?%s+", icon = icons.help },
				input = {}
			},
		},
		messages = {
			enabled = true,
			view = "mini",
			view_error = "mini",
			view_warn = "mini",
			view_history = "messages",
			view_search = "virtualtext",
		},
		notify = {
			view = "mini",
		},
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
			signature = {
				-- Using ray-x/lsp_signature.nvim for this
				enabled = false,
			},
			message = {
				enabled = true,
				view = "mini",
			}
		}
	}

	settings = vim.tbl_deep_extend('force', defaults, settings)

	noice.setup(settings)
end

return { setup = setup }
