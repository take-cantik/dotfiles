local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here

	use({ "wbthomason/packer.nvim" })

	-- Colorschemes
	use({ "folke/tokyonight.nvim" }) -- Color scheme

	use({ "kyazdani42/nvim-web-devicons" }) -- File icons
	use({ "akinsho/bufferline.nvim" })

	-- cmp plugins
	use({ "hrsh7th/nvim-cmp" }) -- The completion plugin
	use({ "hrsh7th/cmp-vsnip" })
	use({ "hrsh7th/vim-vsnip" })
	use({ "hrsh7th/cmp-buffer" }) -- buffer completions
	use({ "hrsh7th/cmp-path" }) -- path completions
	use({ "hrsh7th/cmp-cmdline" }) -- cmdline completions
	use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-nvim-lua" })
	use({ "onsails/lspkind-nvim" })

  local cmp = require("cmp")
  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    sources = {
      { name = "nvim_lsp" },
      { name = "vsnip" },
      { name = "buffer" },
      { name = "path" },
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ['<C-l>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ["<CR>"] = cmp.mapping.confirm { select = true },
    }),
  })

	-- snippets
	use({ "L3MON4D3/LuaSnip" }) --snippet engine

	-- LSP
	use({ "neovim/nvim-lspconfig" }) -- enable LSP

	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })
  require('mason').setup()
  require('mason-lspconfig').setup_handlers({ function(server)
    local opt = {
      -- Function executed when the LSP server startup
      -- on_attach = function(client, bufnr)
        -- local opts = { noremap=true, silent=true }
        -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        -- vim.cmd 'autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)'
      -- end,
      capabilities = require('cmp_nvim_lsp').update_capabilities(
        vim.lsp.protocol.make_client_capabilities()
      )
    }
    require('lspconfig')[server].setup(opt)
  end })

  -- Only highlight if compatible with the language
  vim.cmd [[
    set updatetime=500
    highlight LspReferenceText  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#ff4499 guibg=#00332a
    highlight LspReferenceRead  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#ff4499 guibg=#00332a
    highlight LspReferenceWrite cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#ff4499 guibg=#00332a
    augroup lsp_document_highlighgtt
      autocmd!
      autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
      autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    augroup END
  ]]

  -- LSP handlers
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
  )


	use({ "jose-elias-alvarez/null-ls.nvim" }) -- for formatters and linters
	use({ "nvimdev/lspsaga.nvim" }) -- LSP UIs

	-- Formatter
	use({ "MunifTanjim/prettier.nvim" })

	-- Telescope
  use({ "nvim-lua/plenary.nvim" })
	use({ "nvim-telescope/telescope.nvim" })

	-- Treesitter
	use({
    "nvim-treesitter/nvim-treesitter",
    { run = ":TSUpdate" }
  })
  require("nvim-treesitter.configs").setup({
    auto_install = true,
    highlight = {
      enable = true,
    },
  })


	use({ "nvim-telescope/telescope-file-browser.nvim" })

	use({ "windwp/nvim-ts-autotag" })

  -- dashboard
  use {
    "nvimdev/dashboard-nvim",
    event = 'VimEnter',
    config = function()
      require("dashboard").setup({
        -- config
      })
    end,
    requires = {"nvim-tree/nvim-web-devicons"}
  }

  -- GitHub Copilot
  use({
    "github/copilot.vim",
    config = function()
      vim.g.copilot_no_tab_map = true

      local keymap = vim.keymap.set
      -- https://github.com/orgs/community/discussions/29817#discussioncomment-4217615
      keymap(
        "i",
        "<Tab>",
        'copilot#Accept("<CR>")',
        { silent = true, expr = true, script = true, replace_keycodes = false }
      )
      keymap("i", "<C-j>", "<Plug>(copilot-next)")
      keymap("i", "<C-k>", "<Plug>(copilot-previous)")
      keymap("i", "<C-o>", "<Plug>(copilot-dismiss)")
      keymap("i", "<C-s>", "<Plug>(copilot-suggest)")
    end,
  })

  -- Coc
  -- use({ "neoclide/coc.nvim", { branch = "release" } })

  -- Fern
  use({
    "lambdalisue/fern.vim",
    config = function()
      vim.g['fern#default_hidden'] = 1
      vim.g['fern#renderer'] = 'nerdfont'
    end
  })

  use({ "lambdalisue/fern-git-status.vim" })
  use({ "lambdalisue/nerdfont.vim" })
  use({ "lambdalisue/fern-renderer-nerdfont.vim" })
  use({ "lambdalisue/glyph-palette.vim" })


  -- barbar
  use({ "romgrk/barbar.nvim" })

  -- float term
  -- use({ "voldikss/vim-floaterm" })

  -- toggleterm
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup{
      size = 20,
    }
  end}

  -- git
  use({ "dinhhuy258/git.nvim" })
  require("git").setup()

  use({ "lewis6991/gitsigns.nvim" })
  require("gitsigns").setup()

  -- lualine
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "nvim-tree/nvim-web-devicons", opt = true }
  })

  require('lualine').setup({
    options = {
      icons_enabled = true,
      theme = 'tokyonight',
      component_separators = { left = '', right = ''},
      section_separators = { left = '', right = ''},
      disabled_filetypes = {},
      always_divide_middle = true,
      globalstatus = false,
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diff', 'diagnostics'},
      lualine_c = {{'filename', path = 1}},
      lualine_x = {'encoding', 'fileformat', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
   },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    extensions = {}
  })

  -- nvim-surround
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
          -- Configuration here, or leave empty to use defaults
      })
    end
  })

  -- vim-visual-multi
  use({ "mg979/vim-visual-multi",  branch = "master" })

  -- Prettier
  use({ "prettier/vim-prettier", run = "yarn install" })

  -- Code Jump
  use({ "pechorin/any-jump.vim" })

  -- Gitmoji
  use({ "take-cantik/vim-gitmoji" })

  -- mini.indent
  use({
    "echasnovski/mini.indentscope",
    config = function()
      require('mini.indentscope').setup()
    end
  })

  -- command line
  use({ "MunifTanjim/nui.nvim" })
  use({ "rcarriga/nvim-notify" })
  use({ "folke/noice.nvim" })
  require("noice").setup({
    cmdline = {
      format = {
        -- search iconの文字化け対策
        search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
        search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
      },
    },
    lsp = {
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    -- you can enable a preset for easier configuration
    presets = {
      bottom_search = false, -- use a classic bottom cmdline for search
      command_palette = false, -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = false, -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = false, -- add a border to hover docs and signature help
    },
  })

  -- Autopairs
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({
        disable_filetype = { "TelescopePrompt" , "vim" },
        { map_cr = true }
      })
    end
  })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
  end
end)

