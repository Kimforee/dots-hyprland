pragma Singleton
import qs.modules.common
import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Wayland

/**
 * A nice wrapper for date and time strings.
 */
Singleton {
    id: root

    function load() {
        // Force init
    }

    property alias inhibit: idleInhibitor.enabled
    inhibit: false

    Component.onCompleted: {
        if (Persistent.ready) {
            root.inhibit = Boolean(Persistent.states?.idle?.inhibit);
        }
    }

    Connections {
        target: Persistent
        function onReadyChanged() {
            if (Persistent.ready) {
                root.inhibit = Boolean(Persistent.states?.idle?.inhibit);
            }
        }
    }

    function toggleInhibit(active = null) {
        if (active !== null) {
            root.inhibit = active;
        } else {
            root.inhibit = !root.inhibit;
        }
        if (Persistent.ready && Persistent.states?.idle) {
            Persistent.states.idle.inhibit = root.inhibit;
        }
    }

    IpcHandler {
        target: "idle"
        function toggle(): void {
            root.toggleInhibit();
        }
        function inhibit(): void {
            root.toggleInhibit(true);
        }
        function uninhibit(): void {
            root.toggleInhibit(false);
        }
    }

    Process {
        id: systemdInhibitor
        running: root.inhibit
        command: ["systemd-inhibit", "--what=idle:sleep", "--why=Keep system awake toggle", "sleep", "infinity"]
    }

    IdleInhibitor {
        id: idleInhibitor
        window: PanelWindow {
            visible: root.inhibit
            implicitWidth: 1
            implicitHeight: 1
            color: "transparent"
            anchors {
                right: true
                bottom: true
            }
            mask: Region {
                item: null
            }
        }
    }
}
