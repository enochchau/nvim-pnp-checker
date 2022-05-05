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
	local dir = vim.fn.expand("%:p:h")

	-- might not work on windows
	while dir ~= "/" do
		local pnp_path = dir .. "/.pnp.cjs"
		if file_exists(pnp_path) then
			return true
		end

		dir = vim.fn.fnamemodify(dir, ":h")
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
