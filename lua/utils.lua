local M = {}

function M.is_windows()
  return vim.loop.os_uname().sysname:match('Windows')
end

return M
