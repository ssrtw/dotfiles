vim.cmd[[colorscheme nordfox]]
require('plugins')
require('keybindings')

require('nvim-tree').setup()
require('symbols-outline').setup()

require('plugin-config/cmp')
require('plugin-config/startup')
require('plugin-config/indent')
require('plugin-config/bufferline')

require('lsp/setup')
require('lsp/saga')

local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end
opt('o', 'encoding', 'utf-8')
opt('o', 'mouse', 'a')
opt('o', 'number', true)

opt('o', 'tabstop', 4)
opt('o', 'shiftwidth', 4)
opt('o', 'softtabstop', 4)

opt('o', 'smarttab', true)
opt('o', 'expandtab', true)
opt('o', 'autoindent', true)
opt('o', 'smartindent', true)

opt('o', 'ttyfast', true)
opt('o', 'termguicolors', true)


opt('o', 'nobackup', true)
opt('o', 'noswapfile', true)
opt('o', 'nowritebackup', true)
