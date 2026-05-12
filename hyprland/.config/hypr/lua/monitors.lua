------------------
---- MONITORS ----
------------------

-- Setup
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})
hl.monitor({
    output = "eDP-1",
    mode = "1920x1080@60",
    position = "0x0",
    scale = "1"
})
hl.monitor({
    output = "HDMI-A-2",
    mode = "2560x1440@60",
    position = "0x-1440",
    scale = "1"
})

-- Workspace configs
local mainMon = "HDMI-A-2"
local secMon = "eDP-1"
hl.workspace_rule({ workspace = "1", monitor = mainMon, default = true })
hl.workspace_rule({ workspace = "2", monitor = mainMon, default = true })
hl.workspace_rule({ workspace = "3", monitor = mainMon, default = true })
hl.workspace_rule({ workspace = "4", monitor = mainMon, default = true })
hl.workspace_rule({ workspace = "5", monitor = mainMon, default = true })

hl.workspace_rule({ workspace = "6", monitor = secMon, default = true })
hl.workspace_rule({ workspace = "7", monitor = secMon, default = true })
hl.workspace_rule({ workspace = "8", monitor = secMon, default = true })
hl.workspace_rule({ workspace = "9", monitor = secMon, default = true })
hl.workspace_rule({ workspace = "10", monitor = secMon, default = true })
