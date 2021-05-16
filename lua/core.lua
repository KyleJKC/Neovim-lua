local options = require "core.options"
local load_core = function()
  vim.cmd [[command! PackerInstall packadd packer.nvim | lua require('plugin').install()]]
  vim.cmd [[command! PackerUpdate packadd packer.nvim | lua require('plugin').update()]]
  vim.cmd [[command! PackerSync packadd packer.nvim | lua require('plugin').sync()]]
  vim.cmd [[command! PackerClean packadd packer.nvim | lua require('plugin').clean()]]
  vim.cmd [[command! PackerCompile packadd packer.nvim | lua require('plugin').compile()]]
  
  options:load_options()
  
  require("zephyr")
  require("core.mapping")
  require("plugin")
end

load_core()
