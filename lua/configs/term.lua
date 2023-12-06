local toggleterm = require 'toggleterm'
local opts = {
  size = function (term)
    local small_screen = vim.o.columns <= 72 or vim.o.lines <= 48

    if term.direction == 'horizontal' then
      return small_screen and 8 or vim.o.lines * 0.4
    elseif term.direction == 'vertical' then
      return small_screen and 4 or vim.o.columns * 0.3
    end
  end,

  autochdir = true
}

return { setup = function () toggleterm.setup(opts) end }
