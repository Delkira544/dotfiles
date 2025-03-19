local awful = require("awful")
local beautiful = require("beautiful")
require("awful.autofocus")
local dpi = beautiful.xresources.apply_dpi
local wibox = require("wibox")

client.connect_signal("mouse::enter", function(c)
	c:activate({ context = "mouse_enter", raise = false })
end)

client.connect_signal("focus", function(c)
	local clients = awful.screen.focused().clients
	if #clients == 1 then
		c.border_width = dpi(2)
		c.border_color = beautiful.border_focus
	else
		c.border_width = beautiful.border_width
		c.border_color = beautiful.border_focus
	end
end)

-- Restaura el borde cuando una ventana pierde foco
client.connect_signal("unfocus", function(c)
	c.border_width = beautiful.border_width
	c.border_color = beautiful.border_normal
end)

--[[
client.connect_signal('request::titlebars', function(c)
   -- buttons for the titlebar
   local buttons = {
      awful.button{
         modifiers = {},
         button    = 1,
         on_press  = function()
            c:activate{context = 'titlebar', action = 'mouse_move'}
         end
      },
      awful.button{
         modifiers = {},
         button    = 3,
         on_press  = function()
            c:activate{context = 'titlebar', action = 'mouse_resize'}
         end
      },
   }

   awful.titlebar(c).widget = {
      -- left
      {
         awful.titlebar.widget.iconwidget(c),
         buttons = buttons,
         layout  = wibox.layout.fixed.horizontal,
      },
      -- middle
      {
         -- title
         {
            align = 'center',
            widget = awful.titlebar.widget.titlewidget(c),
         },
         buttons = buttons,
         layout  = wibox.layout.flex.horizontal,
      },
      -- right
      {
         awful.titlebar.widget.floatingbutton(c),
         awful.titlebar.widget.maximizedbutton(c),
         awful.titlebar.widget.stickybutton(c),
         awful.titlebar.widget.ontopbutton(c),
         awful.titlebar.widget.closebutton(c),
         layout = wibox.layout.fixed.horizontal()
      },
      layout = wibox.layout.align.horizontal,
   }
end)
--]]
