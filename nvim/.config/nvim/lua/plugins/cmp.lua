return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      accept = {
        auto_brackets = {
          enabled = true,
          -- Disable auto-brackets for Racket and Scheme filetypes
          kind_resolution = {
            enabled = true,
            blocked_filetypes = { "racket", "scheme", "powershell" },
          },
          semantic_token_resolution = {
            enabled = true,
            blocked_filetypes = { "racket", "scheme", "powershell" },
          },
        },
      },
      menu = {
        winblend = 0,
        winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
      },
    },
  },
}
