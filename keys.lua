-- Load Awesome libraries
local awful = require("awful")
local naughty = require("naughty")
local gears = require("gears")
local beautiful = require("beautiful")
local menubar = require("menubar")

local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")

local keys = {}

-- Mod keys 
modkey = "Mod4"
alt = "Mod1"
ctrl = "Control"
shift = "Shift"

-- Mouse bindings
keys.desktopbuttons = (gears.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))

keys.globalkeys = gears.table.join(
    awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"}),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),
    awful.key({ modkey,           }, "w", function () mymainmenu:show() end,
              {description = "show main menu", group = "awesome"}),

    -- Layout manipulation
    awful.key({ modkey, shift   }, "j", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey, shift   }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    --awful.key({ modkey, shift   }, "q", awesome.quit,
              --{description = "quit awesome", group = "awesome"}),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey, shift   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey, shift   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),
    awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ modkey, shift   }, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),

    awful.key({ modkey, "Control" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:emit_signal(
                        "request::activate", "key.unminimize", {raise = true}
                    )
                  end
              end,
              {description = "restore minimized", group = "client"}),

    -- Prompt
    --awful.key({ modkey },            "r",     function () awful.screen.focused().mypromptbox:run() end,
              --{description = "run prompt", group = "launcher"}),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run {
                    prompt       = "Run Lua code: ",
                    textbox      = awful.screen.focused().mypromptbox.widget,
                    exe_callback = awful.util.eval,
                    history_path = awful.util.get_cache_dir() .. "/history_eval"
                  }
              end,
              {description = "lua execute prompt", group = "awesome"}),
    -- Menubar
    --awful.key({ modkey }, "p", function() menubar.show() end,
              --{description = "show the menubar", group = "launcher"}),

    -- Custom Shortcuts

    -- Application launcher
    awful.key({ modkey,      }, "d", function () awful.util.spawn("rofi -show drun") end,
        {description = "Application launcher", group = "rofi"}),
    awful.key({ modkey,      }, "u", function () awful.util.spawn("rofimoji") end,
        {description = "Emoji Viewer", group = "rofi"}),
    awful.key({ modkey,      }, "p", function () awful.util.spawn("bwmenu") end,
        {description = "Password Manager", group = "rofi"}),



    -- Kill Program
    awful.key({ modkey , shift }, "q", function() awful.util.spawn("xkill -id $(xdotool getactivewindow)") end,
        {description = "kill", group = "client"}),

    -- Text Editor
    awful.key({modkey,       }, "e", function () awful.util.spawn(editor) end,
        {description = "Open text editor", group = "launcher"}),
    --awful.key({modkey, shift }, "e", function () awful.util.spawn(terminal.. " -e".. editor.. " /home/solarinas/.config/awesome/rc.lua") end,
        --{description = "Edit awesome config", group = "launcher"}),

    -- Program Shortcuts
    awful.key({ modkey,      }, "r", function () awful.util.spawn(terminal.. " -e ranger") end,
       {description = "Launch File Manager", group = "launcher"}),
    awful.key({ modkey,      }, "t", function () awful.util.spawn(terminal.. " -e stig") end,
       {description = "Launch Torrent client", group = "launcher"}),
    awful.key({ modkey,      }, "m", function () awful.util.spawn(terminal.. " -e ncmpcpp") end,
        {description = "Launch music player", group = "launcher"}),
    awful.key({ modkey, shift     }, "m", function () awful.util.spawn(mail) end,
        {description = "Launch E-mail Client", group = "launcher"}),
    awful.key({ modkey,     }, "y", function () awful.util.spawn(terminal.. " -e ytop") end,
        {description = "Launch System Monitor", group = "launcher"}),



    -- Screenshots
    awful.key({ },  "Print" ,  function () awful.util.spawn("/home/solarinas/.scripts/screenshot -u") end,
        {description = "Screenshot focused program", group = "screenshot"}),
    awful.key({ shift },  "Print" ,  function () awful.util.spawn("/home/solarinas/.scripts/screenshot -s") end,
        {description = "Screenshot Selection", group = "screenshot"}),
    awful.key({ modkey },  "Print" ,  function () awful.util.spawn("/home/solarinas/.scripts/screenshot -m") end,
        {description = "Screenshot primary monitor", group = "screenshot"}),

    -- Media keys 
    awful.key({ }, "XF86AudioPlay", function () awful.util.spawn("playerctl play-pause") end),
    awful.key({ }, "XF86AudioNext", function () awful.util.spawn("playerctl next") end),
    awful.key({ }, "XF86AudioPrev", function () awful.util.spawn("playerctl prev") end),
    
    -- Volume control
    awful.key({ },  "XF86AudioRaiseVolume" ,  function ()
	  awful.util.spawn("pactl set-sink-volume 1 +5%") end),
    awful.key({ },  "XF86AudioLowerVolume" ,  function () awful.util.spawn("pactl set-sink-volume 1 -5%") end),
    awful.key({ },  "XF86AudioMute" ,  function () awful.util.spawn("pactl set-sink-mute 1 toggle") end)

)

keys.clientkeys = gears.table.join(
    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),
    awful.key({ modkey   }, "q",      function (c) c:kill()                         end,
              {description = "close", group = "client"}),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),
    awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"}),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
              {description = "toggle keep on top", group = "client"}),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = "minimize", group = "client"}),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "client"}),
    awful.key({ modkey, "Control" }, "m",
        function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end ,
        {description = "(un)maximize vertically", group = "client"}),
    awful.key({ modkey, shift   }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end ,
        {description = "(un)maximize horizontally", group = "client"})


)

-- Bind all key numbers to tags
-- Be careful: we use keycodes to make work on any keyboard layout.
-- This should map on the top rpw of your keyboard, usually 1 to 9
for i = 1, 9 do
    keys.globalkeys = gears.table.join(keys.globalkeys,
        -- View tags only
        awful.key({ modkey }, "#" .. i + 9,
            function ()
                --Tag back and forth
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then 
                    tag:view_only()
                end
            end,
            {description = "view tag #" ..i, group = "tag"}),
    -- Toggle tag display
    awful.key({ modkey, ctrl }, "#" .. i + 9,
        function ()
            local screen = awful.screen.focused()
            local tag = screen.tags[i]
            if tag then
                awful.tag.viewtoggle(tag)
            end
        end,
        {description = "toggle tag #" .. i, group = "tag"}),

    -- Move client to tag
    awful.key({ modkey, shift }, "#" .. i + 9,
        function ()
            if client.focus then
                local tag = client.focus.screen.tags[i]
                if tag then
                    client.focus:move_to_tag(tag)
                end
            end
        end,
        {description = "move focues client to tag #" ..i, group = "tag"}),

        -- Toggle tag on focused client
        awful.key({ modkey, ctl , shift }, "#" .. i + 9,
            function ()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:toggle_tag(tag)
                    end
                end
            end,
            {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

keys.clientbuttons = gears.table.join(
    awful.button({ }, 1, function(c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function(c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function(c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

-- Set keys
root.keys(keys.globalkeys)
root.buttons(keys.desktopbuttons)

return keys
