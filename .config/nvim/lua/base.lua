vim.cmd("autocmd!")

vim.scriptencoding = "utf-8"

vim.wo.number = true

-- Open ahi file
vim.api.nvim_create_user_command("Ahi", function(opts)
  vim.cmd("e " .. "~/_/ahi/ahi.markdown")
end, {})

