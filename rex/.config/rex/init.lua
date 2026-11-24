--# selene: allow(undefined_variable)
---@diagnostic disable: undefined-global

rex.bind("ctrl+h", "pane.focus.left")
rex.bind("ctrl+j", "pane.focus.down")
rex.bind("ctrl+k", "pane.focus.up")
rex.bind("ctrl+l", "pane.focus.right")

rex.bind("ctrl+s>shift+'", "pane.split", { direction = "down" })
rex.bind("ctrl+s>shift+5", "pane.split", { direction = "right" })
rex.bind("ctrl+s>shift+8", "pane.new_floating")

rex.bind("ctrl+s>z", "pane.zoom")
