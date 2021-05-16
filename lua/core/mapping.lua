local bind = require('core.keymapconf')
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
-- vim.api.nvim_set_keymap('n', 'w', 'k', {})
-- default map
local def_map = {
    -- Vim map
    ["n|<C-s>"]      = map_cu('write'):with_noremap(),
    ["n|Y"]          = map_cmd('y$'),
    ["n|<Space>cw"]  = map_cu([[silent! keeppatterns %substitute/\s\+$//e]]):with_noremap():with_silent(),
    ["n|<A-w>"]      = map_cmd('<C-w>h'):with_noremap(),
    ["n|<A-d>"]      = map_cmd('<C-w>l'):with_noremap(),
    ["n|<A-s>"]      = map_cmd('<C-w>j'):with_noremap(),
    ["n|<A-w>"]      = map_cmd('<C-w>k'):with_noremap(),
    ["n|<A-[>"]      = map_cr('vertical resize -5'):with_silent(),
    ["n|<A-]>"]      = map_cr('vertical resize +5'):with_silent(),
    ["n|<C-q>"]      = map_cmd(':q<CR>'),
    ["n|<Leader>ss"] = map_cu('SessionSave'):with_noremap(),
    ["n|<Leader>sl"] = map_cu('SessionLoad'):with_noremap(),
    ["n|w"]          = map_cmd('k'):with_noremap(),
    ["n|s"]          = map_cmd('j'):with_noremap(),
    ["n|a"]          = map_cmd('h'):with_noremap(),
    ["n|d"]          = map_cmd('l'):with_noremap(),
    ["n|e"]          = map_cmd('i'):with_noremap(),
    ["n|c"]          = map_cmd('d'):with_noremap(),

  -- Insert
    ["i|<C-q>"]      = map_cmd('<Esc>:q<CR>'),
  -- Visual
    ["v|w"]          = map_cmd('k'):with_noremap(),
    ["v|s"]          = map_cmd('j'):with_noremap(),
    ["v|a"]          = map_cmd('h'):with_noremap(),
    ["v|d"]          = map_cmd('l'):with_noremap(),

}

bind.nvim_load_mapping(def_map)
