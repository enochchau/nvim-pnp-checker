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

```lua  if lsp == "eslint" then
local pnp_checker = require('nvim-pnp-checker')
local nvim_lsp = require("lspconfig")

local servers = {
  "eslint",
}

for _, lsp in ipairs(servers) do
  if lsp == "eslint" then
    if pnp_checker.check_for_pnp() then
      opts.cmd = pnp_checker.get_pnp_cmd() -- <- provides the correct eslint lsp start command
    end
  end

  nvim_lsp[lsp].setup(opts)
end
```

You may also need to disable [`pnpEnableEsmLoader`](https://yarnpkg.com/configuration/yarnrc/#pnpEnableEsmLoader)
in your `.yarnrc.yml`.
