# linenumbers.nvim

Linenumbers.nvim is a simple plugin which automatically switches between relative/hybrid and absolute line numbers based on the current editing mode.

## Installation

To install the plugin, use your favourite plugin manager to clone the repo
and proceed by following the instructions in the [configuration](#Configuration) section.

### Dependencies

- Neovim >= 0.8.0

### Packer.nvim
```lua
use {
  'cschierig/linenumbers.nvim',
  event = 'BufEnter',
  config = function()
    require('twins').setup()
  end
}
```

### Lazy.nvim
```lua
{
  'cschierig/linenumbers.nvim',
  event = 'BufEnter',
  config = true,
}
```

## Configuration

The configuration is a table which is passed as the first argument to the `setup()` function.
It has the following structure:
```lua
{
  -- if false, relative line numbers are used instead of hybrid ones
  hybrid = true
  -- set buftypes (:h buftype) for which the plugin is disabled.
  -- This prevents it from enabling file numbers where not desired, e.g. on a dashboard
  disabled_buftypes = { 'nofile', 'terminal' },
}
```

The default configuration can be found at the beginning of [this file](./lua/linenumbers/init.lua).

## Similar plugins

- [numbers.vim](https://github.com/myusuf3/numbers.vim)
