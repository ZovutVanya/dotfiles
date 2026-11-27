--# selene: allow(undefined_variable)
---@diagnostic disable: undefined-global

-- rex.bind("ctrl+h", "pane.focus.left")
-- rex.bind("ctrl+j", "pane.focus.down")
-- rex.bind("ctrl+k", "pane.focus.up")
-- rex.bind("ctrl+l", "pane.focus.right")

rex.bind("ctrl+s>shift+'", "pane.split", { direction = "down" })
rex.bind("ctrl+s>shift+5", "pane.split", { direction = "right" })
rex.bind("ctrl+s>shift+8", "pane.new_floating")

rex.bind("ctrl+s>z", "pane.zoom")

local terminal = "com.superlogical.terminal"

local function pane_handles(letter)
	local result, err = rex.block.call(terminal, "title", {})
	if not result then
		error(err, 0)
	end
	-- a stale title from a program that has exited must not hijack the keys
	if result.owner == nil or (result.owner.name ~= "nvim" and result.owner.name ~= "ssh") then
		return false
	end
	local letters = result.title:match("^nvim%[([hjkl]*)%]")
	return letters ~= nil and letters:find(letter, 1, true) ~= nil
end

for key, direction in pairs({ h = "left", j = "down", k = "up", l = "right" }) do
	rex.bind("ctrl+" .. key, function()
		if pane_handles(key) then
			return false
		end
		local _, err = rex.session.focus_direction({ direction = direction })
		if err then
			error(err, 0)
		end
		return true
	end)
end
