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
            return picker:action("open")
          end

          -- get extension (lowercased)
          local ext = path:match("^.+%.(.+)$")
          if ext then
            ext = ext:lower()
          end

          local external = {
            pdf = true,
            webm = true,
            mkv = true,
            vob = true,
            ogv = true,
            ogg = true,
            rrc = true,
            gifv = true,
            mng = true,
            mov = true,
            avi = true,
            qt = true,
            wmv = true,
            yuv = true,
            rm = true,
            asf = true,
            amv = true,
            mp4 = true,
            m4p = true,
            mpg = true,
            mp2 = true,
            mpeg = true,
            mpe = true,
            mpv = true,
            m4v = true,
            svi = true,
            mxf = true,
            roq = true,
            nsv = true,
            flv = true,
            f4v = true,
            f4p = true,
            f4a = true,
            f4b = true,
            mod = true,
            gif = true,
          }

          if ext and external[ext] then
            picker:close()
            vim.ui.open(path)
            return
          end

          return picker:action("open")
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
