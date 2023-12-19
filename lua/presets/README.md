# Calvim Presets

Presets are just a calvim configuration preset, for plugins, vim configuration, etc.

You can include a preset by using `require 'presets.<preset name>'`. If you want to create presets
and distribute them, please use this structure:

```
presets/
  <YOUR PRESET NAME>/
    init.lua     # Creation of profiles, setup of runtimepath, etc.
```

`init.lua`:
```lua
local M = {}

local PRESET_PATH = vim.fn.stdpath('config') .. '/presets/<YOUR PRESET NAME>'

function M:init()
    vim.opt.runtimepath:append(PRESET_PATH)

    calvim.plugins:create_profile('')
end

function M:activate()
    -- Activate profiles for plugins, settings, etc.
end

return M
```
