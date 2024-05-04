local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()
config.color_scheme = "nightfox"
config.default_cursor_style = "SteadyBar"
local defaultFontFamily = "MesloLGM Nerd Font Mono"
config.font = wezterm.font(defaultFontFamily)
config.font_size = 14.0
config.font_rules = {
	{
		intensity = "Bold",
		italic = false,
		font = wezterm.font(defaultFontFamily, {
			weight = "Bold",
			italic = false,
			style = "Normal",
		}),
	},
	{
		intensity = "Bold",
		italic = true,
		font = wezterm.font(defaultFontFamily, {
			weight = "Bold",
			italic = true,
		}),
	},
}

config.keys = {
	{
		key = "m",
		mods = "CMD",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "LeftArrow",
		mods = "OPT",
		action = wezterm.action.SendString("\x1bb"),
	},
	{
		key = "RightArrow",
		mods = "OPT",
		action = wezterm.action.SendString("\x1bf"),
	},
	{
		key = "r",
		mods = "CMD",
		action = act.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, _, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
}
config.window_decorations = "RESIZE"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

return config
