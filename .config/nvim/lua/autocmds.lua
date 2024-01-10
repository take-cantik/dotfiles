local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- Remove whitespace on save
autocmd("BufWritePre", {
	pattern = "*",
	command = ":%s/\\s\\+$//e",
})

-- Don't auto commenting new lines
autocmd("BufEnter", {
	pattern = "*",
	command = "set fo-=c fo-=r fo-=o",
})

-- Restore cursor location when file is opened
autocmd({ "BufReadPost" }, {
	pattern = { "*" },
	callback = function()
		vim.api.nvim_exec('silent! normal! g`"zv', false)
	end,
})

-- LSP
autocmd('LspAttach', {
  group = augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local keymap = vim.api.nvim_buf_set_keymap
    local opts = { noremap = true, silent = true }
    keymap(ev.buf, "n", "gD", "<cmd>lua vim.lsp.buf.declaration<CR>", opts)
    keymap(ev.buf, "n", "gd", "<cmd>lua vim.lsp.buf.definition<CR>", opts)
    keymap(ev.buf, "n", "K", "<cmd>lua vim.lsp.buf.hover<CR>", opts)
    keymap(ev.buf, "n", "gi", "<cmd>lua vim.lsp.buf.implementation<CR>", opts)
    keymap(ev.buf, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help<CR>", opts)
    keymap(ev.buf, "n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder<CR>", opts)
    keymap(ev.buf, "n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder<CR>", opts)
    keymap(ev.buf, "n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
    keymap(ev.buf, "n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition<CR>", opts)
    keymap(ev.buf, "n", "<space>rn", "<cmd>lua vim.lsp.buf.rename<CR>", opts)
    keymap(ev.buf, "n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action<CR>", opts)
    keymap(ev.buf, "v", "<space>ca", "<cmd>lua vim.lsp.buf.code_action<CR>", opts)
    keymap(ev.buf, "n", "gr", "<cmd>lua vim.lsp.buf.references<CR>", opts)
    keymap(ev.buf, "n", "<space>f", "<cmd>lua vim.lsp.buf.format { async = true }<CR>", opts)
  end,
})

