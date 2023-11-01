local setup = function ()
	require("catppuccin").setup({
		flavour = "macchiato",
		term_colors = true,
		integrations = {
			cmp = true,
			gitsigns = true,
			nvimtree = true,
			treesitter = true,
			notify = true,
			mini = {
				enabled = true,
				indentscope_color = "",
			},
		},
	})

	vim.cmd.colorscheme "catppuccin"
end

return { setup = setup }
