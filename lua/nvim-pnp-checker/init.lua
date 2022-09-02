local M = {}

--- check for `.pnp.cjs`
---@return string|nil path to `.pnp.cjs` or nil if not found
M.find_pnp = function()
	local res = vim.fs.find(".pnp.cjs", { upward = true, limit = 1 })
	if #res > 0 then
		return res[1]
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
