local bind = require "core.bind"
local options = setmetatable({}, {__index = {global_local = {}, window_local = {}}})

vim.g.loaded_gzip = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers = 1
 
vim.g.python_host_prog = "/usr/bin/python2"
vim.g.python3_host_prog = "/usr/bin/python3"

vim.g.mapleader = " "

function options:load_options()
  self.global_local = {
    termguicolors = true,
    mouse = "nv",
    errorbells = true,
    visualbell = true,
    hidden = true,
    fileformats = "unix,mac,dos",
    magic = true,
    virtualedit = "block",
    encoding = "utf-8",
    viewoptions = "folds,cursor,curdir,slash,unix",
    sessionoptions = "curdir,help,tabpages,winsize",
    clipboard = "unnamedplus",
    wildignorecase = true,
    wildignore = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**",
    backup = false,
    writebackup = false,
    undofile = true,
    swapfile = false,
    history = 2000,
    shada = "!,'300,<50,@100,s10,h",
    backupskip = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim",
    smarttab = true,
    shiftround = true,
    timeout = true,
    ttimeout = true,
    timeoutlen = 500,
    ttimeoutlen = 10,
    updatetime = 100,
    redrawtime = 1500,
    ignorecase = true,
    smartcase = true,
    infercase = true,
    incsearch = true,
    wrapscan = true,
    complete = ".,w,b,k",
    inccommand = "nosplit",
    grepformat = "%f:%l:%c:%m",
    grepprg = "rg --hidden --vimgrep --smart-case --",
    breakat = [[\ \	;:,!?]],
    startofline = false,
    whichwrap = "h,l,<,>,[,],~",
    splitbelow = true,
    splitright = true,
    switchbuf = "useopen",
    backspace = "indent,eol,start",
    diffopt = "filler,iwhite,internal,algorithm:patience",
    -- completeopt = "menu,menuone,noselect,noinsert",
    completeopt = "menu,menuone,noselect",
    jumpoptions = "stack",
    showmode = false,
    shortmess = "aoOTIcF",
    scrolloff = 2,
    sidescrolloff = 5,
    foldlevelstart = 99,
    ruler = false,
--    list = true,
    winwidth = 30,
    winminwidth = 10,
    pumheight = 15,
    helpheight = 12,
    previewheight = 12,
    showcmd = false,
    cmdheight = 2,
    cmdwinheight = 5,
    equalalways = false,
    laststatus = 2,
    display = "lastline",
    showbreak = "↳  ",
    listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←",
    pumblend = 10,
    winblend = 10,
    -- spell = true,
    -- spelllang = "en_us,cjk"
  }

  self.bw_local = {
    cursorline = true,
    synmaxcol = 2500,
    formatoptions = "1jcroql",
    textwidth = 80,
    expandtab = true,
    autoindent = true,
    tabstop = 2,
    shiftwidth = 2,
    softtabstop = -1,
    breakindentopt = "shift:2,min:20",
    wrap = false,
    linebreak = true,
    relativenumber = true,
    number = true,
--    colorcolumn = "80",
    foldenable = true,
    conceallevel = 2,
    concealcursor = "niv"
  }

  for name, value in pairs(self.global_local) do
    vim.o[name] = value
  end
  bind.bind_option(self.bw_local)
end

return options
