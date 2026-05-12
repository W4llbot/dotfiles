-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- Hyprland
hl.env("HYPRLAND_TRACE", "1")
hl.env("HYPRLAND_CONFIG", "~/.config/hyprland.lua")
hl.env("AQ_TRACE", "1")

-- Theme related
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("env = XCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("env = GTK_THEME", "Breeze:dark")

-- QT variables
hl.env("env = QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("env = QT_QPA_PLATFORM", "wayland;xcb")
-- env = QT_WAYLAND_DISABLE_WINDOWDECORATION,1
hl.env("env = QT_QPA_PLATFORMTHEME", "qt5ct")

-- Toolkit backends
hl.env("env = GDK_BACKEND", "wayland,x11,*")
hl.env("env = QT_QPA_PLATFORM", "wayland;xcb")
hl.env("env = SDL_VIDEODRIVER", "wayland")
hl.env("env = CLUTTER_BACKEND", "wayland")

-- XDG specifications
hl.env("env = XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("env = XDG_SESSION_TYPE", "wayland")
hl.env("env = XDG_SESSION_DESKTOP", "Hyprland")


-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")
