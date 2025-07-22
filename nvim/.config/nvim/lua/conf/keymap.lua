-- Configure telescope
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-f>', builtin.find_files, {})
vim.keymap.set('n', '<C-g>', builtin.live_grep, {})

-- Configure neotree
vim.keymap.set('n', '<C-t>', ':Neotree filesystem toggle left<CR>', {})

-- Configure lsp
vim.keymap.set('n', 'H', vim.lsp.buf.hover, {})
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
