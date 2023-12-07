local noice = require 'noice'
local opts = {
  cmdline = {
    enabled = true,
    view = 'cmdline'
  },

  lsp = {
    signature = {
      enabled = false
    }
  },

  messages = {
    view = "mini",
    view_error = "mini",
    view_warn = "mini"
  },

  notify = {
    view = "mini"
  }
}

return { setup = function () noice.setup(opts) end }
