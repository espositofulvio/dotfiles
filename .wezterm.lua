local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'Gruvbox Dark (Gogh)'

config.font = wezterm.font 'Iosevka Nerd Font Mono'

config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }

config.font_size = 13.0

return config
