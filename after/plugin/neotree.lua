require("neo-tree").setup({
    close_if_last_window = true,
    window = {
        position = "right",
        width = 80,
    },
    filesystem = {
        filtered_items = {
            visible = true, -- Show all hidden file
        }
    }
})

vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>", { silent=true })
