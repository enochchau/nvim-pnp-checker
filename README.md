# nvim pnp checker

Functions for detecting Yarn PnP during lsp configuration.

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

for _, lsp in ipairs(servers) do
  if lsp == "eslint" then
    local pnp_path = pnp_checker.find_pnp()
    if pnp_path then
        opts.cmd = pnp_checker.get_pnp_cmd(pnp_path) -- <- provides the correct eslint lsp start command
    end
  end

  nvim_lsp[lsp].setup(opts)
end
```
