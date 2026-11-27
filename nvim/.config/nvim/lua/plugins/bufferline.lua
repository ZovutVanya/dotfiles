return {
  "akinsho/bufferline.nvim",
  opts = {
    options = {
      indicator = {
        style = "underline",
      },
      numbers = "ordinal",
      sort_by = function(buf_a, buf_b)
        local ok, harpoon = pcall(require, "harpoon")
        if not ok then
          return buf_a.id < buf_b.id
        end
        local list = harpoon:list()
        local root = list.config.get_root_dir()

        local function harpoon_index(buf)
          local abs = vim.fs.normalize(buf.path)
          for i = 1, list._length do
            local item = list.items[i]
            if item and item.value and item.value ~= "" then
              local item_abs = item.value:sub(1, 1) == "/"
                  and vim.fs.normalize(item.value)
                or vim.fs.normalize(root .. "/" .. item.value)
              if item_abs == abs then
                return i
              end
            end
          end
          return math.huge
        end

        local idx_a = harpoon_index(buf_a)
        local idx_b = harpoon_index(buf_b)
        if idx_a ~= idx_b then
          return idx_a < idx_b
        end
        return buf_a.id < buf_b.id
      end,
    },
  },
}
