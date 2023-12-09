_G.IS_WINDOWS = vim.fn.has('win32')
_G.DIR_SEP = IS_WINDOWS and "\\" or "/"
_G.ENV_SEP = IS_WINDOWS and ";" or ":"
_G.VERSION = "0.1.0-1-devel"
_G.CONFIG_DIR = vim.fn.stdpath('config')
_G.USER_DIR = CONFIG_DIR .. '/user'

_G.calvim = require 'calvim'

calvim.user:load()
