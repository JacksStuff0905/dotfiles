-- Configure telescope
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>fd', builtin.find_files, {})
vim.keymap.set('n', '<leader>gr', builtin.live_grep, {})

-- Configure neotree
vim.keymap.set('n', '<leader>fs', ':Neotree filesystem toggle left<CR>', {})

-- Configure lsp
vim.keymap.set('n', '<leader>dc', vim.lsp.buf.hover, {})
vim.keymap.set('n', '<leader>df', vim.lsp.buf.definition, {})
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

-- Configure formatters
vim.keymap.set('n', '<leader>fr', vim.lsp.buf.format, {})
