local opts = { silent = true, noremap = true }

local map = function (m, k, f) vim.keymap.set(m, k, f, opts) end
local nmap = function (k, f) map('n', k, f) end
local imap = function (k, f) map('i', k, f) end

nmap('<leader>q', '<cmd>Noice dismiss<CR>')
nmap('<leader>w', '<cmd>w<CR>')

local lsp = require 'configs.lsp'

lsp.add_server 'clangd'

