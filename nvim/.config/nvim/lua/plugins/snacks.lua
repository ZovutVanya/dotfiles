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
      actions = {
        confirm = function(picker, item)
          local path = item._path or item.path or item.value or item.file or item.text or item

          if type(path) ~= "string" then
            return picker:action("jump")
          end

          -- get extension (lowercased)
          local ext = path:match("^.+%.(.+)$")
          if ext then
            ext = ext:lower()
          end

          local external_exts = {
            -- books
            "pdf",
            "epub",
            "fb2",
            "djvu",
            "mobi",
            "azw3",
            -- videos
            "webm",
            "mkv",
            "vob",
            "ogv",
            "ogg",
            "rrc",
            "gifv",
            "mng",
            "mov",
            "avi",
            "qt",
            "wmv",
            "yuv",
            "rm",
            "asf",
            "amv",
            "mp4",
            "m4p",
            "mpg",
            "mp2",
            "mpeg",
            "mpe",
            "mpv",
            "m4v",
            "svi",
            "mxf",
            "roq",
            "nsv",
            "flv",
            "f4v",
            "f4p",
            "f4a",
            "f4b",
            "mod",
            "gif",
          }
          local external = {}
          for _, ext in ipairs(external_exts) do
            external[ext] = true
          end

          if ext and external[ext] then
            picker:close()
            vim.ui.open(path)
            return
          end

          return picker:action("jump")
        end,
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
