# nvim pnp checker

Function for detecting Yarn PnP during lsp configuration.

## Installation

Using vim-plug

```vimscript
Plug 'ec965/nvim-pnp-checker'
```

Using packer.nvim

```lua
use {
 'ec965/nvim-pnp-checker'
}
```

## Usage

```lua if lsp == "eslint" then
local pnp_checker = require('nvim-pnp-checker')
local nvim_lsp = require("lspconfig")

local servers = {
  "eslint",
}

local opts = {}

local pnp_path = pnp_checker.find_pnp()
if pnp_path then
  opts.cmd = pnp_checker.get_eslint_pnp_cmd(pnp_path)
end
nvim_lsp.eslint.setup(opts)
```

## Documentation

```
find_pnp - returns the path to `.pnp.cjs` if one exists or else `nil`
```
