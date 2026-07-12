-- See https://wiki.hyprland.org/Configuring/Binds/
--!
--! User
hl.bind("CTRL+SUPER+ALT+Slash", hl.dsp.exec_cmd("xdg-open ~/.config/hypr/custom/keybinds.lua"), {description = "Edit extra keybinds"})

-- Add stuff here
hl.bind("ALT + Tab", hl.dsp.focus({ workspace = "e+1" }))

-- To switch between windows in a floating workspace:
hl.bind("CTRL + Tab", hl.dsp.focus({ workspace = "prev" }))
hl.bind("ALT + SHIFT + Tab", hl.dsp.exec_cmd("hyprctl dispatch cyclenext prev all"))
hl.bind("SUPER + Space", hl.dsp.exec_cmd("fuzzel"))
hl.bind("SUPER + H", hl.dsp.exec_cmd("remotegamepad"))
hl.bind("SUPER + D", hl.dsp.exec_cmd("quickshell -p toggle-overview"))
hl.bind("SUPER + SHIFT + Tab", hl.dsp.exec_cmd("hyprctl dispatch cyclenext previous all"))

-- Bypass bindings for overview
hl.bind("SUPER + SUPER_L", hl.dsp.global("quickshell:overviewToggleRelease"), { bypass = true })
hl.bind("SUPER + SUPER_R", hl.dsp.global("quickshell:overviewToggleRelease"), { bypass = true })
hl.bind("SUPER + SUPER_L", hl.dsp.exec_cmd("qs -c $qsConfig ipc call TEST_ALIVE || pkill fuzzel || fuzzel"), { bypass = true })
hl.bind("SUPER + SUPER_R", hl.dsp.exec_cmd("qs -c $qsConfig ipc call TEST_ALIVE || pkill fuzzel || fuzzel"), { bypass = true })

-- Catchall interrupt (using os.execute because "catchall" with modifiers is not supported by the Lua parser)
os.execute("hyprctl keyword bindpitn 'Super, catchall, global, quickshell:overviewToggleReleaseInterrupt'")

-- Keyboard shortcut to open terminal and list/resume sessions
hl.bind("SUPER + SHIFT + C", hl.dsp.exec_cmd("kitty -e fish -c agychats"), { description = "App: List/Resume chats" })
