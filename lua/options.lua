-- Numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- UI
vim.opt.showmode = false
vim.opt.signcolumn = 'yes'
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.confirm = true
vim.opt.termguicolors = true

-- Status & Movement feedback
vim.opt.updatetime = 250
vim.opt.timeoutlen = 500

-- Tabs & Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Line Wrapping and Indentation Visuals
vim.opt.wrap = true
vim.opt.breakindent = true

-- Searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

-- Clipboard (set with schedule for startup timing reasons)
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- File & Swap Management
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.swapfile = false
vim.opt.backup = false

-- Split Windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Listchars: whitespace visualization
vim.opt.list = true
vim.opt.listchars = { tab = '  ', trail = '·', nbsp = '␣' }

-- Special characters in filenames
vim.opt.isfname:append("@-@")

-- Extra
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.schedule(function()
      vim.cmd("nohlsearch")
    end)
  end,
  desc = "Clear highlights AFTER the buffer switch is complete",
})
