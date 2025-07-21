-- Setup telescope
require('telescope').setup {
  -- defaults = {
    -- find_command = { "fd", "--type", "f", "--type", "l" },
    -- file_ignore_patterns = { ".git/", "node_modules/" },
  -- }
}


-- Setup treesitter
local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = { "lua", "python", "c", "cpp" },
  highlight = { enable = true },
  indent = { enable = true },
})
