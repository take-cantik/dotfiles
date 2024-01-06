local opts = { noremap = true, silent = true }
local expr_opts = { expr = true, noremap = true, silent = true }
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
keymap("n", "<C-p>", ":Telescope find_files<CR>", opts)
keymap("n", "<C-f>", ":Telescope live_grep<CR>", opts)

-- floaterm.nvim
keymap("n", "<C-t>", ":ToggleTerm<CR>", opts)
keymap("t", "<C-t>", "<C-\\><C-n>:ToggleTerm<CR>", opts)

-- GitDiff
keymap("n", ":GitDi", ":DiffviewOpen", opts)

-- Coc.nvim
keymap("i", "<CR>", "coc#pum#visible() ? coc#pum#confirm() : '<CR>'", expr_opts)
keymap("i", "<C-j>", "coc#pum#visible() ? coc#pum#next() : '<C-j>'", expr_opts)
keymap("i", "<C-k>", "coc#pum#visible() ? coc#pum#prev() : '<C-k>'", expr_opts)

-- LSP
-- keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
-- keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)

-- AnyJump
keymap("n", "gd", "<cmd>AnyJump<CR>", opts)
keymap("n", "gi", "<cmd>AnyJumpBack<CR>", opts)

