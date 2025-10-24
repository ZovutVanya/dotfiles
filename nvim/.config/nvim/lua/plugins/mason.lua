return {
  {
    "mason-org/mason.nvim",
    keys = {
      { "<leader>M", "<cmd>Mason<CR>" },
    },
    opts = {
      ui = {
        border = "rounded",
        icons = {
          package_installed = "Ѵ",
          package_pending = "Ѱ",
          package_uninstalled = "Ѫ",
        },
      },
    },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "basedpyright",
        "bashls",
        "clang-format",
        "clangd",
        "codelldb",
        "cpplint",
        "lua_ls",
        "postgrestools",
        -- "powershell_es",
        "ruff",
        "selene",
        "shellcheck",
        "shfmt",
        -- "sqlfluff",
        "sqlfmt",
        -- "sqls",
        "stylua",
        "tinymist",
        "usort",
        "jq",
        "jsonlint",
      },
    },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      automatic_installation = true,
      handlers = {
        lsprust_analyzer = function() end,
      },
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },
}
