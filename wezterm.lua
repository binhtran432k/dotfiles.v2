-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
config.font = wezterm.font({ family = "Cascadia Code", harfbuzz_features = { "calt=1", "ss01=1" } })

config.color_scheme = "Dracula"
config.window_background_opacity = 0.7
config.text_background_opacity = 0.8
config.window_padding = {
	top = 0,
	left = 0,
	bottom = 0,
	right = 0,
}
config.hide_tab_bar_if_only_one_tab = true
config.warn_about_missing_glyphs = false

-- and finally, return the configuration to wezterm
return config
