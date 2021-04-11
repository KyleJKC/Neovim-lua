local map = vim.api.nvim_set_keymap

vim.g.mapleader = " "
vim.fn.nvim_set_keymap("n", " ", "", {noremap = true})
vim.fn.nvim_set_keymap("x", " ", "", {noremap = true})
map('', 'w', 'k', { noremap = true})
map('', 's', 'j', { noremap = true})
map('', 'a', 'h', { noremap = true})
map('', 'd', 'l', { noremap = true})
map('', '5w', '5k', { noremap = true})
map('', '5s', '5j', { noremap = true})
map('', '5a', '5h', { noremap = true})
map('', '5d', '5l', { noremap = true})
map('', 'e', 'i', { noremap = true})
map('', '<C-s>', ':w<CR>', {noremap = true})
map('', '<C-q>', ':q<CR>', {noremap = true})
map('', '<F1>', ':PackerCompile<CR>:PackerInstall<CR>', {noremap = true})
