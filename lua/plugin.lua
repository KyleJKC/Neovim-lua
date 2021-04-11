local packer = nil
local function init()
  local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.api.nvim_command("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  end
  if packer == nil then
    packer = require("packer")
    packer.init(
      {
        git = {
--          cmd = 'fgit',
          clone_timeout = nil
        },
        disable_commands = true
      }
    )
  end
  local use = packer.use
  packer.reset()
-- =======
-- 插件列表
-- =======  
  use {"wbthomason/packer.nvim", opt = true}
  
  use {
    "Akin909/nvim-bufferline.lua",
     requires = 'kyazdani42/nvim-web-devicons',
     config = function() require'plugin-settings.nvim-bufferline' end
   }
   
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
     event = 'BufRead *',
     config = function() require'plugin-settings.nvim-lspconfig' end
   }

   use {
     "glepnir/lspsaga.nvim",
     cmd = 'Lspsaga',
   }
  
end

local plugin =
  setmetatable(
  {},
  {
    __index = function(_, key)
      init()
      return packer[key]
    end
  }
)

return plugin
