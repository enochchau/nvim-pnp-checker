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
		local pnp_path = root .. "/.pnp.cjs"
		local node_modules_path = root .. "/node_modules"

		if file_exists(pnp_path) or not file_exists(node_modules_path) then
			return true
		end
	end
	return false
end

local function get_pnp_cmd()
	local default_cmd = require("lspconfig.server_configurations.eslint").default_config.cmd
	return { "yarn", "exec", unpack(default_cmd) }
end

return {
	check_for_pnp = check_for_pnp,
	get_pnp_cmd = get_pnp_cmd,
}
