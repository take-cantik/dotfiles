local opts = { noremap = true, silent = true }
local expr_opts = { expr = true, noremap = true, silent = true, replace_keycodes = false }
local term_opts = { silent = true }

--local keymap = vim.keymap
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- New tab
keymap("n", "te", ":tabedit", opts)
-- 新しいタブを一番右に作る
keymap("n", "gn", ":tabnew<Return>", opts)
-- move tab
keymap("n", "gh", "gT", opts)
keymap("n", "gl", "gt", opts)

-- Split window
keymap("n", "ss", ":split<Return><C-w>w", opts)
keymap("n", "sv", ":vsplit<Return><C-w>w", opts)

-- Select all
keymap("n", "<C-a>", "gg<S-v>G", opts)

-- Do not yank with x
keymap("n", "x", "_x", opts)

-- 行の端に行く
keymap("n", "<Space>h", "^", opts)
keymap("n", "<Space>l", "$", opts)

-- ;でコマンド入力( ;と:を入れ替)
keymap("n", ";", ":", opts)

-- 行末までのヤンクにする
keymap("n", "Y", "y$", opts)

-- <Space>q で強制終了
keymap("n", "<Space>q", ":<C-u>q!<Return>", opts)

-- ESC*2 でハイライトやめる
keymap("n", "<Esc><Esc>", ":<C-u>set nohlsearch<Return>", opts)

-- jj でESC を行う
keymap("i", "jj", "<Esc>", opts)

-- コンマの後に自動的にスペースを挿入
keymap("i", ",", ",<Space>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- ビジュアルモード時vで行末まで選択
keymap("v", "v", "$h", opts)

-- Terminal --
keymap("t", "<Esc>", "<C-\\><C-n>", opts)

-- LSP
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
keymap("n", "gf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
keymap("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
keymap("n", "gn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
keymap("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
keymap("n", "ge", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
keymap("n", "g]", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
keymap("n", "g[", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)

-- Fern.nvimの設定
keymap("n", "<C-b>", ":Fern . -reveal=% -drawer -toggle -width=40<CR>", opts)

-- Barbar.nvimの設定

-- Move to previous/next
keymap("n", "<Space>,", ":BufferPrevious<CR>", opts)
keymap("n", "<Space>.", ":BufferNext<CR>", opts)

-- Re-order to previous/next
keymap("n", "<Space><", ":BufferMovePrevious<CR>", opts)
keymap("n", "<Space>>", ":BufferMoveNext<CR>", opts)

-- Goto buffer in position...
keymap("n", "<Space>1", ":BufferGoto 1<CR>", opts)
keymap("n", "<Space>2", ":BufferGoto 2<CR>", opts)
keymap("n", "<Space>3", ":BufferGoto 3<CR>", opts)
keymap("n", "<Space>4", ":BufferGoto 4<CR>", opts)
keymap("n", "<Space>5", ":BufferGoto 5<CR>", opts)
keymap("n", "<Space>6", ":BufferGoto 6<CR>", opts)
keymap("n", "<Space>7", ":BufferGoto 7<CR>", opts)
keymap("n", "<Space>8", ":BufferGoto 8<CR>", opts)
keymap("n", "<Space>9", ":BufferGoto 9<CR>", opts)
keymap("n", "<Space>0", ":BufferLast<CR>", opts)

-- Pin/unpin buffer
keymap("n", "<Space>p", ":BufferPin<CR>", opts)

-- Close buffer
keymap("n", "<Space>c", ":BufferClose<CR>", opts)

-- telescope.nvim
keymap("n", "<C-p>", ":Telescope find_files hidden=true<CR>", opts)
keymap("n", "<C-f>", ":Telescope live_grep<CR>", opts)

-- floaterm.nvim
keymap("n", "<C-t>", ":ToggleTerm<CR>", opts)
keymap("t", "<C-t>", "<C-\\><C-n>:ToggleTerm<CR>", opts)

-- Coc.nvim
-- Autocomplete
-- function _G.check_back_space()
--     local col = vim.fn.col('.') - 1
--     return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
-- end

-- keymap("i", "<CR>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], expr_opts)
-- keymap("i", "<TAB>", "coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? '<TAB>' : coc#refresh()", expr_opts)
-- keymap("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], expr_opts)

-- AnyJump
-- keymap("n", "gd", "<cmd>AnyJump<CR>", opts)
-- keymap("n", "gi", "<cmd>AnyJumpBack<CR>", opts)

-- -- completion brackets
-- function InsertParentheses(start_word, end_word)
--   -- カーソル位置の次の文字を取得
--   local current_line = vim.fn.getline('.')
--   local next_column = vim.fn.col('.') + 1
--
--   local next_char = current_line:sub(next_column, next_column)
--
--   -- カーソル位置の次が存在しない、または記号の時のみどちらも挿入する
--   -- if next_char == "" or string.match("[({'\"$ ", next_char) then
--   if next_char == "" then
--       -- return string.format("%s%s<Left>", start_word, end_word)
--       return "ahi"
--   else
--       return string.format("%s", start_word)
--   end
-- end
--
-- keymap("i", "ahi", InsertParentheses("", ""), opts)
--
-- -- keymap("i", "'", InsertParentheses("'", "'"), opts)
-- -- keymap("i", '"', InsertParentheses('"', '"'), opts)
-- -- keymap("i", "`", InsertParentheses("`", "`"), opts)
-- -- keymap("i", "[", InsertParentheses("[", "]"), opts)
-- -- keymap("i", "{", InsertParentheses("{", "}"), opts)
-- -- keymap("i", "(", InsertParentheses("(", ")"), opts)
-- -- keymap("i", "<", InsertParenthesses("'", "'"), opts)
--
-- keymap("i", "[", "[]<LEFT>", opts)
-- keymap("i", "{", "{}<LEFT>", opts)
-- keymap("i", "(", "()<LEFT>", opts)
-- keymap("i", "<", "<><LEFT>", opts)
--
-- keymap("i", "[<CR>", "[]<LEFT><CR><Esc><S-o>", opts)
-- keymap("i", "{<CR>", "{}<LEFT><CR><Esc><S-o>", opts)
-- keymap("i", "(<CR>", "()<LEFT><CR><Esc><S-o>", opts)
--
-- -- completion quote
-- keymap("i", '"', '""<LEFT>', opts)
-- keymap("i", "'", "''<LEFT>", opts)
-- keymap("i", "`", "``<LEFT>", opts)
