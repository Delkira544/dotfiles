local _M = {}

local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local wibox = require("wibox")
local gears = require("gears")

local apps = require("config.apps")
local mod = require("bindings.mod")

_M.awesomemenu = {
	{
		"hotkeys",
		function()
			hotkeys_popup.show_help(nil, awful.screen.focused())
		end,
	},
	{ "manual", apps.manual_cmd },
	{ "edit config", apps.editor_cmd .. " " .. awesome.conffile },
	{ "restart", awesome.restart },
	{
		"quit",
		function()
			awesome.quit()
		end,
	},
}

_M.mainmenu = awful.menu({
	items = {
		{ "awesome", _M.awesomemenu, beautiful.awesome_icon },
		{ "open terminal", apps.terminal },
	},
})

_M.launcher = awful.widget.launcher({
	image = beautiful.awesome_icon,
	menu = _M.mainmenu,
})

_M.keyboardlayout = awful.widget.keyboardlayout()

function _M.create_promptbox()
	return awful.widget.prompt()
end

_M.textclock = wibox.widget({
	{
		format = "%a %d %b, ",
		font = beautiful.font,
		valign = "center",
		align = "center",
		widget = wibox.widget.textclock,
	},
	{
		format = "%R",
		font = beautiful.font_bold,
		halign = "center",
		valign = "center",
		widget = wibox.widget.textclock,
	},
	layout = wibox.layout.fixed.horizontal,
})

function _M.create_layoutbox(s)
	return awful.widget.layoutbox({
		screen = s,
		buttons = {
			awful.button({
				modifiers = {},
				button = 1,
				on_press = function()
					awful.layout.inc(1)
				end,
			}),
			awful.button({
				modifiers = {},
				button = 3,
				on_press = function()
					awful.layout.inc(-1)
				end,
			}),
			awful.button({
				modifiers = {},
				button = 4,
				on_press = function()
					awful.layout.inc(-1)
				end,
			}),
			awful.button({
				modifiers = {},
				button = 5,
				on_press = function()
					awful.layout.inc(1)
				end,
			}),
		},
	})
end

-- Importar
_M.create_taglist = require("widgets/bar/taglist")
_M.create_tasklist = require("widgets/bar/tasklist")

local theme = {}
theme.bg_wibox = "#00000000"
function _M.create_wibox(s)
	local bar = awful.wibar({
		screen = s,
		position = "top",
		type = "dock",
		ontop = false,
		height = dpi(35),
		width = s.geometry.width,
	})

	bar:struts({ left = dpi(0), right = dpi(0), top = bar.height, bottom = dpi(0) })

	bar:setup({
		{
			layout = wibox.layout.stack,
			{
				{
					-- left widgets
					layout = wibox.layout.fixed.horizontal,
					s.layoutbox,

					{
						s.taglist,
						margins = { top = dpi(5), bottom = dpi(5), left = dpi(15), right = dpi(15) },
						layout = wibox.container.margin,
					},
					s.tasklist,
				},
				nil,
				{
					-- right widgets
					layout = wibox.layout.fixed.horizontal,
					{
						margins = { left = dpi(15), right = dpi(15) },
						layout = wibox.container.margin,
						wibox.widget.systray(),
					},
					_M.launcher,
				},
				layout = wibox.layout.align.horizontal,
			},
			-- middle widgets
			{
				_M.textclock,
				haligh = "center",
				valign = "center",
				layout = wibox.container.place,
			},
		},
		forced_height = bar.height,
		margins = { left = dpi(13), right = dpi(13), top = dpi(5), bottom = dpi(5) },
		layout = wibox.container.margin,
	})
	return bar
end

return _M
