local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local gfs = require("gears.filesystem")
local beautiful = require("beautiful")
local ruled = require("ruled")

-- Wallpaper
local function set_wallpaper(s)
	if gfs.file_readable(gfs.get_configuration_dir() .. "theme/wall.jpg") then
		local wallpaper = beautiful.wallpaper
		-- If wallpaper is a function, call it with the screen
		if type(wallpaper) == "function" then
			wallpaper = wallpaper(s)
		end
		gears.wallpaper.maximized(wallpaper, s)
	else
		awful.wallpaper({
			screen = s,
			widget = wibox.widget({
				{
					markup = "[WALLPAPER FAILURE]",
					font = beautiful.vont .. "Bold 22",
					valign = "center",
					halign = "center",
					widget = wibox.widget.textbox,
				},
				fg = beautiful.xbackground,
				bg = {
					type = "linear",
					from = { 1920, 0 },
					to = { 0, 1920 },
					stops = {
						{ 0, beautiful.xcolor4 },
						{ 1, beautiful.xcolor8 },
					},
				},
				layout = wibox.container.background,
			}),
		})
	end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

-- Tags, Layouts and Wallpaper
awful.screen.connect_for_each_screen(function(s)
	set_wallpaper(s)
	tag.connect_signal("request::default_layouts", function()
		awful.layout.append_default_layouts({
			awful.layout.suit.tile,
			awful.layout.suit.floating,
			-- awful.layout.suit.tile.left,
			-- awful.layout.suit.tile.bottom,
			-- awful.layout.suit.tile.top,
			awful.layout.suit.fair,
			-- awful.layout.suit.fair.horizontal,
			-- awful.layout.suit.spiral,
			-- awful.layout.suit.spiral.dwindle,
			awful.layout.suit.max,
			-- awful.layout.suit.max.fullscreen,
			-- 	awful.layout.suit.magnifier,
			awful.layout.suit.corner.nw,
			--wful.layout.suit.corner.ne,
			-- awful.layout.suit.corner.sw,
			-- awful.layout.suit.corner.se,
		})
	end)

	awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])
end)

-- Window Bordering
client.connect_signal("manage", function(c)
	c.border_width = beautiful.border_width
	c.border_color = beautiful.border_focus

	c:connect_signal("focus", function()
		c.border_color = beautiful.border_focus
	end)

	c:connect_signal("unfocus", function()
		c.border_color = beautiful.border_normal
	end)

	c:connect_signal("marked", function()
		c.border_color = beautiful.border_marked
	end)
end)

--  Rules
ruled.client.connect_signal("request::rules", function()
	-- All clients will match this rule.
	ruled.client.append_rule({
		id = "global",
		rule = {},
		properties = {
			focus = awful.client.focus.filter,
			raise = true,
			screen = awful.screen.preferred,
			size_hints_honor = false,
			placement = awful.placement.centered + awful.placement.no_overlap + awful.placement.no_offscreen,
		},
	})

	ruled.client.append_rule({
		id = "multimedia",
		rule_any = {
			class = {
				"vlc",
				"mpv",
			},
		},
		properties = {
			tag = "3",
			switchtotag = true,
			raise = true,
			floating = true,
			draw_backdrop = false,
			placement = awful.placement.centered,
		},
	})

	ruled.client.append_rule({
		id = "floating",
		rule_any = {
			instance = {
				"DTA", -- Firefox addon DownThemAll.
				"copyq", -- Includes session name in class.
				"pinentry",
			},
			class = {
				"Arandr",
				"Blueman-manager",
				"Gpick",
				"Kruler",
				"MessageWin", -- kalarm.
				"Sxiv",
				"Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
				"Wpa_gui",
				"veromix",
				"xtightvncviewer",
				"matplotlib",
				"Blueberry",
				"Imagen sobre imagen",
				"PiP",
			},

			-- Note that the name property shown in xprop might be set slightly after creation of the client
			-- and the name shown there might not match defined rules here.
			name = {
				"Event Tester", -- xev.
			},
			role = {
				"AlarmWindow", -- Thunderbird's calendar.
				"ConfigManager", -- Thunderbird's about:config.
				"pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
				"picture-in-picture",
				"Imagen sobre imagen",
				"PiP",
			},
		},
		properties = { floating = true },
	})

	ruled.client.append_rule({
		id = "events",
		rule_any = {
			class = {
				"Nsxiv",
			},
			type = {
				"dialog",
			},
		},
		properties = {
			focus = true,
			ontop = true,
			floating = true,
			placement = awful.placement.centered,
		},
	})

	ruled.client.append_rule({
		rule = { class = "firefox" },
		properties = { tag = "1" },
	})
	ruled.client.append_rule({
		rule = { class = "Thunar" },
		properties = { tag = "4", maximized = false },
	})

	ruled.client.append_rule({
		rule = { class = "conky" },
		properties = {
			floating = true,
			sticky = true,
			ontop = false,
			skip_taskbar = true,
			below = true,
			focusable = false,
			titlebars_enabled = false,
			border_width = 0,
		},
	})

	ruled.client.append_rule({
		rule = { class = "Spotify" },
		properties = { tag = "5" },
	})
	ruled.client.append_rule({
		rule = { class = "Vivaldi" },
		properties = { tag = "1", maximized = false },
	})

	ruled.client.append_rule({
		rule = { class = "Discord" },
		properties = { tag = "9" },
	})

	ruled.client.append_rule({
        rule = { name = "Imagen sobre imagen" }, -- Usamos el WM_NAME y _NET_WM_NAME
        properties = {
            floating = true,    -- Hacer que la ventana sea flotante
            ontop = true,       -- Mantenerla siempre encima de las demás ventanas
            sticky = true,      -- Mantenerla visible en todos los escritorios
            focusable = false,  -- No permitir que la ventana reciba foco (opcional)
            size_hints_honor = false
        }
    })

	ruled.client.append_rule({
		rule_any = { class = { "Emulator", "emulator" } },
		properties = { floating = true, ontop = true },
	})
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
	c:activate({ context = "mouse_enter", raise = false })
end)
