local setup = function ()
	require	'nvim-treesitter.configs'.setup {
		highlight = {
			enable = true,
		
			-- Disable treesitter syntax highlight in files with more than 100kb
			disable = function (lang, buf)
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))

				if ok and stats and stats.size > 100 * 1024 then
					return true
				end
			end
		}
	}
end

return { setup = setup }
