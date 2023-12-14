local setup = function ()
	local nvimtree = require 'nvim-tree'

	local icons = {
		web_devicons = {
			file = {
				enable = calvim.settings.plugins.enable_icons,
				color = true,
			},
			folder = {
				enable = calvim.settings.plugins.enable_icons,
				color = true,
			},
		},
		git_placement = "before",
		modified_placement = "after",
		diagnostics_placement = "signcolumn",
		bookmarks_placement = "signcolumn",
		padding = " ",
		symlink_arrow = calvim.settings.plugins.enable_icons and " ➛ " or "->",
		show = {
			file = calvim.settings.plugins.enable_icons,
			folder = calvim.settings.plugins.enable_icons,
			folder_arrow = calvim.settings.plugins.enable_icons,
			git = false,
			modified = false,
			diagnostics = calvim.settings.plugins.enable_icons,
			bookmarks = false
		},
		glyphs = {
			default  = calvim.settings.plugins.enable_icons and "" or 'F',
			symlink  = calvim.settings.plugins.enable_icons and "" or 'S',
			bookmark = calvim.settings.plugins.enable_icons and "󰆤" or 'B',
			modified = calvim.settings.plugins.enable_icons and "●" or 'M',
			folder = {
				arrow_closed = calvim.settings.plugins.enable_icons and "" or '>',
				arrow_open = calvim.settings.plugins.enable_icons and "" or 'V',
				default = calvim.settings.plugins.enable_icons and "" or 'D',
				open = calvim.settings.plugins.enable_icons and "" or 'd',
				empty = calvim.settings.plugins.enable_icons and "" or 'ed',
				empty_open = calvim.settings.plugins.enable_icons and "" or 'od',
				symlink = calvim.settings.plugins.enable_icons and "" or 'DS',
				symlink_open = calvim.settings.plugins.enable_icons and "" or 'dS',
			},
			git = {
				unstaged = calvim.settings.plugins.enable_icons and "✗" or 'X',
				staged = calvim.settings.plugins.enable_icons and "✓" or 'Y',
				unmerged = calvim.settings.plugins.enable_icons and "" or 'U',
				renamed = calvim.settings.plugins.enable_icons and "➜" or 'R',
				untracked = calvim.settings.plugins.enable_icons and "★" or 'T',
				deleted = calvim.settings.plugins.enable_icons and "" or 'r',
				ignored = calvim.settings.plugins.enable_icons and "◌" or 'i',
			},
		},
	}

	local settings = calvim.settings.plugins.file_tree or {}
	local defaults = {
		renderer = {
			group_empty = true,
			icons = icons,
		},

		filters = {
			dotfiles = true,
			git_ignored = true
		},

		view = {
			side = 'right',
		}
	}

	local opts = vim.tbl_deep_extend('force', defaults, settings)

	nvimtree.setup(opts)
end

return { setup = setup }
