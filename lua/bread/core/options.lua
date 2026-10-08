-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Set to true if a Nerd Font is installed and selected in the terminal
vim.g.have_nerd_font = true

-- Set line numbers as default
vim.opt.number = true

-- Set relative line numbers, to help with jumping
vim.opt.relativenumber = true

-- Enable mouse mode; useful for resizing windows
vim.opt.mouse = "a"

-- Disable displaying mode as it can already be seen in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Number of spaces used for each step of (auto)indent
vim.opt.shiftwidth = 4

-- Ask to save instead of failing on :q with unsaved changes
vim.opt.confirm = true

-- Default border for floating windows (hover, signature help, diagnostics)
vim.opt.winborder = "rounded"

-- Set the tabstop to 4 characters
vim.opt.tabstop = 4

-- Set the softtabstop to 4 characters
vim.opt.softtabstop = 4

-- Set expandtab to true, which will convert tabs to spaces
vim.opt.expandtab = true

-- Enable auto-indenting
vim.opt.smartindent = true

-- [[ Diagnostics ]]
-- See `:help vim.diagnostic.config()`
--
-- Change diagnostic symbols in the sign column (gutter)
-- if vim.g.have_nerd_font then
--   local signs = { ERROR = '', WARN = '', INFO = '', HINT = '' }
--   local diagnostic_signs = {}
--   for type, icon in pairs(signs) do
--     diagnostic_signs[vim.diagnostic.severity[type]] = icon
--   end
--   vim.diagnostic.config { signs = { text = diagnostic_signs } }
-- end

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = true,
	},
})

--vim.cmd([[
--        autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focus = false })
--      ]])
