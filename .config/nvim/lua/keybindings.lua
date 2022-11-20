vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- nvimTree
local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true }

map('n', '<C-b>', ':NvimTreeToggle<CR>', opt)
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
map("n", "sc", "<C-w>c", opt)

-- SymbolsOutline
map('n', '<F12>', ':SymbolsOutline<CR>', opt)

map('n', '<A-Up>', ':m-2<CR>', opt)
map('n', '<A-Down>', ':m+1<CR>', opt)
-- map('v', '<A-Up>', ':m-2<CR>gv', opt)
-- map('v', '<A-Down>', ':m+1<CR>v', opt)
map('n', '<A-Left>', ':bp<CR>', opt)
map('n', '<A-Right>', ':bn<CR>', opt)

-- Telescope
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
map("n", "<leader>f", ":Telescope find_files<CR>", opt)
map("n", "<leader>g", ":Telescope live_grep<CR>", opt)

-- bufferline 左右Tab切换
map("n", "<C-h>", ":bp<CR>", opt)
map("n", "<C-l>", ":bn<CR>", opt)
map("n", "<CA-w>", ":Bdelete<CR>", opt)

-- terminal
-- map('n', '<C-`>', ':ToggleTerm direction=float<CR>', opt)

-- 排版
map('n', '<A-S-f>', 'gg=G', opt)

-- 連續縮排
map('v', '<', '<gv', opt)
map('v', '>', '>gv', opt)

local pluginKeys = {}

-- lsp 回调函数快捷键设置
pluginKeys.maplsp = function(mapbuf)
    -- rename
    mapbuf('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opt)
    -- code action
    mapbuf('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opt)
    -- go xx
    mapbuf('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
    mapbuf('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opt)
    mapbuf('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opt)
    mapbuf('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opt)
    mapbuf('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opt)
    -- diagnostic
    mapbuf('n', 'go', '<cmd>lua vim.diagnostic.open_float()<CR>', opt)
    mapbuf('n', 'gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opt)
    mapbuf('n', 'gn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opt)
    -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
    -- leader + =
    mapbuf('n', '<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>', opt)
    -- mapbuf('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opt)
    -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
    -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
    -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
    -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)
    return {
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping(function (fallback)
            -- 下一个
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, {'i', 's'}),
        -- 上一个
        ['<S-Tab>'] = cmp.mapping(function (fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, {'i', 's'}),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-j>'] = cmp.mapping.select_next_item(),
        -- 出现补全
        ['<A-/>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    }
end

return pluginKeys

