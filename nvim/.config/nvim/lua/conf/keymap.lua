-- Configure telescope
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>fd', builtin.find_files, {})
vim.keymap.set('n', '<leader>grep', builtin.live_grep, {})

