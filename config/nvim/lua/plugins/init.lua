-- Load plugins using lazy.nvim
require("lazy").setup({
   {
  "nvim-tree/nvim-tree.lua",
  config = function()
    require("nvim-tree").setup()
    vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")
  end,
  },

  {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup()
  end,
},

{
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("telescope").setup()
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", builtin.find_files)
    vim.keymap.set("n", "<leader>fg", builtin.live_grep)
  end,
},

{
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = {
        "lua",
        "python",
        "javascript",
        "typescript",
        "c",
        "cpp",
        "json",
        "html",
        "css",
        "bash"
      }, -- add more as needed
      highlight = { enable = true },
      indent = { enable = true },
    }
  end,
},


{
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = true,
},

{
  "numToStr/Comment.nvim",
  config = function()
    require("Comment").setup()
  end,
},

-- LSP & Autocompletion plugins
{
  "neovim/nvim-lspconfig",  -- LSP support
  dependencies = {
    "williamboman/mason.nvim",  -- LSP installer
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/nvim-cmp",  -- Autocompletion plugin
    "hrsh7th/cmp-nvim-lsp",  -- LSP source for nvim-cmp
    "L3MON4D3/LuaSnip", -- Snippets (optional, recommended)
    "saadparwaiz1/cmp_luasnip", -- Snippet source for cmp
  },
},



  {
    "sainnhe/everforest",
    priority = 1000,
    config = function()
      -- Optional: set style options before applying the theme
      vim.g.everforest_background = "hard"       -- Options: 'hard', 'medium', 'soft'
      vim.g.everforest_enable_italic = 1
      vim.g.everforest_transparent_background = 1

      -- Load the theme
      vim.cmd("colorscheme everforest")
    end,
  },
})

-- Mason Setup
require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = { "lua_ls", "pyright", "vtsls", "clangd" }, -- install what you need
}

-- LSP Setup
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Enable these if you use them
lspconfig.lua_ls.setup { capabilities = capabilities }
lspconfig.pyright.setup { capabilities = capabilities }
lspconfig.ts_ls.setup { capabilities = capabilities }
lspconfig.clangd.setup { capabilities = capabilities }

-- Autocomplete Setup
local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
  },
})

vim.diagnostic.config({
  virtual_text = true,  -- inline errors
  signs = true,         -- signs in the gutter
  underline = true,     -- underlines for errors
  update_in_insert = false,
  severity_sort = true,
})

-- Optional: backup override in case transparency doesn't apply correctly
vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    vim.cmd [[
      hi Normal guibg=NONE
      hi NormalNC guibg=NONE
      hi EndOfBuffer guibg=NONE
    ]]
  end,
})

