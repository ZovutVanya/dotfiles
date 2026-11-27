return {
  "christoomey/vim-tmux-navigator",
  dependencies = {
    { "fdarian/rex-navigator", opts = { mappings = false } },
  },
  init = function()
    vim.g.tmux_navigator_no_mappings = 1
  end,
  config = function()
    local function navigate(tmux_cmd, direction)
      return function()
        if vim.env.TMUX then
          vim.cmd(tmux_cmd)
        else
          require("rex-navigator").navigate(direction)
        end
      end
    end

    vim.keymap.set("n", "<C-h>", navigate("TmuxNavigateLeft", "left"))
    vim.keymap.set("n", "<C-j>", navigate("TmuxNavigateDown", "down"))
    vim.keymap.set("n", "<C-k>", navigate("TmuxNavigateUp", "up"))
    vim.keymap.set("n", "<C-l>", navigate("TmuxNavigateRight", "right"))
  end,
  -- cmd = {
  --   "TmuxNavigateLeft",
  --   "TmuxNavigateDown",
  --   "TmuxNavigateUp",
  --   "TmuxNavigateRight",
  --   "TmuxNavigatePrevious",
  --   "TmuxNavigatorProcessList",
  -- },
  -- keys = {
  --   { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
  --   { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
  --   { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
  --   { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
  --   { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
  -- },
}
