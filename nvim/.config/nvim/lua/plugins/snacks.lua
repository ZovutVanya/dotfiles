return {
  "folke/snacks.nvim",
  keys = {
    { "<leader>\\", ":lua Snacks.dashboard()<CR>" },
  },
  opts = {
    styles = {
      lazygit = {
        -- add border by specifying border style
        border = "rounded", -- other options: "single", "double", "solid", etc
        title = " la💤ygit",
        width = 0.9,
        height = 0.9,
      },
    },
    picker = {
      sources = {
        explorer = {
          layout = { layout = { position = "right" } },
        },
      },
    },
    dashboard = {
      preset = {
        header = [[
                                                                    
      ████ ██████           █████      ██                     
     ███████████             █████                             
     █████████ ███████████████████ ███   ███████████   
    █████████  ███    █████████████ █████ ██████████████   
   █████████ ██████████ █████████ █████ █████ ████ █████   
 ███████████ ███    ███ █████████ █████ █████ ████ █████  
██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
      },
      sections = {
        { section = "header" },
        { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
        { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        { section = "startup" },
      },
    },
  },
}
