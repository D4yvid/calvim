local mappings = {
	n = {
		['<leader>'] = {
			e = { '<cmd>NvimTreeToggle<CR>', '󰙅 Toggle file tree' },
			f = { '<cmd>Telescope find_files<CR>', '󰱼 Find file' },
			b = { '<cmd>Telescope buffers<CR>', '󱎸 Find buffer' },

			t = { '<cmd>ToggleTerm direction=horizontal<CR>', ' Toggle terminal' }
		}
	}
}

local has_harpoon, mark = pcall(require, 'harpoon.mark')
local has_harpoon, mark = pcall(require, 'harpoon.ui')

if has_harpoon then
	mappings = vim.tbl_deep_extend('force', mappings, {
		n = {
			['<leader>'] = {
				h = { '<cmd>lua     require "harpoon.ui".nav_file(1)<CR>', '󱝵 Marked file 1' },
				j = { '<cmd>lua     require "harpoon.ui".nav_file(2)<CR>', '󱝵 Marked file 2' },
				k = { '<cmd>lua     require "harpoon.ui".nav_file(3)<CR>', '󱝵 Marked file 3' },
				l = { '<cmd>lua     require "harpoon.ui".nav_file(4)<CR>', '󱝵 Marked file 4' },
				g = { '<cmd>lua     require "harpoon.ui".toggle_quick_menu()<CR>', '󱉮 Show marked files' },
				n = { '<cmd>lua     require "harpoon.ui".nav_prev()<CR>', '󱋝 Goto previous mark' },
				m = { '<cmd>lua     require "harpoon.ui".nav_next()<CR>', '󱋞 Goto next mark' },
				c = { '<cmd>lua require "harpoon.mark".add_file()<CR>', '󰙒 Mark current file' },
			}
		}
	})
end

return mappings
