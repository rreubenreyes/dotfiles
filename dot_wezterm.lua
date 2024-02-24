local wezterm = require("wezterm")

local act = wezterm.action
local config = wezterm.config_builder()

-- fish
config.default_prog = { "/opt/homebrew/bin/fish" }

-- general appearance
config.color_scheme = "Tokyo Night"
config.use_fancy_tab_bar = false
config.window_background_opacity = 0.95
config.window_decorations = "RESIZE"

-- smooth animations
config.animation_fps = 240
config.max_fps = 240
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"

-- font rendering
config.front_end = "WebGpu"
config.freetype_load_target = "Light"
config.freetype_load_flags = "NO_HINTING"
config.freetype_render_target = "HorizontalLcd"
config.font_size = 14.0

config.keys = {
	-- tabs
	{ key = "p", mods = "CMD|SHIFT", action = act.ActivateTabRelative(-1) },
	{ key = "n", mods = "CMD|SHIFT", action = act.ActivateTabRelative(1) },
	{ key = "t", mods = "CMD|SHIFT", action = act.CloseCurrentTab({ confirm = true }) },
	{
		key = "r",
		mods = "CMD|SHIFT",
		action = act.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, _, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
	-- panes
	{
		key = "v",
		mods = "CMD|SHIFT",
		action = act.SplitPane({
			direction = "Right",
			size = { Percent = 50 },
		}),
	},
	{
		key = "b",
		mods = "CMD|SHIFT",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{ key = "h", mods = "CMD|SHIFT", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "CMD|SHIFT", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "CMD|SHIFT", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "CMD|SHIFT", action = act.ActivatePaneDirection("Right") },
	{ key = "x", mods = "CMD|SHIFT", action = act.CloseCurrentPane({ confirm = true }) },
	-- workspaces
	{
		key = "o",
		mods = "CMD|SHIFT",
		action = act.PromptInputLine({
			description = wezterm.format({
				{ Attribute = { Intensity = "Bold" } },
				{ Foreground = { AnsiColor = "Fuchsia" } },
				{ Text = "Enter name for new workspace" },
			}),
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:perform_action(
						act.SwitchToWorkspace({
							name = line,
						}),
						pane
					)
				end
			end),
		}),
	},
}

-- status
-- display active workspace
wezterm.on("update-right-status", function(window)
	local workspace = window:active_workspace()

	window:set_right_status(wezterm.format({
		-- { Text = "test" },
		{ Text = "🖥️ " .. workspace },
	}))
end)

return config
