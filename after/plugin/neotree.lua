require("neo-tree").setup({
    close_if_last_window = true,
    window = {
        position = "right",
        width = 80,
    }
})

vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>", { silent=true })
