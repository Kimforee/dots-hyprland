-- Put former exec-once commands inside the function and former exec commands outside
hl.on("hyprland.start", function ()
    hl.exec_cmd("blueman-applet")
    
    -- DO NOT USE BIBATA EVER AGAIN (user preference)
    hl.exec_cmd("hyprctl setcursor Adwaita 24")
end)
