return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      sh = { "shfmt" },
      zsh = { "shfmt" },
      python = {
        -- to organize imports
        -- "ruff_organize_imports",
        "usort",
        -- To fix auto-fixable lint errors.
        "ruff_fix",
        -- To run the Ruff formatter.
        "ruff_format",
      },
      sql = { "sqlfmt" },
      c = { "clang-format" },
      cpp = { "clang-format" },
    },
  },
}
