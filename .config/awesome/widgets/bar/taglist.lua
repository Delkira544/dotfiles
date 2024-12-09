local awful = require("awful")
local gears = require("gears")
local mod = require("bindings.mod")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local rubato = require("modules.rubato")

local buttons = {
	awful.button({
		modifiers = {},
		button = 1,
		on_press = function(t)
			t:view_only()
		end,
	}),
	awful.button({
		modifiers = { mod.super },
		button = 1,
		on_press = function(t)
			if client.focus then
				client.focus:move_to_tag(t)
			end
		end,
	}),
	awful.button({
		modifiers = {},
		button = 3,
		on_press = awful.tag.viewtoggle,
	}),
	awful.button({
		modifiers = { mod.super },
		button = 3,
		on_press = function(t)
			if client.focus then
				client.focus:toggle_tag(t)
			end
		end,
	}),
	awful.button({
		modifiers = {},
		button = 4,
		on_press = function(t)
			awful.tag.viewprev(t.screen)
		end,
	}),
	awful.button({
		modifiers = {},
		button = 5,
		on_press = function(t)
			awful.tag.viewnext(t.screen)
		end,
	}),
}

local taglist = function(s)
	return awful.widget.taglist({
		screen = s,
		filter = awful.widget.taglist.filter.all,
		buttons = buttons,
		style = {
			shape = gears.shape.rounded_bar,
		},
		layout = {
			spacing = dpi(7),
			layout = wibox.layout.fixed.horizontal,
		},
		widget_template = {
			id = "background_role",
			widget = wibox.container.background,
			create_callback = function(self, t, _)
				self.animator = rubato.timed({
					duration = 0.2,
					subscribed = function(pos)
						self:get_children_by_id("background_role")[1].forced_width = pos
					end,
				})

				self.update = function()
					if t.selected then
						self.animator.target = dpi(20)
					elseif #t:clients() == 0 then
		self.animator.target = dpi(10)
					else
						self.animator.target = dpi(15)
					end
				end

				self.update()

				self:connect_signal("mouse::enter", function()
					if #t:clients() > 0 then
						awesome.emit_signal("bling::tag_preview::update", t)
						awesome.emit_signal("bling::tag_preview::visibility", s, true)
					end
				end)
				self:connect_signal("mouse::leave", function()
					awesome.emit_signal("bling::tag_preview::visibility", s, false)
					if self.has_backup then
						self.bg = self.backup
					end
				end)
			end,
			update_callback = function(self)
				self.update()
			end,
		},
	})
end

return taglist
