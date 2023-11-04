-- diffview
require("diffview").setup({})

vim.keymap.set("n", "<leader>do", ":DiffviewOpen<CR>", { silent=true })
vim.keymap.set("n", "<leader>dc", ":DiffviewClose<CR>", { silent=true })
