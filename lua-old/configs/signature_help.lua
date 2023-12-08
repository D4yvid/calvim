local setup = function ()
  local signature = require 'lsp_signature'

  signature.setup {
    bind = true,
    floating_window = false,
    hint_prefix = ' ',
    always_trigger = false
  }
end

return { setup = setup }
