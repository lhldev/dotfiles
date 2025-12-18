-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open file explorer (:Ex)" })

vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center cursor" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center cursor" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result and center cursor" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result and center cursor" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

vim.keymap.set("n", "<leader>dd", "\"_dd", { desc = "Delete line without yanking" })
vim.keymap.set("v", "<leader>d", "\"_d", { desc = "Delete selection without yanking" })

vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Exit insert mode (Ctrl-C)" })

vim.keymap.set("n", "<leader>r", ":call RunCurrentFile()<CR>", { desc = "Run current file (custom function)" })

vim.keymap.set("n", "<leader>f", ":lua vim.lsp.buf.format({async=true})<CR>", { desc = "Format buffer with LSP" })

vim.keymap.set("v", "<Tab>", ":lua IndentForward()<CR>", { desc = "Indent selection forward (custom)" })
vim.keymap.set("v", "<S-Tab>", ":lua IndentBackward()<CR>", { desc = "Indent selection backward (custom)" })

vim.keymap.set('n', '<leader>p', ':let @+=expand("%:p")<CR>', { desc = "Copy file path to clipboard" })

vim.keymap.set("n", "<leader>c", function()
    vim.cmd("!cmake --fresh -S . -B build")
end, { desc = "Run CMake fresh build" })

vim.keymap.set("n", "<leader>t", ":call RunCTest()<CR>", { desc = "Run CTest (custom function)" })
