return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },
    keys = {
      { "gd", vim.lsp.buf.definition, desc = "Go to definition" },
    },
    opts = {
      diagnostics = {
        virtual_text = false,
      },
      servers = {

        lua_ls = {
          settings = {
            Lua = {
              workspace = { checkThirdParty = false, library = vim.api.nvim_get_runtime_file("", true) },
              telemetry = { enable = false },
              diagnostics = {
                globals = { "vim" },
              },
            },
          },
        },

        racket_langserver = { filetypes = { "racket" } },

        basedpyright = {
          settings = {
            basedpyright = {
              analysis = {
                typeCheckingMode = "standard",
                inlayHints = {
                  callArgumentNames = true,
                  variableTypes = true,
                  functionReturnTypes = true,
                },
              },
            },
          },
        },

        clangd = {},

        -- powershell_es = {
        --   bundle_path = "C:\\Users\\Ivan\\AppData\\Local\\nvim-data\\mason\\packages\\powershell-editor-services",
        --   init_options = {
        --     enableProfileLoading = false,
        --   },
        -- },

        bashls = {
          filetypes = { "sh", "zsh", "bash" },
          settings = {
            {
              bashIde = {
                globPattern = "*@(.sh|.inc|.bash|.command|.zsh)",
              },
            },
          },
          on_attach = function(client, bufnr)
            local fname = vim.api.nvim_buf_get_name(bufnr)
            if fname:match("/%.env") or fname:match("%.env$") then
              vim.schedule(function()
                vim.lsp.stop_client(client.id)
              end)
            end
          end,
        },

        tinymist = {
          formatterMode = "typstyle",
          exportPdf = "onType",
          semanticTokens = "disable",
        },

        postgres_lsp = {},
      },
    },
  },
}
