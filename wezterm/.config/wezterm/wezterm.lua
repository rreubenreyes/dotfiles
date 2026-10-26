local wezterm = require("wezterm")

local act = wezterm.action
local config = wezterm.config_builder()

config.term = "xterm-256color"


-- allow tiling
config.tiling_desktop_environments = {
	"Aerospace",
}

-- alt key
config.send_composed_key_when_left_alt_is_pressed = false

-- fish
config.default_prog = { "/opt/homebrew/bin/fish" }

-- general appearance
config.color_scheme = "arboreal"
config.macos_window_background_blur = 20
config.use_fancy_tab_bar = false
config.window_background_opacity = 0.8
-- config.window_background_opacity = 1
config.window_decorations = "RESIZE"

-- smooth animations
config.animation_fps = 240
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
config.max_fps = 240

-- font rendering
config.font = wezterm.font("JetBrains Mono", { weight = "Book" })
config.font_size = 14
config.freetype_load_flags = "NO_HINTING"
config.freetype_load_target = "Light"
config.front_end = "WebGpu"

config.keys = {
	-- tabs
	{ key = "h", mods = "SHIFT|ALT", action = act.MoveTabRelative(-1) },
	{ key = "l", mods = "SHIFT|ALT", action = act.MoveTabRelative(1) },
	{ key = "w", mods = "CMD|SHIFT", action = act.ShowTabNavigator },
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

-- display active workspace
wezterm.on("update-right-status", function(window)
	local workspace = window:active_workspace()
	local hour = tonumber(wezterm.strftime("%H"))
	local day = wezterm.strftime("%A")

	local time_icon
	if day == "Saturday" or day == "Sunday" then
		if hour <= 15 then
			time_icon = "✨🌞"
		else
			time_icon = "✨🌚"
		end
	elseif hour <= 4 then -- why am I up this early
		time_icon = "😴🫥🫥🫥🫥"
	elseif hour > 4 and hour <= 10 then -- I probably get to focus
		time_icon = "🫥😎🫥🫥🫥"
	elseif hour > 10 and hour <= 16 then -- normal people hours
		time_icon = "🫥🫥🙂🫥🫥"
	elseif hour > 16 and hour <= 18 then -- :|
		time_icon = "🫥🫥🫥🥲🫥"
	else -- I want to die
		time_icon = "🫥🫥🫥🫥💀"
	end

	if window:is_focused() then
		window:set_right_status(wezterm.format({
			{ Foreground = { Color = "#9cc48c" } },
			{ Text = wezterm.nerdfonts.ple_left_half_circle_thick },
			{ Background = { Color = "#9cc48c" } },
			{ Foreground = { Color = "#2f2f2f" } },
			{ Text = time_icon .. " " .. workspace .. " " },
		}))
	else
		window:set_right_status(wezterm.format({
			{ Foreground = { Color = "#688996" } },
			{ Text = wezterm.nerdfonts.ple_left_half_circle_thick },
			{ Background = { Color = "#688996" } },
			{ Foreground = { Color = "#2f2f2f" } },
			{ Text = time_icon .. " " .. workspace .. " " },
		}))
	end
end)



return config
