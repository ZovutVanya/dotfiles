return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  opts = {
    menu = {
      width = vim.api.nvim_win_get_width(0) - 4,
    },
    settings = {
      save_on_toggle = true,
      sync_on_ui_close = true,
    },
  },
  config = function(_, opts)
    local harpoon = require("harpoon")
    harpoon:setup(opts)

    local max_items = 9
    local excluded_filetypes = {
      dashboard = true,
      snacks_dashboard = true,
      alpha = true,
      starter = true,
    }

    local function to_abs(root, path)
      if path == "" then
        return ""
      end
      if path:sub(1, 1) == "/" then
        return vim.fs.normalize(path)
      end
      return vim.fs.normalize(root .. "/" .. path)
    end

    local function to_rel(root, abs_path)
      local norm_root = vim.fs.normalize(root)
      if abs_path == norm_root then
        return "."
      end
      local prefix = norm_root .. "/"
      if abs_path:sub(1, #prefix) == prefix then
        return abs_path:sub(#prefix + 1)
      end
      return abs_path
    end

    local function is_syncable_buf(bufnr)
      if not vim.api.nvim_buf_is_valid(bufnr) then
        return false
      end
      if not vim.bo[bufnr].buflisted or vim.bo[bufnr].buftype ~= "" then
        return false
      end
      if excluded_filetypes[vim.bo[bufnr].filetype] then
        return false
      end
      return vim.api.nvim_buf_get_name(bufnr) ~= ""
    end

    local function sync_harpoon_with_buffers()
      local list = harpoon:list()
      local root = list.config.get_root_dir()

      local active_bufs = {}
      local active_by_abs = {}
      for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
        if is_syncable_buf(bufnr) then
          local abs = vim.fs.normalize(vim.api.nvim_buf_get_name(bufnr))
          if not active_by_abs[abs] then
            local entry = {
              bufnr = bufnr,
              abs = abs,
              rel = to_rel(root, abs),
            }
            active_by_abs[abs] = entry
            table.insert(active_bufs, entry)
          end
        end
      end

      -- Keep existing Harpoon items that are still open (preserving order & cursor context)
      local new_items = {}
      local seen_abs = {}
      for i = 1, list._length do
        local item = list.items[i]
        if item and item.value and item.value ~= "" then
          local abs = to_abs(root, item.value)
          if active_by_abs[abs] and not seen_abs[abs] then
            table.insert(new_items, item)
            seen_abs[abs] = true
          end
        end
      end

      -- Append any newly opened/restored buffers not yet in Harpoon
      for _, entry in ipairs(active_bufs) do
        if #new_items >= max_items then
          break
        end
        if not seen_abs[entry.abs] then
          table.insert(new_items, list.config.create_list_item(list.config, entry.rel))
          seen_abs[entry.abs] = true
        end
      end

      list.items = new_items
      list._length = #new_items
      pcall(vim.cmd, "redrawtabline")
    end

    local sync_scheduled = false
    local function schedule_sync()
      if sync_scheduled then
        return
      end
      sync_scheduled = true
      vim.schedule(function()
        sync_scheduled = false
        sync_harpoon_with_buffers()
      end)
    end

    local group = vim.api.nvim_create_augroup("HarpoonBufferlineSync", { clear = true })
    vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete", "BufWipeout", "BufEnter", "SessionLoadPost" }, {
      group = group,
      callback = schedule_sync,
    })
    vim.api.nvim_create_autocmd("OptionSet", {
      group = group,
      pattern = "buflisted",
      callback = schedule_sync,
    })
  end,
  keys = function()
    local harpoon = require("harpoon")
    local keys = {
      {
        "<leader>H",
        function()
          harpoon:list():add()
        end,
        desc = "Harpoon File",
      },
      {
        "<leader>h",
        function()
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Harpoon Quick Menu",
      },
    }

    for i = 1, 9 do
      table.insert(keys, {
        "<leader>" .. i,
        function()
          harpoon:list():select(i)
        end,
        desc = "which_key_ignore",
        -- desc = "Harpoon to File " .. i,
      })
    end
    return keys
  end,
}
