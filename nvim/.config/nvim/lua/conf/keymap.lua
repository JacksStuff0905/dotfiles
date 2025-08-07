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


-- Configure colorizer
function toggle_colorizer(c)
  if c.is_buffer_attached(0) then c.detach_from_buffer(0) else c.attach_to_buffer(0) end
end

local colorizer = require('colorizer')
vim.keymap.set('n', '<leader>cl', function() toggle_colorizer(colorizer) end, {})


-- Configure window navigation
vim.keymap.set('n', 'H', '<C-w>h', { desc = 'Move to left window' })
vim.keymap.set('n', 'J', '<C-w>j', { desc = 'Move to lower window' })
vim.keymap.set('n', 'K', '<C-w>k', { desc = 'Move to upper window' })
vim.keymap.set('n', 'L', '<C-w>l', { desc = 'Move to right window' })


vim.keymap.set('n', '<leader>bc', '<C-o>', { desc = 'Return to previous window' })
vim.keymap.set('n', '<leader>fw', '<C-i>', { desc = 'Return to next window' })
