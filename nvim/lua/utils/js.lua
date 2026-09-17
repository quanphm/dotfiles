local M = {}

--- Walk upward from `from`, returning the nearest directory containing any of `markers`.
--- Markers may be plain names (".git") or nested paths ("node_modules/.bin/oxlint").
---@param from string
---@param markers string[]
---@return string|nil
function M.find_upward(from, markers)
	if from == nil or from == "" then
		return nil
	end
	local dir = from
	if vim.fn.isdirectory(dir) == 0 then
		dir = vim.fs.dirname(dir)
	end
	local prev = nil
	while dir and dir ~= prev do
		for _, marker in ipairs(markers) do
			local candidate = vim.fs.joinpath(dir, marker)
			if vim.fn.filereadable(candidate) == 1 or vim.fn.isdirectory(candidate) == 1 then
				return dir
			end
		end
		prev = dir
		dir = vim.fs.dirname(dir)
	end
	return nil
end

--- Major version of the workspace TypeScript, or nil when none is installed.
---@param cwd string|nil defaults to the current working directory
---@return integer|nil
function M.ts_major(cwd)
	local dir = M.find_upward(cwd or vim.fn.getcwd(), { "node_modules/typescript/package.json" })
	if not dir then
		return nil
	end
	local pkg = vim.fs.joinpath(dir, "node_modules", "typescript", "package.json")
	local ok, data = pcall(vim.json.decode, table.concat(vim.fn.readfile(pkg), "\n"))
	if ok and type(data) == "table" and type(data.version) == "string" then
		return tonumber(data.version:match("^(%d+)"))
	end
	return nil
end

return M
