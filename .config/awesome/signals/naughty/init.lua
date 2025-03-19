local naughty = require("naughty")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

naughty.connect_signal("request::display_error", function(message, startup)
	naughty.notification({
		urgency = "critical",
		title = "Oops, an error happened" .. (startup and " during startup!" or "!"),
		message = message,
	})
end)

naughty.connect_signal("request::display", function(n)
	naughty.layout.box({
		notification = n,
		widget_template = {
			{
				{
					{

						{
							{
								text = n.app_name or "Aplicación desconocida",
								widget = wibox.widget.textbox,
								font = beautiful.font_bold or "sans bold 10",
								align = "center",
								valign = "center",
							},
							top = dpi(5),
							bottom = dpi(5),
							widget = wibox.container.margin,
						},
						widget = wibox.layout.fixed.vertical,
					},
					widget = wibox.container.background,
					bg = beautiful.xcolor0,
				},
				{
					{
						{
							naughty.widget.icon,
							{
								naughty.widget.title,
								naughty.widget.message,
								align = "center",
								valign = "center",
								spacing = 4,
								layout = wibox.layout.align.vertical,
							},
							spacing = dpi(15),
							layout = wibox.layout.fixed.horizontal,
						},
						margins = beautiful.notification_margin or dpi(10),
						widget = wibox.container.margin,
					},
					fill_space = true,
					spacing = 4,
					layout = wibox.layout.fixed.horizontal,
					widget = wibox.container.background,
					bg = beautiful.background,
				},
				forced_width = dpi(320),
				layout = wibox.layout.align.vertical,
			},
			forced_width = dpi(320),
			max_height = dpi(200),
			layout = wibox.layout.fixed.horizontal,
		},
	})
end)
