# nvim pnp checker

Utility functions for detecting yarn pnp when starting nvim lsp.

Example usage:

```lua  if lsp == "eslint" then
local pnp_checker = require('nvim-pnp-checker')
local nvim_lsp = require("lspconfig")

local servers = {
  "eslint",
}

for _, lsp in ipairs(servers) do
  if lsp == "eslint" then
    if pnp_checker.check_for_pnp() then
      opts.cmd = pnp_checker.get_pnp_cmd()
    end
  end

  nvim_lsp[lsp].setup(opts)
end
```
