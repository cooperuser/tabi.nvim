# tabi.nvim

A small plugin that adds the ability to highlight the full width of the indent
under the cursor in normal mode.

#### Current limitations:
- only works with tab indents
- requires neovim with lua support (v0.5+)

## Features
- [x] Highlight selected indent with a set background color
- [x] Vim commands to enable/disable/toggle tabi
- [x] Custom highlight group to override color, `TabiIndent`
- [ ] Configurable settings
  - [ ] Interval between blinks
  - [ ] Number of blink iterations
- [ ] `:help` documentation

## Install

- packer.nvim
```lua
use "cooper-anderson/tabi.nvim"
```

- vim-plug
```vim
Plug "cooper-anderson/tabi.nvim"
```

## Usage

tabi.nvim can be used through the vim command `:Tabi`, but must be customized
with lua.

#### Setup and configuration

```lua
local tabi = require("tabi")

-- Setup and configuration

tabi.setup {
	-- Configurability coming soon
}
```

#### Lua functions

```lua
tabi.toggle()  -- returns true or false depending
               -- on whether it turned on or off

tabi.enable()  -- enables the highlighting of indents
tabie.disable()  -- disables the highlighting of indents
```

#### Vim commands

```vim
:Tabi toggle  " toggles the highlighting of indents
:Tabi         " ^

:Tabi enable  " enables the highlighting of indents
:tabi disable  " disables the highlighting of indents
```

## Screenshots

> Coming soon

