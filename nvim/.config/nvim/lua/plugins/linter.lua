return {
  "mfussenegger/nvim-lint",
  event = "LazyFile",
  opts = {
    events = { "BufWritePost", "BufReadPost", "InsertLeave", "BufEnter" },
    linters_by_ft = {
      sh = { "shellcheck" },
      zsh = { "shellcheck", "zsh" },
      python = { "ruff" },
      c = { "cpplint" },
      cpp = { "cpplint" },
      lua = { "selene" },
      text = {},
      markdown = {},
      json = { "jsonlint" },
      -- sql = { "sqlfluff" },
    },
    linters = {
      shellcheck = {
        condition = function(ctx)
          return not ctx.filename:match("%.env")
        end,
      },
    },
  },
  config = function(_, opts)
    local lint = require("lint")

    -- Prepend --shell=bash to shellcheck's args
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "zsh",
      callback = function()
        table.insert(lint.linters.shellcheck.args, 1, "--shell=bash")
      end,
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "c",
      callback = function()
        table.insert(lint.linters.cpplint.args, 1, "--filter=-legal/copyright")
      end,
    })

    lint.linters_by_ft = vim.tbl_extend("force", lint.linters_by_ft, opts.linters_by_ft)

    vim.api.nvim_create_autocmd(opts.events, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
  vim.api.nvim_create_user_command("LintInfo", function()
    local filetype = vim.bo.filetype
    local linters = require("lint").linters_by_ft[filetype]

    if linters then
      print("Linters for " .. filetype .. ": " .. table.concat(linters, ", "))
    else
      print("No linters configured for filetype: " .. filetype)
    end
  end, {}),
}
