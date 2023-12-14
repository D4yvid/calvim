return {
	n = {
		['<leader>'] = {
			e = { '<cmd>NvimTreeToggle<CR>', '󰙅 Toggle file tree' },
			f = { '<cmd>Telescope find_files<CR>', '󰱼 Find file' },
			b = { '<cmd>Telescope buffers<CR>', '󱎸 Find buffer' },

			k = { '<cmd>BufferNext<CR>', ' Next tab' },
			j = { '<cmd>BufferPrevious<CR>', ' Previous tab' },

			t = {  '<cmd>ToggleTerm direction=horizontal<CR>', ' Toggle terminal' }
		}
	}
}
