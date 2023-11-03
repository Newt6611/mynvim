local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

    if client.name == "omnisharp" then
        vim.keymap.set("n", "<leader>d", function() require('omnisharp_extended').lsp_definitions() end, opts)
    else
        vim.keymap.set("n", "<leader>d", function() vim.lsp.buf.definition() end, opts)
    end

	vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.implementation() end, opts)

    -- (go to references) use trouble's api makes it better
	-- vim.keymap.set("n", "<leader>r", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<C-m>", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<F2>", function() vim.lsp.buf.rename() end, opts)

	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)


-- mason
require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {
        "omnisharp@v1.39.8"
    },
	handlers = {
		lsp_zero.default_setup,
	},
})

local pid = vim.fn.getpid()
-- lsp setup
-- c#
local omnisharp_bin = "/Users/newt/.local/share/nvim/mason/bin/omnisharp"
local csharp_config = {
    enable_import_completion = true,
    handlers = {
        ["textDocument/definition"] = require('omnisharp_extended').handler,
    },
    cmd = { omnisharp_bin, '--languageserver' , '--hostPID', tostring(pid) },
}
require'lspconfig'.omnisharp.setup(csharp_config)
--

-- cmp
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		-- `Enter` key to confirm completion
		['<CR>'] = cmp.mapping.confirm({select = true}),
		['<TAB>'] = cmp.mapping.confirm({select = true}),

		-- Ctrl+Space to trigger completion menu
		['<C-Space>'] = cmp.mapping.complete(),

		-- Navigate between snippet placeholder
		['<C-f>'] = cmp_action.luasnip_jump_forward(),
		['<C-b>'] = cmp_action.luasnip_jump_backward(),

		-- Scroll up and down in the completion documentation
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
	})
})
