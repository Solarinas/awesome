-- Set Variables
local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local xrdb = xresources.get_current_theme()

local theme_name = "my_theme"
local theme_assets = require("beautiful.theme_assets")

-- This makes it easier to align panels
local awful = require("awful")
local screen_width = awful.screen.focused().geometry.width
local screen_height = awful.screen.focused().geometry.height

local theme = {}

-- Set theme font
theme.font          = "Inconsolata Bold 10"

-- Get colors from Xresources
theme.xbackground   = xrdb.background
theme.xforeground   = xrdb.foreground
theme.xcolor0       = xrdb.color0
theme.xcolor1       = xrdb.color0
theme.xcolor2       = xrdb.color2
theme.xcolor3       = xrdb.color3
theme.xcolor4       = xrdb.color4
theme.xcolor5       = xrdb.color5
theme.xcolor6       = xrdb.color6
theme.xcolor7       = xrdb.color7
theme.xcolor8       = xrdb.color8
theme.xcolor9       = xrdb.color9
theme.xcolor10      = xrdb.color10
theme.xcolor11      = xrdb.color11
theme.xcolor12      = xrdb.color12
theme.xcolor13      = xrdb.color13
theme.xcolor14      = xrdb.color14
theme.xcolor15      = xrdb.color15

-- Set theme colors
theme.bg_normal     = theme.xbackground
theme.bg_focus      = theme.xcolor12
theme.bg_urgent     = theme.xcolor9
theme.bg_minimize   = theme.xcolor8
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = theme.xforeground
theme.fg_focus      = theme.bg_normal
theme.fg_urgent     = theme.bg_normal
theme.fg_minimize   = theme.bg_normal

theme.tooltip_fg = theme.fg_normal
theme.tooltip_bg = theme.bg_normal

-- Gaps
theme.useless_gap = dpi(5)
theme.screen_margin = dpi(5)

-- Borders
theme.border_width = dpi(0)
theme.border_normal = theme.xcolor0
theme.border_focus = theme.bg_focus
theme.border_marked = theme.xcolor10

theme.tooltip_fg = theme.fg_normal
theme.tooltip_bg = theme.bg_normal

-- Rounded corners
theme.border_radius = dpi(6)

-- Notifications
theme.notification_position = "top_right"
theme.notification_border_width = dpi(0)

theme.notification_border_radius = theme.border_radius
theme.notification_border_color = theme.xcolor10
theme.notification_bg = theme.xbackground
theme.notification_fg = theme.xforeground
theme.notification_crit_bg = theme.xbackground
theme.notification_crit_fg = theme.xcolor1

theme.notification_icon_size = dpi(80)
theme.notifcation_height = dpi(80)
theme.notifcation_width = dpi(300)
theme.notfication_margin = dpi(16)
theme.notifcation_opacity = 1
theme.notfication_font = "Inconsolata Bold 10"
theme.notification_padding = theme.screen_margin * 2
theme.notification_spacing = theme.screen_margin * 2

-- Theme the menu
theme.menu_submenu_icon = themes_path.."default/submenu.png"
theme.menu_height = dpi(16)
theme.menu_width  = dpi(100)

-- Recolor Layout icons:
theme = theme_assets.recolor_layout(theme, theme.fg_normal)

-- Set Icon theme
theme.icon_theme = nil

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

return theme

