return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  opts = {
    menu = {
      width = vim.api.nvim_win_get_width(0) - 4,
    },
    settings = {
      save_on_toggle = true,
    },
  },
  config = function(_, opts)
    local harpoon = require("harpoon")
    local seen = {}
    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function(event)
        local bufnr = event.buf
        if
          seen[bufnr]
          or not vim.api.nvim_buf_is_valid(bufnr)
          or not vim.bo[bufnr].buflisted
          or vim.bo[bufnr].buftype ~= ""
          or vim.bo[bufnr].filetype == "dashboard"
          or vim.api.nvim_buf_get_name(bufnr) == ""
        then
          return
        end
        seen[bufnr] = true
        local list = harpoon:list()

        -- Remove any empty/invalid entries that snuck in
        local items = list.items
        for i = #items, 1, -1 do
          local val = items[i] and items[i].value
          if not val or val == "" then
            list:remove(items[i])
          end
        end
        if list:length() < 9 then
          list:add()
        end
      end,
    })

    vim.api.nvim_create_autocmd("BufDelete", {
      callback = function(event)
        local bufnr = event.buf
        local bufname = vim.api.nvim_buf_get_name(bufnr)

        local list = harpoon:list()

        -- Clean up empty entries
        local clean = {}
        for _, item in ipairs(list.items) do
          if item and item.value and item.value ~= "" then
            table.insert(clean, item)
          end
        end
        list.items = clean

        -- Remove the deleted buffer by normalizing paths
        if bufname ~= "" then
          local rel = vim.fn.fnamemodify(bufname, ":~:.")
          local clean2 = {}
          for _, item in ipairs(list.items) do
            if item and item.value ~= bufname and item.value ~= rel then
              table.insert(clean2, item)
            end
          end
          list.items = clean2
        end
        seen[bufnr] = nil
      end,
    })

    vim.api.nvim_create_autocmd("BufAdd", {
      callback = function(event)
        local bufnr = event.buf
        -- Only add real, named, normal buffers
        if
          vim.api.nvim_buf_is_valid(bufnr)
          and vim.bo[bufnr].buflisted
          and vim.bo[bufnr].buftype == ""
          and vim.api.nvim_buf_get_name(bufnr) ~= ""
        then
          local list = harpoon:list()
          if list:length() < 9 then
            list:add()
          end
        end
      end,
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
