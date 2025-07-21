-- Configure telescope
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-f>', builtin.find_files, {})
vim.keymap.set('n', '<C-g>', builtin.live_grep, {})

-- Configure neotree
vim.keymap.set('n', '<C-t>', ':Neotree filesystem toggle left<CR>', {})
