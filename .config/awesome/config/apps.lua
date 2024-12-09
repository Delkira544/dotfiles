local _M = {
	terminal = os.getenv("TERMINAL") or "kitty",
	editor = os.getenv("EDITOR") or "nvim",
	dMenu = os.getenv("dmenu") or "rofi -show drun",
}

_M.editor_cmd = _M.terminal .. " -e " .. _M.editor
_M.manual_cmd = _M.terminal .. " -e man awesome"
_M.dmenu_cmd = _M.terminal .. "-e rofi -show drun"

return _M
