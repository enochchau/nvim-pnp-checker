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
  for _, root in ipairs(lsp_roots) do
    -- check if workspace root has a yarnrc.yml
    local pnp_path = root .. "/.pnp.cjs"
    if file_exists(pnp_path) then
      return true
    end
  end
end

return {
  check_for_pnp = check_for_pnp
}
