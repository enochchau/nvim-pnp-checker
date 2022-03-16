---@param path string file path
---@return boolean
local function file_exists(path)
  local f = io.open(path, "r")
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

local function check_for_pnp()
  local lsp_roots = vim.lsp.buf.list_workspace_folders()
  local has_pnp = true
  for _, root in ipairs(lsp_roots) do
    local pnp_path = root .. "/.pnp.cjs"
    local nm_path = root .. "/node_modules"
    has_pnp = has_pnp and file_exists(pnp_path) and not file_exists(nm_path)
  end
  return has_pnp
end

local function get_pnp_cmd()
  local default_cmd = require('lspconfig.server_configurations.eslint').default_config.cmd
  return { "yarn", "exec", unpack(default_cmd) };
end

return {
  check_for_pnp = check_for_pnp,
  get_pnp_cmd = get_pnp_cmd
}
