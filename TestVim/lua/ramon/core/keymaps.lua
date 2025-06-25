vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>m", "<cmd>Mason<CR>", { desc = "Open [M]ason" })
keymap.set("n", "<leader>l", "<cmd>Lazy<CR>", { desc = "Open [L]azy" })

keymap.set("n", "<leader>pf", ":Ex<CR>", { desc = "Open project file tree" })

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("i", "jj", "<ESC>", { desc = "Exit insert mode with jj" })

keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Going down centralizing screen" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Going up centralizing screen" })

keymap.set("n", "j", "jzz")
keymap.set("n", "k", "kzz")

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment / decrement number
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- windows management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal sized" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

