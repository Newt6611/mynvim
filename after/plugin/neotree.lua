require("neo-tree").setup({
    close_if_last_window = true,
    window = {
        position = "left",
        width = 80,
    },
    filesystem = {
        filtered_items = {
            visible = true, -- Show all hidden file
        }
    },
    event_handlers = {
        {
            -- disable auto start neotree when file opened
            event = "file_opened",
            handler = function(_)
                require("neo-tree.command").execute({ action = "close" })
            end
        },
    }
})

vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>", { silent=true })
