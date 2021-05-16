local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute "packadd packer.nvim"
end

--- Check if a file or directory exists in this path
local function require_plugin(plugin)
    local plugin_prefix = fn.stdpath("data") .. "/site/pack/packer/opt/"

    local plugin_path = plugin_prefix .. plugin .. "/"
    --	print('test '..plugin_path)
    local ok, err, code = os.rename(plugin_path, plugin_path)
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    --	print(ok, err, code)
    if ok then
        vim.cmd("packadd " .. plugin)
    end
    return ok, err, code
end

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

return require("packer").startup(
    function(use)
   use "wbthomason/packer.nvim"

   use {
     "glepnir/dashboard-nvim",
     config = function() require'plugin-settings.dashboard-nvim' end
   }

   use {
     "glepnir/galaxyline.nvim",
     branch = 'main',
     requires = {'kyazdani42/nvim-web-devicons', opt = true},
     config = function() require'plugin-settings.galaxyline' end
   }

   use {
     "nvim-telescope/telescope.nvim",
     requires = {{'nvim-lua/popup.nvim', opt = true}, {'nvim-lua/plenary.nvim', opt = true}, {'nvim-telescope/telescope-fzy-native.nvim', opt = true}},
     cmd = "Telescope",
     config = function() require'plugin-settings.telescope' end
   }

   use {
     "hrsh7th/nvim-compe",
     event = 'InsertEnter *',
     config = function() require'plugin-settings.nvim-compe' end
   }

   use {
     "neovim/nvim-lspconfig",
     event = 'BufReadPre',
     requires = {{'kabouzeid/nvim-lspinstall'},{'onsails/lspkind-nvim'}},
     config = function() require'plugin-settings.nvim-lspconfig' end
   }

   use {
     "hrsh7th/vim-vsnip",
     event = 'InsertCharPre',
     requires = {'rafamadriz/friendly-snippets'}
     -- config = function() require'plugin-settings.vim-vsnip' end
   }

   use {
     "glepnir/lspsaga.nvim",
     cmd = 'Lspsaga',
   }

   use {
     "romgrk/barbar.nvim",
     event = 'BufRead *',
     config = function() require'plugin-settings.barbar' end
   }

   use "glepnir/zephyr-nvim"
end
)
