local theme_assets      = require("beautiful.theme_assets")
local xresources        = require("beautiful.xresources")
local dpi               = xresources.apply_dpi
local xrdb              = xresources.get_current_theme()
local gears             = require("gears")
local gfs               = require("gears.filesystem")
local themes_path       = gfs.get_themes_dir()
local config_path       = gfs.get_configuration_dir()


-- Define Theme based on the default theme
local theme = dofile(themes_path .. "default/theme.lua")


-- Colores Rose Pine
theme.xbackground   = "#191724" -- Base
theme.xforeground   = "#e0def4" -- Text
theme.xcolor0       = "#1f1d2e" -- Surface
theme.xcolor1       = "#eb6f92" -- Love
theme.xcolor2       = "#f6c177" -- Gold
theme.xcolor3       = "#31748f" -- Pine
theme.xcolor4       = "#9ccfd8" -- Foam
theme.xcolor5       = "#c4a7e7" -- Iris
theme.xcolor6       = "#908caa" -- Subtle
theme.xcolor7       = "#6e6a86" -- Muted
theme.xcolor8       = "#403d52" -- Highlight Med
theme.xcolor9       = "#524f67" -- Highlight High
theme.xcolor10      = "#9ccfd8" -- Foam (Bright)
theme.xcolor11      = "#f6c177" -- Gold (Bright)
theme.xcolor12      = "#c4a7e7" -- Iris (Bright)
theme.xcolor13      = "#ebbcba" -- Rose
theme.xcolor14      = "#31748f" -- Pine (Bright)
theme.xcolor15      = "#e0def4" -- Text (Bright)

-- General
theme.vont      = "Iosevka 12"
theme.font      = "Iosevka 12"
theme.font_bold = "Iosevka Bold 12"
theme.font_boit = "Iosevka Bold Italic 12"
theme.iconfont  = "IosevkaTerm Nerd Font 14"

theme.fg_focus  = theme.xforeground
theme.fg_normal = theme.xcolor6
theme.fg_urgent = theme.color1

theme.bg_focus  = theme.xcolor8    -- Highlight Med para el fondo activo
theme.bg_normal = theme.xbackground
theme.bg_urgent = theme.xcolor1

theme.useless_gap   = dpi(4)
theme.border_radius = dpi(0)


-- Wallpaper
theme.wallpaper = config_path .. "theme/wallpaper.png"


-- Borders
theme.border_width  = dpi(4)
theme.border_focus  = theme.xcolor3
theme.border_normal = theme.xcolor9
theme.border_marked = theme.bg_urgent


-- Taglist
theme.taglist_font          = theme.font_bold
theme.taglist_fg_focus      = theme.bg_normal
theme.taglist_bg_focus      = theme.xcolor4
theme.taglist_fg_occupied   = theme.background
theme.taglist_bg_occupied   = theme.xcolor8
theme.taglist_fg_empty      = theme.xbackground
theme.taglist_bg_empty      = theme.xcolor0
theme.taglist_fg_urgent     = theme.xbackground
theme.taglist_bg_urgent     = theme.xcolor1
theme.taglist_fg_volatile   = theme.xforeground
theme.taglist_bg_volatile   = theme.xcolor3

theme.taglist_squares_sel   = nil
theme.taglist_squares_unsel = nil
theme.taglist_disable_icon  = true


-- Tsasklist
theme.tasklist_bg_focus     = theme.bg_focus
theme.tasklist_bg_urgent    = theme.bg_urgent
theme.tasklist_bg_minimize  = theme.xcolor0


-- Notifications:
theme.notification_font         = theme.font
theme.notification_border_color = theme.xcolor3
theme.notification_margin       = dpi(15)
theme.notification_border_width = dpi(0)


-- Menu
theme.menu_font         = theme.font
-- theme.menu_submenu_icon = gears.color.recolor_image(config_path .. "theme/submenu.png", theme.xcolor8)
theme.menu_bg_focus     = theme.xcolor4
theme.menu_fg_focus     = theme.xbackground
theme.menu_bg_normal    = theme.xbackground
theme.menu_fg_normal    = theme.xforeground
theme.menu_height       = dpi(30)
theme.menu_width        = dpi(110)
theme.menu_border_color = theme.xcolor0
theme.menu_border_width = theme.border_width


-- Bling
theme.tag_preview_client_bg             = theme.xbackground
theme.tag_preview_client_border_color   = theme.xcolor0
theme.tag_preview_client_border_radius  = theme.border_radius
theme.tag_preview_client_border_width   = theme.border_width
theme.tag_preview_widget_margin         = dpi(10)
theme.tag_preview_widget_border_color   = theme.xcolor8
theme.tag_preview_widget_border_radius  = theme.border_radius
theme.tag_preview_widget_border_width   = theme.border_width

theme.window_switcher_widget_bg                         = theme.xcolor0
theme.window_switcher_widget_border_width               = theme.border_width
theme.window_switcher_widget_border_radius              = theme.border_radius
theme.window_switcher_widget_border_color               = theme.xcolor8
theme.window_switcher_clients_spacing                   = dpi(10)
theme.window_switcher_client_icon_horizontal_spacing    = dpi(5)
theme.window_switcher_client_width                      = dpi(150)
theme.window_switcher_client_height                     = dpi(130)
theme.window_switcher_client_margins                    = dpi(10)
theme.window_switcher_thumbnail_margins                 = dpi(5)
theme.thumbnail_scale                                   = false
theme.window_switcher_name_margins                      = dpi(3)
theme.window_switcher_name_valign                       = "center"
theme.window_switcher_name_forced_width                 = theme.window_switcher_client_width
theme.window_switcher_name_font                         = theme.vont .. "7"
theme.window_switcher_name_normal_color                 = theme.xforeground
theme.window_switcher_name_focus_color                  = theme.xcolor4
theme.window_switcher_icon_valign                       = "center"
theme.window_switcher_icon_width                        = dpi(30)


theme.bg_systray = theme.xbackground
theme.systray_icon_spacing = dpi(4)
theme.bg_wibox = "#00000000"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

require("beautiful").init(theme)
