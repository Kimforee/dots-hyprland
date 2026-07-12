-- Put former exec-once commands inside the function and former exec commands outside
hl.on("hyprland.start", function ()
    hl.exec_cmd("blueman-applet")
end)
