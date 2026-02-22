local function find_toml_parser()
  for _, ext in ipairs({ "so", "dylib", "dll" }) do
    local found = vim.api.nvim_get_runtime_file("parser/toml." .. ext, false)
    if found[1] then
      return found[1]
    end
  end
end

local path = find_toml_parser()
if path then
  vim.treesitter.language.add("dek", { path = path, symbol_name = "toml" })
else
  vim.notify("nvim-dek: toml parser not found, install tree-sitter-toml", vim.log.levels.WARN)
end
