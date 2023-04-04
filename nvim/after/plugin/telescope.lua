local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ['<CR>'] = 'select_tab',
                -- for in-place
                ['<C-i>'] = 'select_default'
            }
        }
    }
}
