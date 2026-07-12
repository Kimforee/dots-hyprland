-- Put general config stuff here
hl.config({
    binds = {
        allow_workspace_cycles = true
    },
    gestures = {
        workspace_swipe_direction_lock_threshold = 32
    }
})

-- Restore custom 3-finger and 4-finger gestures from backup

-- 1. Unset default conflicting gestures
hl.gesture({
    fingers = 3,
    direction = "swipe",
    action = "unset"
})
hl.gesture({
    fingers = 3,
    direction = "pinch",
    action = "unset"
})
hl.gesture({
    fingers = 4,
    direction = "horizontal",
    action = "unset"
})

-- 2. Register custom gestures
hl.gesture({
    fingers = 4,
    direction = "swipe",
    action = "move"
})
hl.gesture({
    fingers = 4,
    direction = "pinch",
    action = "float"
})
hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})
