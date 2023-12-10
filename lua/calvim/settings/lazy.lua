return {
	root = vim.fn.stdpath('data') .. '/calvim',

	defaults = {
		lazy = true,
	},

	concurrency = IS_WINDOWS and vim.loop.available_parallelism() * 2 or nil,

	install = {
		missing = true,

		colorscheme = { calvim.settings.colorscheme, 'habamax', 'default' }
	}
}
