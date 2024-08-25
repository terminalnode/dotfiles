local vim = vim
local Plug = vim.fn["plug#"]

vim.call('plug#begin')
Plug('tpope/vim-surround')
Plug('tpope/vim-repeat')
Plug('tpope/vim-fugitive')
Plug('terminalnode/vim-zenkaku')
vim.call('plug#end')
