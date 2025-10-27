return {
  "gerazov/toggle-bool.nvim",
  config = function()
    require("toggle-bool").setup({
      mapping = "<leader>t",
    })
  end,
  keys = {
    {
      "<leader>t",
      desc = "Toggle boolean",
      mode = { "n", "v" },
    },
  },
}
