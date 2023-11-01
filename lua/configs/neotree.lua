local setup = function ()
	local neotree = require 'neo-tree'

	neotree.setup {
		close_if_last_window = false,
		popup_border_style = "single",
		enable_git_status = true,
		enable_diagnostics = true,
		default_component_configs = {
			container = {
				enable_character_fade = false
			},
			indent = {
				indent_size = 2,
				padding = 1,
				with_markers = true,
				indent_marker = "│",
				last_indent_marker = "└",
				highlight = "NeoTreeIndentMarker",
				with_expanders = nil,
				expander_collapsed = "",
				expander_expanded = "",
				expander_highlight = "NeoTreeExpander",
			},
			icon = {
				folder_closed = "",
				folder_open = "",
				folder_empty = "",
				default = "*",
				highlight = "NeoTreeFileIcon"
			},
			modified = {
				symbol = "*",
				highlight = "NeoTreeModified",
			},

			name = {
				trailing_slash = false,
				use_git_status_colors = true,
				highlight = "NeoTreeFileName",
			},

			git_status = {
				symbols = {
					added     = "",
					modified  = "",
					deleted   = "",
					renamed   = "",
					untracked = "",
					ignored	  = "",
					unstaged  = "",
					staged	  = "",
					conflict  = "",
				}
			},
		},
		window = {
			width = 24
		},
		filesystem = {
			filtered_items = {
				visible = false,
				hide_dotfiles = true,
				hide_gitignored = true,
				hide_hidden = true
			},
			follow_current_file = {
				enabled = false
			},
			group_empty_dirs = false,
			hijack_netrw_behavior = "open_default",
			use_libuv_file_watcher = true
		},
		buffers = {
			follow_current_file = {
				enabled = true
			},
			group_empty_dirs = true,
			show_unloaded = true
		}
	}
end

return { setup = setup }
