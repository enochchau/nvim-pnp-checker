local M = {}

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

--- check for `.pnp.cjs`
---@return string|nil path to `.pnp.cjs` or nil if not found
M.find_pnp = function()
	local dir = vim.fn.expand("%:p:h")

	-- might not work on windows
	while dir ~= "/" do
		local pnp_path = dir .. "/.pnp.cjs"
		if file_exists(pnp_path) then
			return pnp_path
		end

		dir = vim.fn.fnamemodify(dir, ":h")
	end

	return nil
end

--- get the cmd to use for eslint
---@param pnp_path string path to `.pnp.cjs`
---@return table cmd for eslint lsp server
M.get_eslint_pnp_cmd = function(pnp_path)
	return {
		"node",
		"-r",
		pnp_path,
		vim.fn.system("which vscode-eslint-language-server"):gsub("%s+", ""),
		"--stdio",
	}
end

return M
