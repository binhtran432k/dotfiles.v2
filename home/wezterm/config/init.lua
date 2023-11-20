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
-- config.font = wezterm.font({ family = "Cascadia Code", harfbuzz_features = { "calt=1", "ss01=1" } })
local harfbuzz = {
	"calt=1",
	"liga=1",
	"dlig=1",
	-- "ss01=1",
	-- "ss01=1",
	-- "ss02=1",
	-- "ss03=1",
	-- "ss04=1",
	-- "ss05=1",
	-- "ss06=1",
	-- "ss07=1",
	-- "ss08=1",
}
config.font = wezterm.font({ family = "Monaspace Neon", harfbuzz_features = harfbuzz })
config.bold_brightens_ansi_colors = true
config.font_rules = {
	{
		italic = false,
		intensity = "Bold",
		font = wezterm.font({ family = "Monaspace Krypton", weight = "Bold", harfbuzz_features = harfbuzz }),
	},
	{
		italic = false,
		intensity = "Half",
		font = wezterm.font({ family = "Monaspace Krypton", weight = "DemiBold", harfbuzz_features = harfbuzz }),
	},
	{
		italic = true,
		intensity = "Bold",
		font = wezterm.font({
			family = "Monaspace Radon",
			weight = "Bold",
			style = "Italic",
			harfbuzz_features = harfbuzz,
		}),
	},
	{
		italic = true,
		intensity = "Half",
		font = wezterm.font({
			family = "Monaspace Radon",
			weight = "DemiBold",
			style = "Italic",
			harfbuzz_features = harfbuzz,
		}),
	},
	{
		italic = true,
		intensity = "Normal",
		font = wezterm.font({ family = "Monaspace Radon", style = "Italic", harfbuzz_features = harfbuzz }),
	},
}

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
