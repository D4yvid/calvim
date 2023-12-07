-- Use system clipbard
vim.opt.clipboard = 'unnamedplus'

-- Enable line number & show sign column
vim.opt.number = true
vim.opt.signcolumn = 'yes'

-- Highlight current line number
vim.opt.cursorline = true

-- Disable the ruler in the status line
vim.opt.ruler = false

-- Remove the "~" at the end of a buffer
vim.opt.fillchars = {
  eob = ' '
}

-- Set tab size to 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- Make the command line invisible
vim.opt.cmdheight = 0

-- Insert tabs correctly in editor, like (cursor: |)
-- {|
--  to
-- {
--   |
vim.opt.smarttab    = true
vim.opt.smartindent = true

-- Indent automatically
vim.opt.autoindent = true

-- Show which-key after 500ms
vim.opt.timeout = true
vim.opt.timeoutlen = 500

-- Disable the '--- INSERT ---' text
vim.opt.showmode = false

-- When scrolling, add this as a safe zone to view other things
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 16

-- Disable line wrapping, scrolloff help to see stuff
vim.opt.wrap = false

-- Enable true colors
vim.opt.termguicolors = true

-- Set key leader to ' '
vim.g.mapleader = ' '

vim.cmd [[ au BufRead,BufWrite,BufWritePre,BufReadPre,BufNew *.yuck set ft=yuck ]]
