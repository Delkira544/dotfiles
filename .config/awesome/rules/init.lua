local awful = require("awful")
local ruled = require("ruled")

ruled.client.connect_signal("request::rules", function()
	-- All clients will match this rule.
	ruled.client.append_rule({
		id = "global",
		rule = {},
		properties = {
			focus = awful.client.focus.filter,
			raise = true,
			screen = awful.screen.preferred,
			placement = awful.placement.centered + awful.placement.no_overlap + awful.placement.no_offscreen,
		},
	})

	-- Floating clients.
	ruled.client.append_rule({
		id = "floating",
		rule_any = {
			instance = { "copyq", "pinentry" },
			class = {
				"Arandr",
				"Blueman-manager",
				"Gpick",
				"Kruler",
				"Sxiv",
				"Tor Browser",
				"Wpa_gui",
				"veromix",
				"xtightvncviewer",
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
			},
		},
		properties = { floating = true },
	})

	-- Add titlebars to normal clients and dialogs
	ruled.client.append_rule({
		id = "titlebars",
		rule_any = { type = { "normal", "dialog" } },
		properties = { titlebars_enabled = true },
	})

	-- Set Firefox to always map on the tag named '2' on screen 1.
	-- ruled.client.append_rule {
	--    rule       = {class = 'Firefox'},
	--    properties = {screen = 1, tag = '2'}
	-- }
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
		rule = { class = "Spotify" },
		properties = { tag = "5" },
	})
	ruled.client.append_rule({
		rule = { class = "Vivaldi" },
		properties = { tag = "1", maximized = false },
	})

	ruled.client.append_rule({
		rule = { class = { "Discord", "Discord Updater", "discord" } },
		properties = { tag = "9" },
	})

	ruled.client.append_rule({
		rule = { name = "Imagen sobre imagen" }, -- Usamos el WM_NAME y _NET_WM_NAME
		properties = {
			floating = true, -- Hacer que la ventana sea flotante
			ontop = true, -- Mantenerla siempre encima de las demás ventanas
			sticky = true, -- Mantenerla visible en todos los escritorios
			focusable = false, -- No permitir que la ventana reciba foco (opcional)
			size_hints_honor = false,
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
end)
