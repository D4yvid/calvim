local lualine = require 'lualine'

local opts = {
  options = {
    icons_enabled = true,
    theme         = 'auto',

    component_separators = { left = '', right = '' },
    section_separators   = { left = '', right = '' },

    globalstatus = true
  },

  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'diagnostics' },
    lualine_c = { 'branch' },

    lualine_x = { 'filetype' },
    lualine_y = { 'location' },
    lualine_z = { }
  },

  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  }
}

return { setup = function () lualine.setup(opts) end }
