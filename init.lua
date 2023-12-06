local utils = require 'utils'

_G.DIR_SEP = utils.is_windows() and "\\" or "/"

if vim.g.neovide then
  require 'configs.neovide'
end

require 'configs.editor'
require 'user'
require 'plugins'
