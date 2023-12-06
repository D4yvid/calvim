local setup = function ()
  local onedark = require 'onedark'

  onedark.setup {
    style = 'darker'
  }

  onedark.load()
end

return { setup = setup }
