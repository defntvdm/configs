local wezterm = require("wezterm")
local config = wezterm.config_builder()
config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 14.0
config.font_rules = {
	{
		intensity = "Bold",
		font = wezterm.font("JetBrainsMono Nerd Font", {
			weight = "Bold",
			style = "Normal",
		}),
	},
}

config.keys = {
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
}
config.window_decorations = "RESIZE"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

return config
