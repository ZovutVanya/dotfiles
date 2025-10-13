local is_enabled = true
local os_name = vim.loop.os_uname().sysname

if os_name == "Linux" then
  is_enabled = false
end
-- requires input-sourse-switch
return {
  "ivanesmantovich/xkbswitch.nvim",
  enabled = is_enabled,
  config = function()
    require("xkbswitch").setup({})
  end,
}
