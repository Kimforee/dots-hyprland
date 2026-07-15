-- You can put custom rules here
-- Window/layer rules: https://wiki.hyprland.org/Configuring/Window-Rules/
-- Workspace rules: https://wiki.hyprland.org/Configuring/Workspace-Rules/

-- Override screen sharing indicator: do not pin it on all workspaces (allow it to stay on Chrome's workspace and hide properly)
hl.window_rule({match = {title = ".*is sharing (a window|your screen).*" }, pin = false})
