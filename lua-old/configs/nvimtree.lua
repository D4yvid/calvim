local setup = function ()
  local nvimtree = require 'nvim-tree'

  nvimtree.setup {
    view = {
      width = 30
    },

    renderer = {
      group_empty = true
    },

    filters = {
      dotfiles = true,
      git_ignored = true
    }
  }
end

return { setup = setup }
