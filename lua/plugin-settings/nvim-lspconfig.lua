local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    require'lspconfig'[server].setup{}
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end


-- vim.cmd([[noremap <A-r> :call CompileRunGcc()<CR>
-- func! CompileRunGcc()
--   exec "w"
--   if &filetype == 'c'
--     :AsyncRun g++ % -o %<
--     :AsyncStop
--     :AsyncRun ./%<
--     :copen
--   elseif &filetype == 'cpp'
--     :AsyncRun g++ -std=c++11 % -Wall -o %<
--     :AsyncStop
--     :AsyncRun ./%<
--     :copen
--   elseif &filetype == 'java'
--     exec "!javac %"
--     exec "!time java %<"
--   elseif &filetype == 'sh'
--     :!time bash %
--   elseif &filetype == 'python'
--     set splitbelow
--     :sp
--     :term python3 %
--   elseif &filetype == 'html'
--     silent! exec "!" google-chrome-stable " % &"
--   elseif &filetype == 'markdown'
--     exec "InstantMarkdownPreview"
--   elseif &filetype == 'tex'
--     silent! exec "VimtexStop"
--     silent! exec "VimtexCompile"
--   elseif &filetype == 'dart'
--     exec "CocCommand flutter.run -d ".g:flutter_default_device
--     CocCommand flutter.dev.openDevLog
--   elseif &filetype == 'javascript'
--     set splitbelow
--     :sp
--     :term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
--   elseif &filetype == 'go'
--     set splitbelow
--     :sp
--     :term go run .
--   endif
-- endfunction]])
