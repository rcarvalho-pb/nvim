local function map(m, k, v)
    vim.keymap.set(m, k, v, x)
end

local opts = {noremap = true, silent = true}
map('n', '<leader>r', ':luafile %<CR>', opt)
map('n', '<leader>e', ':NvimTreeToggle<CR>', opt)
map('n', '<leader>p', ':PackerSync<CR>', opt)
