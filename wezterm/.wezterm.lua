local wezterm = require("wezterm")

local act = wezterm.action
local config = wezterm.config_builder()

config.term = "wezterm"

-- alt key
config.send_composed_key_when_left_alt_is_pressed = false

-- fish
config.default_prog = { "/opt/homebrew/bin/fish" }

-- general appearance
config.color_scheme = "Catppuccin Mocha"
config.macos_window_background_blur = 20
config.use_fancy_tab_bar = false
config.window_background_opacity = 0.9
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

-- zen mode
wezterm.on("user-var-changed", function(window, pane, name, value)
	local overrides = window:get_config_overrides() or {}
	if name == "ZEN_MODE" then
		local incremental = value:find("+")
		local number_value = tonumber(value)
		if incremental ~= nil then
			while number_value > 0 do
				window:perform_action(wezterm.action.IncreaseFontSize, pane)
				number_value = number_value - 1
			end
			overrides.enable_tab_bar = false
		elseif number_value < 0 then
			window:perform_action(wezterm.action.ResetFontSize, pane)
			overrides.font_size = nil
			overrides.enable_tab_bar = true
		else
			overrides.font_size = number_value
			overrides.enable_tab_bar = false
		end
	end
	window:set_config_overrides(overrides)
end)

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

	window:set_right_status(wezterm.format({
		{ Foreground = { Color = "#c099ff" } },
		{ Text = wezterm.nerdfonts.ple_left_half_circle_thick },
		{ Background = { Color = "#c099ff" } },
		{ Foreground = { Color = "#24283b" } },
		{ Text = time_icon .. " " .. workspace .. " " },
	}))
end)

return config
