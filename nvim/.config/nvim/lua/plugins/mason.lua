local os_name = vim.loop.os_uname().sysname
local mason_table = {
  "basedpyright",
  "bashls",
  "clang-format",
  "clangd",
  "codelldb",
  "cpplint",
  "lua_ls",
  -- "postgres-language-server",
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
}

if os_name == "Darwin" then
  table.insert(mason_table, "prettypst")
elseif os_name == "Windows" then
  table.insert(mason_table, "powershell_es")
end

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
      ensure_installed = mason_table,
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
