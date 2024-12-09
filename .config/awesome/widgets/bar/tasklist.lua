local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local gears = require("gears")

local buttons = {
	awful.button({
		modifiers = {},
		button = 1,
		on_press = function(c)
			c:activate({ context = "tasklist", action = "toggle_minimization" })
		end,
	}),
	awful.button({
		modifiers = {},
		button = 3,
		on_press = function()
			awful.menu.client_list({ theme = { width = 250 } })
		end,
	}),
	awful.button({
		modifiers = {},
		button = 4,
		on_press = function()
			awful.client.focus.byidx(-1)
		end,
	}),
	awful.button({
		modifiers = {},
		button = 5,
		on_press = function()
			awful.client.focus.byidx(1)
		end,
	}),
}

local tasklist = function(s)
	return awful.widget.tasklist({
		screen = s,
		filter = awful.widget.tasklist.filter.currenttags,
		buttons = buttons,
		layout = {
			spacing_widget = {
				{
					forced_height = dpi(15),
					thickness = dpi(1),
					color = beautiful.xcolor0,
					widget = wibox.widget.separator,
				},
				valign = "center",
				halign = "center",
				widget = wibox.container.place,
			},
			spacing = dpi(10),
			layout = wibox.layout.fixed.horizontal,
		},
		widget_template = {
			{
				{
					id = "background_role",
					widget = wibox.container.background,
				},
				shape = function(cr, w, h)
					gears.shape.squircle(cr, w, h, dpi(2))
				end,
				widget = wibox.container.background,
			},
			{
				{
					id = "icon_role",
					halign = "center",
					valign = "center",
					widget = wibox.widget.imagebox,
				},
				margins = dpi(3),
				widget = wibox.container.margin,
			},
			layout = wibox.layout.stack,
		},
	})
end

return tasklist
