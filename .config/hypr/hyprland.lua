-----------------
--- VARIABLES ---
-----------------
local terminal = "kitty"
local fileManager = "nautilus"
local menu = "fuzzel"
local mainMod = "ALT + CTRL"
local midMod = "SUPER" -- Modificador secundario para movimiento/workspaces

-------------------------------
--- ENVIRONMENT VARIABLES ---
-------------------------------
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

------------------
--- AUTOSTART ---
------------------
hl.on("hyprland.start", function()
	hl.exec_cmd("waybar & swaync & hypridle & hyprpaper & nm-applet")
end)

---------------
--- MONITORS ---
---------------

hl.monitor({ output = "DP-2", mode = "1920x1080@60", position = "0x0", scale = 1 })
hl.monitor({ output = "DP-1", mode = "1920x1080@60", position = "0x0", scale = 1 })
-- hl.monitor({ output = "HDMI-A-1", mode = "1920x1080@60", position = "1920x0", scale = 1 }) -- television
hl.monitor({ output = "HDMI-A-1", mode = "1920x1080@120", position = "1920x0", scale = 1 })
hl.monitor({ output = "eDP-1", mode = "2880x1800@90", position = "3840x0", scale = 2 })

hl.workspace_rule({ workspace = "9", monitor = "DP-1", default = true })
hl.workspace_rule({ workspace = "9", monitor = "DP-2", default = true })
hl.workspace_rule({ workspace = "1", monitor = "HDMI-A-1", default = true })
hl.workspace_rule({ workspace = "10", monitor = "eDP-1", default = true })

-------------------------
--- LOOK AND FEEL ---
-------------------------

hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 8,

		border_size = 1,

		col = {
			active_border = "rgb(d8cab8)",
			inactive_border = "rgb(AC82E9)",
		},

		resize_on_border = true,
		allow_tearing = false, -- Precaución: revisar la documentación de Tearing
		layout = "dwindle",
	},

	decoration = {
		rounding = 6,
		active_opacity = 1.0,
		inactive_opacity = 0.9,

		-- Window Shadow
		shadow = {
			enabled = true,
			range = 16,
			render_power = 5,
			color = "rgba(0,0,0,0.2)",
		},

		-- Transparent Window Blur (Valores por defecto aplicados a Hyprland)
		blur = {
			enabled = true,
			size = 2,
			passes = 3,
			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = true,
	},
})

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })

hl.config({
	dwindle = {
		preserve_split = true,
	},
})

-----------------
--- INPUT ---
-----------------

hl.config({
	input = {
		kb_layout = "es",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		follow_mouse = 1,
		sensitivity = 0,

		touchpad = {
			natural_scroll = true,
		},
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})

--------------------
--- KEYBINDINGS ---
--------------------

-- --- Lanzadores y Acciones del Sistema ---
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(terminal .. " -e bluetui"))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + H", hl.dsp.exec_cmd("~/.config/hypr/scripts/help-shortcuts.sh"))
hl.bind(mainMod .. " + L", hl.dsp.exit())
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("thunderbird"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("swaync-client -t"))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd("zen-browser"))
hl.bind(mainMod .. " + space", hl.dsp.exec_cmd(menu))

-- hl.bind(midMod .. " + H", hl.dsp.exec_cmd(""))
hl.bind(midMod .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(midMod .. " + T", hl.dsp.exec_cmd("~/.config/wttr/notify-wttr.sh"))
hl.bind(midMod .. " + W", hl.dsp.exec_cmd("killall -SIGUSR1 waybar"))

-- --- Captura de Pantalla ---
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m window -o ~/Pictures/Screenshots"))
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m region -o ~/Pictures/Screenshots"))

-- --- Workspaces (Escritorios) + Mover Ventana a Workspace ---
for i = 1, 10 do
	local key = i % 10 -- 10 mapea a la tecla 0
	hl.bind(midMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(midMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- --- Foco y Movimiento de Ventanas ---
hl.bind(midMod .. " + left", hl.dsp.focus({ direction = "l" }))
hl.bind(midMod .. " + right", hl.dsp.focus({ direction = "r" }))
hl.bind(midMod .. " + up", hl.dsp.focus({ direction = "u" }))
hl.bind(midMod .. " + down", hl.dsp.focus({ direction = "d" }))

-- --- Navegación con Scroll ---
hl.bind(midMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(midMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- --- Mover/Redimensionar con Mouse ---
hl.bind(midMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(midMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- --- Teclas Multimedia (Volume/Brightness) ---
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- --- Teclas de Reproducción (Requiere playerctl) ---
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

------------------------------------------------
--- REGLAS DE VENTANA Y CAPA (WINDOW/LAYER) ---
------------------------------------------------

-- --- REGLAS DE CAPA (layer_rule) ---
-- Consolidación de reglas de Waybar y Fuzzel.
-- El blur usa los valores globales de decoration.blur para consistencia.

-- Waybar (Barra de estado)
-- hl.layer_rule({ match = { namespace = "waybar" }, blur = true, blur_popups = true, ignore_alpha = 0.7 })

-- Fuzzel (Lanzador de aplicaciones)
hl.layer_rule({ match = { namespace = "fuzzel" }, blur = true, blur_popups = true, ignore_alpha = 0.7 })

hl.layer_rule({ match = { namespace = "swaync" }, blur = true, blur_popups = true, ignore_alpha = 0.7 })

-- --- REGLAS DE VENTANA (window_rule) ---

-- 1. Comportamiento Estático (Flotante, Posición)

-- [REGLA NOMBRADA] Centrar el selector de color de Unity en el cursor
hl.window_rule({
	name = "unity-color-picker",
	match = {
		class = "^(Unity)$",
		title = "^(Color|HDR Color)$", -- Coincide con ambos títulos en una sola regla
	},
	move = { "cursor_x-(window_w*0.5)", "cursor_y-(window_h*0.5)" },
})

-- 2. Comportamiento Dinámico (Foco, Otros)

-- [REGLA ANÓNIMA] Solución para problemas de foco en algunas ventanas XWayland
hl.window_rule({
	match = {
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
		class = "^$",
		title = "^$",
	},
	no_focus = true,
})
