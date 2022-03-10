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

---@param bin string bin to look for
---@return string path to bin
local function which(bin)
  local handle = io.popen("which " .. bin)
  local result = handle:read("*all")
  result = string.gsub(result, "%s+", "")
  return result
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
  local eslint_path = which("vscode-eslint-language-server")
  return { "yarn", "node", eslint_path, "--stdio" }
end

return {
  check_for_pnp = check_for_pnp,
  get_pnp_cmd = get_pnp_cmd
}
