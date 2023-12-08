local gitsigns = require 'gitsigns'

local opts = {
  current_line_blame = true,
  signs = {
    add          = { text = '│' },
    change       = { text = '│' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '│' }
  }
}

return { setup = function () gitsigns.setup(opts) end }
