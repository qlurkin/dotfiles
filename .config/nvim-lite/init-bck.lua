-- ================================================================================================
-- title : Suckless NeoVim Config
-- author: Radley E. Sidwell-lewis
-- ================================================================================================

-- Basic settings
vim.opt.number = true -- Line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.cursorline = true -- Highlight current line
vim.opt.wrap = false -- Don't wrap lines
vim.opt.scrolloff = 8 -- Keep 8 lines above/below cursor
vim.opt.sidescrolloff = 8 -- Keep 8 columns left/right of cursor

-- Indentation
vim.opt.tabstop = 2 -- Tab width
vim.opt.shiftwidth = 2 -- Indent width
vim.opt.softtabstop = 2 -- Soft tab stop
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.smartindent = true -- Smart auto-indenting
vim.opt.autoindent = true -- Copy indent from current line

-- Search settings
vim.opt.ignorecase = true -- Case insensitive search
vim.opt.smartcase = true -- Case sensitive if uppercase in search
vim.opt.hlsearch = false -- Don't highlight search results
vim.opt.incsearch = true -- Show matches as you type

-- Visual settings
vim.opt.background = "dark"
vim.opt.termguicolors = true -- Enable 24-bit colors
vim.opt.signcolumn = "yes" -- Always show sign column
vim.opt.colorcolumn = "100" -- Show column at 100 characters
vim.opt.showmatch = true -- Highlight matching brackets
vim.opt.matchtime = 2 -- How long to show matching bracket
vim.opt.cmdheight = 1 -- Command line height
vim.opt.completeopt = "menuone,noinsert,noselect" -- Completion options
vim.opt.showmode = false -- Don't show mode in command line
vim.opt.pumheight = 10 -- Popup menu height
vim.opt.pumblend = 10 -- Popup menu transparency
vim.opt.winblend = 0 -- Floating window transparency
vim.opt.conceallevel = 0 -- Don't hide markup
vim.opt.concealcursor = "" -- Don't hide cursor line markup
vim.opt.lazyredraw = true -- Don't redraw during macros
vim.opt.synmaxcol = 300 -- Syntax highlighting limit
vim.opt.fillchars = { eob = " " } -- Hide ~ on empty lines

-- Create undo directory if it doesn't exist
local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p")
end

-- File handling
vim.opt.backup = false -- Don't create backup files
vim.opt.writebackup = false -- Don't create backup before writing
vim.opt.swapfile = false -- Don't create swap files
vim.opt.undofile = true -- Persistent undo
vim.opt.undodir = vim.fn.expand("~/.vim/undodir") -- Undo directory
vim.opt.updatetime = 300 -- Faster completion
vim.opt.timeoutlen = 500 -- Key timeout duration
vim.opt.ttimeoutlen = 0 -- Key code timeout
vim.opt.autoread = true -- Auto reload files changed outside vim
vim.opt.autowrite = false -- Don't auto save

-- Behavior settings
vim.opt.hidden = true -- Allow hidden buffers
vim.opt.errorbells = false -- No error bells
vim.opt.backspace = "indent,eol,start" -- Better backspace behavior
vim.opt.autochdir = false -- Don't auto change directory
vim.opt.iskeyword:append("-") -- Treat dash as part of word
vim.opt.path:append("**") -- include subdirectories in search
vim.opt.selection = "exclusive" -- Selection behavior
vim.opt.mouse = "a" -- Enable mouse support
vim.opt.clipboard:append("unnamedplus") -- Use system clipboard
vim.opt.modifiable = true -- Allow buffer modifications
vim.opt.encoding = "UTF-8" -- Set encoding

-- Cursor settings
-- vim.opt.guicursor =
--	"n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

-- Folding settings
vim.opt.foldmethod = "expr" -- Use expression for folding
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- Use treesitter for folding
vim.opt.foldlevel = 99 -- Start with all folds open

-- Split behavior
vim.opt.splitbelow = true -- Horizontal splits go below
vim.opt.splitright = true -- Vertical splits go right

-- Key mappings
vim.g.mapleader = " " -- Set leader key to space
vim.g.maplocalleader = " " -- Set local leader key (NEW)

-- Normal mode mappings
vim.keymap.set("n", "<leader>c", ":nohlsearch<CR>", { desc = "Clear search highlights" })

-- Y to EOL
vim.keymap.set("n", "Y", "y$", { desc = "Yank to end of line" })

-- Center screen when jumping
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- Better paste behavior
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without yanking" })

-- Delete without yanking
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yanking" })

-- Buffer navigation
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Splitting & Resizing
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" })
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Move lines up/down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Better indenting in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Quick file navigation
vim.keymap.set("n", "<leader>e", ":Explore<CR>", { desc = "Open file explorer" })
vim.keymap.set("n", "<leader>ff", ":find ", { desc = "Find file" })

-- Better J behavior
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

-- Quick config editing
vim.keymap.set("n", "<leader>rc", ":e $MYVIMRC<CR>", { desc = "Edit config" })
vim.keymap.set("n", "<leader>rl", ":so $MYVIMRC<CR>", { desc = "Reload config" })

-- ============================================================================
-- USEFUL FUNCTIONS
-- ============================================================================

-- Copy Full File-Path
vim.keymap.set("n", "<leader>pa", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	print("file:", path)
end)

-- Basic autocommands
local augroup = vim.api.nvim_create_augroup("UserConfig", {})

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup,
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd("BufReadPost", {
	group = augroup,
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		local line = mark[1]
		local ft = vim.bo.filetype
		if
			line > 0
			and line <= lcount
			and vim.fn.index({ "commit", "gitrebase", "xxd" }, ft) == -1
			and not vim.o.diff
		then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- Set filetype-specific settings
vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	pattern = { "lua", "python" },
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.shiftwidth = 4
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	pattern = { "javascript", "typescript", "json", "html", "css" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
	end,
})

-- Auto-close terminal when process exits
vim.api.nvim_create_autocmd("TermClose", {
	group = augroup,
	callback = function()
		if vim.v.event.status == 0 then
			vim.api.nvim_buf_delete(0, {})
		end
	end,
})

-- Disable line numbers in terminal
vim.api.nvim_create_autocmd("TermOpen", {
	group = augroup,
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.opt_local.signcolumn = "no"
	end,
})

-- Auto-resize splits when window is resized
vim.api.nvim_create_autocmd("VimResized", {
	group = augroup,
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

-- Create directories when saving files
vim.api.nvim_create_autocmd("BufWritePre", {
	group = augroup,
	callback = function()
		local dir = vim.fn.expand("<afile>:p:h")
		if vim.fn.isdirectory(dir) == 0 then
			vim.fn.mkdir(dir, "p")
		end
	end,
})

-- Command-line completion
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.wildignore:append({ "*.o", "*.obj", "*.pyc", "*.class", "*.jar" })

-- Better diff options
vim.opt.diffopt:append("linematch:60")

-- Performance improvements
vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 20000

-- ============================================================================
-- FLOATING TERMINAL
-- ============================================================================

-- terminal
local terminal_state = {
	buf = nil,
	win = nil,
	is_open = false,
}

local function FloatingTerminal()
	-- If terminal is already open, close it (toggle behavior)
	if terminal_state.is_open and vim.api.nvim_win_is_valid(terminal_state.win) then
		vim.api.nvim_win_close(terminal_state.win, false)
		terminal_state.is_open = false
		return
	end

	-- Create buffer if it doesn't exist or is invalid
	if not terminal_state.buf or not vim.api.nvim_buf_is_valid(terminal_state.buf) then
		terminal_state.buf = vim.api.nvim_create_buf(false, true)
		-- Set buffer options for better terminal experience
		vim.bo[terminal_state.buf].bufhidden = "hide"
	end

	-- Calculate window dimensions
	local width = math.floor(vim.o.columns * 0.8)
	local height = math.floor(vim.o.lines * 0.8)
	local row = math.floor((vim.o.lines - height) / 2)
	local col = math.floor((vim.o.columns - width) / 2)

	-- Create the floating window
	terminal_state.win = vim.api.nvim_open_win(terminal_state.buf, true, {
		relative = "editor",
		width = width,
		height = height,
		row = row,
		col = col,
		style = "minimal",
		border = "rounded",
	})

	-- Set transparency for the floating window
	vim.wo[terminal_state.win].winblend = 0
	vim.wo[terminal_state.win].winhighlight = "Normal:FloatingTermNormal,FloatBorder:FloatingTermBorder"

	-- Define highlight groups for transparency
	vim.api.nvim_set_hl(0, "FloatingTermNormal", { bg = "none" })
	vim.api.nvim_set_hl(0, "FloatingTermBorder", { bg = "none" })

	-- Start terminal if not already running
	local has_terminal = false
	local lines = vim.api.nvim_buf_get_lines(terminal_state.buf, 0, -1, false)
	for _, line in ipairs(lines) do
		if line ~= "" then
			has_terminal = true
			break
		end
	end

	if not has_terminal then
		vim.fn.termopen(os.getenv("SHELL"))
	end

	terminal_state.is_open = true
	vim.cmd("startinsert")

	-- Set up auto-close on buffer leave
	vim.api.nvim_create_autocmd("BufLeave", {
		buffer = terminal_state.buf,
		callback = function()
			if terminal_state.is_open and vim.api.nvim_win_is_valid(terminal_state.win) then
				vim.api.nvim_win_close(terminal_state.win, false)
				terminal_state.is_open = false
			end
		end,
		once = true,
	})
end

-- Function to explicitly close the terminal
local function CloseFloatingTerminal()
	if terminal_state.is_open and vim.api.nvim_win_is_valid(terminal_state.win) then
		vim.api.nvim_win_close(terminal_state.win, false)
		terminal_state.is_open = false
	end
end

-- Key mappings
vim.keymap.set("n", "<leader>t", FloatingTerminal, { noremap = true, silent = true, desc = "Toggle floating terminal" })
vim.keymap.set("t", "<Esc>", function()
	if terminal_state.is_open then
		vim.api.nvim_win_close(terminal_state.win, false)
		terminal_state.is_open = false
	end
end, { noremap = true, silent = true, desc = "Close floating terminal from terminal mode" })

-- ============================================================================
-- TABS
-- ============================================================================

-- Tab display settings
vim.opt.showtabline = 1 -- Always show tabline (0=never, 1=when multiple tabs, 2=always)
vim.opt.tabline = "" -- Use default tabline (empty string uses built-in)

-- Alternative navigation (more intuitive)
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", { desc = "New tab" })
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close tab" })

-- Tab moving
vim.keymap.set("n", "<leader>tm", ":tabmove<CR>", { desc = "Move tab" })
vim.keymap.set("n", "<leader>t>", ":tabmove +1<CR>", { desc = "Move tab right" })
vim.keymap.set("n", "<leader>t<", ":tabmove -1<CR>", { desc = "Move tab left" })

-- Function to open file in new tab
local function open_file_in_tab()
	vim.ui.input({ prompt = "File to open in new tab: ", completion = "file" }, function(input)
		if input and input ~= "" then
			vim.cmd("tabnew " .. input)
		end
	end)
end

-- Function to duplicate current tab
local function duplicate_tab()
	local current_file = vim.fn.expand("%:p")
	if current_file ~= "" then
		vim.cmd("tabnew " .. current_file)
	else
		vim.cmd("tabnew")
	end
end

-- Function to close tabs to the right
local function close_tabs_right()
	local current_tab = vim.fn.tabpagenr()
	local last_tab = vim.fn.tabpagenr("$")

	for i = last_tab, current_tab + 1, -1 do
		vim.cmd(i .. "tabclose")
	end
end

-- Function to close tabs to the left
local function close_tabs_left()
	local current_tab = vim.fn.tabpagenr()

	for i = current_tab - 1, 1, -1 do
		vim.cmd("1tabclose")
	end
end

-- Enhanced keybindings
vim.keymap.set("n", "<leader>tO", open_file_in_tab, { desc = "Open file in new tab" })
vim.keymap.set("n", "<leader>td", duplicate_tab, { desc = "Duplicate current tab" })
vim.keymap.set("n", "<leader>tr", close_tabs_right, { desc = "Close tabs to the right" })
vim.keymap.set("n", "<leader>tL", close_tabs_left, { desc = "Close tabs to the left" })

-- Function to close buffer but keep tab if it's the only buffer in tab
local function smart_close_buffer()
	local buffers_in_tab = #vim.fn.tabpagebuflist()
	if buffers_in_tab > 1 then
		vim.cmd("bdelete")
	else
		-- If it's the only buffer in tab, close the tab
		vim.cmd("tabclose")
	end
end
vim.keymap.set("n", "<leader>bd", smart_close_buffer, { desc = "Smart close buffer/tab" })

-- ============================================================================
-- STATUSLINE
-- ============================================================================

-- Git branch function with caching and Nerd Font icon
local cached_branch = ""
local last_check = 0
local function git_branch()
	local now = vim.loop.now()
	if now - last_check > 5000 then -- Check every 5 seconds
		cached_branch = vim.fn.system("git branch --show-current 2>/dev/null | tr -d '\n'")
		last_check = now
	end
	if cached_branch ~= "" then
		return " \u{e725} " .. cached_branch .. " " -- nf-dev-git_branch
	end
	return ""
end

-- File type with Nerd Font icon
local function file_type()
	local ft = vim.bo.filetype
	local icons = {
		lua = "\u{e620} ", -- nf-dev-lua
		python = "\u{e73c} ", -- nf-dev-python
		javascript = "\u{e74e} ", -- nf-dev-javascript
		typescript = "\u{e628} ", -- nf-dev-typescript
		javascriptreact = "\u{e7ba} ",
		typescriptreact = "\u{e7ba} ",
		html = "\u{e736} ", -- nf-dev-html5
		css = "\u{e749} ", -- nf-dev-css3
		scss = "\u{e749} ",
		json = "\u{e60b} ", -- nf-dev-json
		markdown = "\u{e73e} ", -- nf-dev-markdown
		vim = "\u{e62b} ", -- nf-dev-vim
		sh = "\u{f489} ", -- nf-oct-terminal
		bash = "\u{f489} ",
		zsh = "\u{f489} ",
		rust = "\u{e7a8} ", -- nf-dev-rust
		go = "\u{e724} ", -- nf-dev-go
		c = "\u{e61e} ", -- nf-dev-c
		cpp = "\u{e61d} ", -- nf-dev-cplusplus
		java = "\u{e738} ", -- nf-dev-java
		php = "\u{e73d} ", -- nf-dev-php
		ruby = "\u{e739} ", -- nf-dev-ruby
		swift = "\u{e755} ", -- nf-dev-swift
		kotlin = "\u{e634} ",
		dart = "\u{e798} ",
		elixir = "\u{e62d} ",
		haskell = "\u{e777} ",
		sql = "\u{e706} ",
		yaml = "\u{f481} ",
		toml = "\u{e615} ",
		xml = "\u{f05c} ",
		dockerfile = "\u{f308} ", -- nf-linux-docker
		gitcommit = "\u{f418} ", -- nf-oct-git_commit
		gitconfig = "\u{f1d3} ", -- nf-fa-git
		vue = "\u{fd42} ", -- nf-md-vuejs
		svelte = "\u{e697} ",
		astro = "\u{e628} ",
	}

	if ft == "" then
		return " \u{f15b} " -- nf-fa-file_o
	end

	return (icons[ft] or " \u{f15b} " .. ft)
end

-- File size with Nerd Font icon
local function file_size()
	local size = vim.fn.getfsize(vim.fn.expand("%"))
	if size < 0 then
		return ""
	end

	local size_str
	if size < 1024 then
		size_str = size .. "B"
	elseif size < 1024 * 1024 then
		size_str = string.format("%.1fK", size / 1024)
	else
		size_str = string.format("%.1fM", size / 1024 / 1024)
	end

	return " \u{f016} " .. size_str .. " " -- nf-fa-file_o
end

-- Mode indicators with Nerd Font icons
local function mode_icon()
	local mode = vim.fn.mode()
	local modes = {
		n = " \u{f040} NORMAL", -- nf-fa-pencil
		i = " \u{f303} INSERT", -- nf-linux-vim
		v = " \u{f06e} VISUAL", -- nf-fa-eye
		V = " \u{f06e} V-LINE",
		["\22"] = " \u{f06e} V-BLOCK", -- Ctrl-V
		c = " \u{f120} COMMAND", -- nf-fa-terminal
		s = " \u{f0c5} SELECT", -- nf-fa-files_o
		S = " \u{f0c5} S-LINE",
		["\19"] = " \u{f0c5} S-BLOCK", -- Ctrl-S
		R = " \u{f044} REPLACE", -- nf-fa-edit
		r = " \u{f044} REPLACE",
		["!"] = " \u{f489} SHELL", -- nf-oct-terminal
		t = " \u{f120} TERMINAL", -- nf-fa-terminal
	}
	return modes[mode] or " \u{f059} " .. mode:upper() -- nf-fa-question_circle
end

_G.mode_icon = mode_icon
_G.git_branch = git_branch
_G.file_type = file_type
_G.file_size = file_size

vim.cmd([[
  highlight StatusLineBold gui=bold cterm=bold
]])

-- Function to change statusline based on window focus
local function setup_dynamic_statusline()
	vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
		callback = function()
			vim.opt_local.statusline = table.concat({
				"  ",
				"%#StatusLineBold#",
				"%{v:lua.mode_icon()}",
				"%#StatusLine#",
				" \u{e0b1} %f %h%m%r", -- nf-pl-left_hard_divider
				"%{v:lua.git_branch()}",
				"\u{e0b1} ", -- nf-pl-left_hard_divider
				"%{v:lua.file_type()}",
				"\u{e0b1} ", -- nf-pl-left_hard_divider
				"%{v:lua.file_size()}",
				"%=", -- Right-align everything after this
				" \u{f017} %l:%c  %P ", -- nf-fa-clock_o for line/col
			})
		end,
	})
	vim.api.nvim_set_hl(0, "StatusLineBold", { bold = true })

	vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
		callback = function()
			vim.opt_local.statusline = "  %f %h%m%r \u{e0b1} %{v:lua.file_type()} %=  %l:%c   %P "
		end,
	})
end

setup_dynamic_statusline()

-- ============================================================================
-- LSP CONFIGURATION
-- ============================================================================

-- LSP settings
local function setup_lsp()
	-- Show diagnostic signs in the gutter
	local signs = {
		Error = "\u{f06a} ", -- nf-fa-exclamation_circle
		Warn = "\u{f071} ", -- nf-fa-exclamation_triangle
		Hint = "\u{f0eb} ", -- nf-fa-lightbulb_o
		Info = "\u{f05a} ", -- nf-fa-info_circle
	}

	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end

	-- Diagnostic configuration
	vim.diagnostic.config({
		virtual_text = {
			prefix = "●",
			spacing = 4,
		},
		signs = true,
		underline = true,
		update_in_insert = false,
		severity_sort = true,
		float = {
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	})

	-- LSP keymaps (set when LSP attaches)
	vim.api.nvim_create_autocmd("LspAttach", {
		group = augroup,
		callback = function(ev)
			local opts = { buffer = ev.buf }
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
			vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
			vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
			vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
			vim.keymap.set("n", "<leader>f", function()
				vim.lsp.buf.format({ async = true })
			end, opts)
		end,
	})

	-- Floating window borders
	local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
	function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
		opts = opts or {}
		opts.border = opts.border or "rounded"
		return orig_util_open_floating_preview(contents, syntax, opts, ...)
	end
end

-- LSP diagnostic keymaps (always available)
vim.keymap.set("n", "pd", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
vim.keymap.set("n", "nd", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic list" })
vim.keymap.set("n", "<leader>dl", vim.diagnostic.open_float, { desc = "Show line diagnostics" })

setup_lsp()

-- ============================================================================
-- BUFFER/FILE UTILITIES
-- ============================================================================

-- Close all buffers except current
vim.keymap.set("n", "<leader>bo", ":%bd|e#|bd#<CR>", { desc = "Close all buffers except current" })

-- Rename current file
vim.keymap.set("n", "<leader>rr", function()
	local old_name = vim.fn.expand("%")
	local new_name = vim.fn.input("New file name: ", old_name)
	if new_name ~= "" and new_name ~= old_name then
		vim.cmd("saveas " .. new_name)
		vim.fn.delete(old_name)
		print("File renamed to: " .. new_name)
	end
end, { desc = "Rename current file" })

-- Copy file path variations
vim.keymap.set("n", "<leader>pf", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	print("Full path: " .. path)
end, { desc = "Copy full file path" })

vim.keymap.set("n", "<leader>pr", function()
	local path = vim.fn.expand("%")
	vim.fn.setreg("+", path)
	print("Relative path: " .. path)
end, { desc = "Copy relative file path" })




-- colors

local colors = {
   bg = "#282A36",
   fg = "#F8F8F2",
   selection = "#44475A",
   comment = "#6272A4",
   red = "#FF5555",
   orange = "#FFB86C",
   yellow = "#F1FA8C",
   green = "#50fa7b",
   purple = "#BD93F9",
   cyan = "#8BE9FD",
   pink = "#FF79C6",
   bright_red = "#FF6E6E",
   bright_green = "#69FF94",
   bright_yellow = "#FFFFA5",
   bright_blue = "#D6ACFF",
   bright_magenta = "#FF92DF",
   bright_cyan = "#A4FFFF",
   bright_white = "#FFFFFF",
   menu = "#21222C",
   visual = "#3E4452",
   gutter_fg = "#4B5263",
   nontext = "#3B4048",
   white = "#ABB2BF",
   black = "#191A21",
}



vim.g.terminal_color_0 = colors.black
vim.g.terminal_color_1 = colors.red
vim.g.terminal_color_2 = colors.green
vim.g.terminal_color_3 = colors.yellow
vim.g.terminal_color_4 = colors.purple
vim.g.terminal_color_5 = colors.pink
vim.g.terminal_color_6 = colors.cyan
vim.g.terminal_color_7 = colors.white
vim.g.terminal_color_8 = colors.selection
vim.g.terminal_color_9 = colors.bright_red
vim.g.terminal_color_10 = colors.bright_green
vim.g.terminal_color_11 = colors.bright_yellow
vim.g.terminal_color_12 = colors.bright_blue
vim.g.terminal_color_13 = colors.bright_magenta
vim.g.terminal_color_14 = colors.bright_cyan
vim.g.terminal_color_15 = colors.bright_white
vim.g.terminal_color_background = colors.bg
vim.g.terminal_color_foreground = colors.fg

local groups = {
      Normal = { fg = colors.fg, bg = colors.bg, },
      NormalFloat = { fg = colors.fg, bg = colors.bg, },
      Comment = { fg = colors.comment, },
      Constant = { fg = colors.yellow, },
      String = { fg = colors.yellow, },
      Character = { fg = colors.green, },
      Number = { fg = colors.orange, },
      Boolean = { fg = colors.cyan, },
      Float = { fg = colors.orange, },
      FloatBorder = { fg = colors.white, },
      Operator = { fg = colors.purple, },
      Keyword = { fg = colors.cyan, },
      Keywords = { fg = colors.cyan, },
      Identifier = { fg = colors.cyan, },
      Function = { fg = colors.yellow, },
      Statement = { fg = colors.purple, },
      Conditional = { fg = colors.pink, },
      Repeat = { fg = colors.pink, },
      Label = { fg = colors.cyan, },
      Exception = { fg = colors.purple, },
      PreProc = { fg = colors.yellow, },
      Include = { fg = colors.purple, },
      Define = { fg = colors.purple, },
      Title = { fg = colors.cyan, },
      Macro = { fg = colors.purple, },
      PreCondit = { fg = colors.cyan, },
      Type = { fg = colors.cyan, },
      StorageClass = { fg = colors.pink, },
      Structure = { fg = colors.yellow, },
      TypeDef = { fg = colors.yellow, },
      Special = { fg = colors.green, italic = true },
      SpecialComment = { fg = colors.comment, italic = true, },
      Error = { fg = colors.bright_red, },
      Todo = { fg = colors.purple, bold = true, italic = true, },
      Underlined = { fg = colors.cyan, underline = true, },

      Cursor = { reverse = true, },
      CursorLineNr = { fg = colors.fg, bold = true, },

      SignColumn = { bg = colors.bg, },

      Conceal = { fg = colors.comment, },
      CursorColumn = { bg = colors.black, },
      CursorLine = { bg = colors.selection, },
      ColorColumn = { bg = colors.selection, },

      StatusLine = { fg = colors.white, bg = colors.selection, },
      StatusLineNC = { fg = colors.comment, },
      StatusLineTerm = { fg = colors.white, bg = colors.black, },
      StatusLineTermNC = { fg = colors.comment, },

      Directory = { fg = colors.cyan, },
      DiffAdd = { fg = colors.bg, bg = colors.green, },
      DiffChange = { fg = colors.orange, },
      DiffDelete = { fg = colors.red, },
      DiffText = { fg = colors.comment, },

      ErrorMsg = { fg = colors.bright_red, },
      VertSplit = { fg = colors.black, },
      WinSeparator = { fg = colors.black, },
      Folded = { fg = colors.comment, },
      FoldColumn = {},
      Search = { fg = colors.black, bg = colors.orange, },
      IncSearch = { fg = colors.orange, bg = colors.comment, },
      LineNr = { fg = colors.comment, },
      MatchParen = { fg = colors.fg, underline = true, },
      NonText = { fg = colors.nontext, },
      Pmenu = { fg = colors.white, bg = colors.menu, },
      PmenuSel = { fg = colors.white, bg = colors.selection, },
      PmenuSbar = { bg = colors.bg, },
      PmenuThumb = { bg = colors.selection, },

      Question = { fg = colors.purple, },
      QuickFixLine = { fg = colors.black, bg = colors.yellow, },
      SpecialKey = { fg = colors.nontext, },

      SpellBad = { fg = colors.bright_red, underline = true, },
      SpellCap = { fg = colors.yellow, },
      SpellLocal = { fg = colors.yellow, },
      SpellRare = { fg = colors.yellow, },

      TabLine = { fg = colors.comment, },
      TabLineSel = { fg = colors.white, },
      TabLineFill = { bg = colors.bg, },
      Terminal = { fg = colors.white, bg = colors.black, },
      Visual = { bg = colors.visual, },
      VisualNOS = { fg = colors.visual, },
      WarningMsg = { fg = colors.yellow, },
      WildMenu = { fg = colors.black, bg = colors.white, },

      EndOfBuffer = endOfBuffer,

      -- TreeSitter
      ['@error'] = { fg = colors.bright_red, },
      ['@punctuation.delimiter'] = { fg = colors.fg, },
      ['@punctuation.bracket'] = { fg = colors.fg, },
      ['@markup.list'] = { fg = colors.cyan, },

      ['@constant'] = { fg = colors.purple, },
      ['@constant.builtin'] = { fg = colors.purple, },
      ['@markup.link.label.symbol'] = { fg = colors.purple, },

      ['@constant.macro'] = { fg = colors.cyan, },
      ['@string.regexp'] = { fg = colors.red, },
      ['@string'] = { fg = colors.yellow, },
      ['@string.escape'] = { fg = colors.cyan, },
      ['@string.special.symbol'] = { fg = colors.purple, },
      ['@character'] = { fg = colors.green, },
      ['@number'] = { fg = colors.purple, },
      ['@boolean'] = { fg = colors.purple, },
      ['@number.float'] = { fg = colors.green, },
      ['@annotation'] = { fg = colors.yellow, },
      ['@attribute'] = { fg = colors.cyan, },
      ['@module'] = { fg = colors.orange, },

      ['@function.builtin'] = { fg = colors.cyan, },
      ['@function'] = { fg = colors.green, },
      ['@function.macro'] = { fg = colors.green, },
      ['@variable.parameter'] = { fg = colors.orange, },
      ['@variable.parameter.reference'] = { fg = colors.orange, },
      ['@function.method'] = { fg = colors.green, },
      ['@variable.member'] = { fg = colors.orange, },
      ['@property'] = { fg = colors.purple, },
      ['@constructor'] = { fg = colors.cyan, },

      ['@keyword.conditional'] = { fg = colors.pink, },
      ['@keyword.repeat'] = { fg = colors.pink, },
      ['@label'] = { fg = colors.cyan, },

      ['@keyword'] = { fg = colors.pink, },
      ['@keyword.function'] = { fg = colors.cyan, },
      ['@keyword.function.ruby'] = { fg = colors.pink, },
      ['@keyword.operator'] = { fg = colors.pink, },
      ['@operator'] = { fg = colors.pink, },
      ['@keyword.exception'] = { fg = colors.purple, },
      ['@type'] = { fg = colors.bright_cyan, },
      ['@type.builtin'] = { fg = colors.cyan, italic = true, },
      ['@type.qualifier'] = { fg = colors.pink, },
      ['@structure'] = { fg = colors.purple, },
      ['@keyword.include'] = { fg = colors.pink, },

      ['@variable'] = { fg = colors.fg, },
      ['@variable.builtin'] = { fg = colors.purple, },

      ['@markup'] = { fg = colors.orange, },
      ['@markup.strong'] = { fg = colors.orange, bold = true, },     -- bold
      ['@markup.emphasis'] = { fg = colors.yellow, italic = true, }, -- italic
      ['@markup.underline'] = { fg = colors.orange, },
      ['@markup.heading'] = { fg = colors.pink, bold = true, },        -- title
      ['@markup.raw'] = { fg = colors.yellow, },                 -- inline code
      ['@markup.link.url'] = { fg = colors.yellow, italic = true, },      -- urls
      ['@markup.link'] = { fg = colors.orange, bold = true, },

      ['@tag'] = { fg = colors.cyan, },
      ['@tag.attribute'] = { fg = colors.green, },
      ['@tag.delimiter'] = { fg = colors.cyan, },

      -- Semantic
      ['@class'] = { fg = colors.cyan },
      ['@struct'] = { fg = colors.cyan },
      ['@enum'] = { fg = colors.cyan },
      ['@enumMember'] = { fg = colors.purple },
      ['@event'] = { fg = colors.cyan },
      ['@interface'] = { fg = colors.cyan },
      ['@modifier'] = { fg = colors.cyan },
      ['@regexp'] = { fg = colors.yellow },
      ['@typeParameter'] = { fg = colors.cyan },
      ['@decorator'] = { fg = colors.cyan },

      -- LSP Semantic (0.9+)
      ['@lsp.type.class'] = { fg = colors.cyan },
      ['@lsp.type.enum'] = { fg = colors.cyan },
      ['@lsp.type.decorator'] = { fg = colors.green },
      ['@lsp.type.enumMember'] = { fg = colors.purple },
      ['@lsp.type.function'] = { fg = colors.green, },
      ['@lsp.type.interface'] = { fg = colors.cyan },
      ['@lsp.type.macro'] = { fg = colors.cyan },
      ['@lsp.type.method'] = { fg = colors.green, },
      ['@lsp.type.namespace'] = { fg = colors.orange, },
      ['@lsp.type.parameter'] = { fg = colors.orange, },
      ['@lsp.type.property'] = { fg = colors.purple, },
      ['@lsp.type.struct'] = { fg = colors.cyan },
      ['@lsp.type.type'] = { fg = colors.bright_cyan, },
      ['@lsp.type.variable'] = { fg = colors.fg, },

      -- HTML
      htmlArg = { fg = colors.green, },
      htmlBold = { fg = colors.yellow, bold = true, },
      htmlEndTag = { fg = colors.cyan, },
      htmlH1 = { fg = colors.pink, },
      htmlH2 = { fg = colors.pink, },
      htmlH3 = { fg = colors.pink, },
      htmlH4 = { fg = colors.pink, },
      htmlH5 = { fg = colors.pink, },
      htmlH6 = { fg = colors.pink, },
      htmlItalic = { fg = colors.purple, italic = true, },
      htmlLink = { fg = colors.purple, underline = true, },
      htmlSpecialChar = { fg = colors.yellow, },
      htmlSpecialTagName = { fg = colors.cyan, },
      htmlTag = { fg = colors.cyan, },
      htmlTagN = { fg = colors.cyan, },
      htmlTagName = { fg = colors.cyan, },
      htmlTitle = { fg = colors.white, },

      -- Markdown
      markdownBlockquote = { fg = colors.yellow, italic = true, },
      markdownBold = { fg = colors.orange, bold = true, },
      markdownCode = { fg = colors.green, },
      markdownCodeBlock = { fg = colors.orange, },
      markdownCodeDelimiter = { fg = colors.red, },
      markdownH2 = { link = "rainbow2" },
      markdownH1 = { link = "rainbow1" },
      markdownH3 = { link = "rainbow3" },
      markdownH4 = { link = "rainbow4" },
      markdownH5 = { link = "rainbow5" },
      markdownH6 = { link = "rainbow6" },
      markdownHeadingDelimiter = { fg = colors.red, },
      markdownHeadingRule = { fg = colors.comment, },
      markdownId = { fg = colors.purple, },
      markdownIdDeclaration = { fg = colors.cyan, },
      markdownIdDelimiter = { fg = colors.purple, },
      markdownItalic = { fg = colors.yellow, italic = true, },
      markdownLinkDelimiter = { fg = colors.purple, },
      markdownLinkText = { fg = colors.pink, },
      markdownListMarker = { fg = colors.cyan, },
      markdownOrderedListMarker = { fg = colors.red, },
      markdownRule = { fg = colors.comment, },
      ['@markup.heading.1.markdown'] = { link = 'rainbowcol1' },
		['@markup.heading.2.markdown'] = { link = 'rainbowcol2' },
		['@markup.heading.3.markdown'] = { link = 'rainbowcol3' },
		['@markup.heading.4.markdown'] = { link = 'rainbowcol4' },
		['@markup.heading.5.markdown'] = { link = 'rainbowcol5' },
		['@markup.heading.6.markdown'] = { link = 'rainbowcol6' },

      --  Diff
      diffAdded = { fg = colors.green, },
      diffRemoved = { fg = colors.red, },
      diffFileId = { fg = colors.yellow, bold = true, reverse = true, },
      diffFile = { fg = colors.nontext, },
      diffNewFile = { fg = colors.green, },
      diffOldFile = { fg = colors.red, },

      debugPc = { bg = colors.menu, },
      debugBreakpoint = { fg = colors.red, reverse = true, },

      -- Git Signs
      GitSignsAdd = { fg = colors.bright_green, },
      GitSignsChange = { fg = colors.cyan, },
      GitSignsDelete = { fg = colors.bright_red, },
      GitSignsAddLn = { fg = colors.black, bg = colors.bright_green, },
      GitSignsChangeLn = { fg = colors.black, bg = colors.cyan, },
      GitSignsDeleteLn = { fg = colors.black, bg = colors.bright_red, },
      GitSignsCurrentLineBlame = { fg = colors.white, },

      -- Telescope
      TelescopePromptBorder = { fg = colors.comment, },
      TelescopeResultsBorder = { fg = colors.comment, },
      TelescopePreviewBorder = { fg = colors.comment, },
      TelescopeSelection = { fg = colors.white, bg = colors.selection, },
      TelescopeMultiSelection = { fg = colors.purple, bg = colors.selection, },
      TelescopeNormal = { fg = colors.fg, bg = colors.bg, },
      TelescopeMatching = { fg = colors.green, },
      TelescopePromptPrefix = { fg = colors.purple, },
      TelescopeResultsDiffDelete = { fg = colors.red },
      TelescopeResultsDiffChange = { fg = colors.cyan },
      TelescopeResultsDiffAdd = { fg = colors.green },

      -- Flash
      FlashLabel =  { bg = colors.red, fg = colors.bright_white },

      -- NvimTree
      NvimTreeNormal = { fg = colors.fg, bg = colors.menu, },
      NvimTreeVertSplit = { fg = colors.bg, bg = colors.bg, },
      NvimTreeRootFolder = { fg = colors.fg, bold = true, },
      NvimTreeGitDirty = { fg = colors.yellow, },
      NvimTreeGitNew = { fg = colors.bright_green, },
      NvimTreeImageFile = { fg = colors.pink, },
      NvimTreeFolderIcon = { fg = colors.purple, },
      NvimTreeIndentMarker = { fg = colors.nontext, },
      NvimTreeEmptyFolderName = { fg = colors.comment, },
      NvimTreeFolderName = { fg = colors.fg, },
      NvimTreeSpecialFile = { fg = colors.pink, underline = true, },
      NvimTreeOpenedFolderName = { fg = colors.fg, },
      NvimTreeCursorLine = { bg = colors.selection, },
      NvimTreeIn = { bg = colors.selection, },

      NvimTreeEndOfBuffer = endOfBuffer,

      -- NeoTree
      NeoTreeNormal = { fg = colors.fg, bg = colors.menu, },
      NeoTreeNormalNC = { fg = colors.fg, bg = colors.menu, },
      NeoTreeDirectoryName = { fg = colors.fg },
      NeoTreeGitUnstaged = { fg = colors.bright_magenta },
      NeoTreeGitModified = { fg = colors.bright_magenta },
      NeoTreeGitUntracked = { fg = colors.bright_green },
      NeoTreeDirectoryIcon = { fg = colors.purple },
      NeoTreeIndentMarker = { fg = colors.nontext },
      NeoTreeDotfile = { fg = colors.comment },

      -- Bufferline
      BufferLineIndicatorSelected = { fg = colors.purple, },
      BufferLineFill = { bg = colors.black, },
      BufferLineBufferSelected = { bg = colors.bg, },
      BufferLineSeparator = { fg = colors.black },

      -- LSP
      DiagnosticError = { fg = colors.red, },
      DiagnosticWarn = { fg = colors.yellow, },
      DiagnosticInfo = { fg = colors.cyan, },
      DiagnosticHint = { fg = colors.cyan, },
      DiagnosticUnderlineError = { undercurl = true, sp = colors.red, },
      DiagnosticUnderlineWarn = { undercurl = true, sp = colors.yellow, },
      DiagnosticUnderlineInfo = { undercurl = true, sp = colors.cyan, },
      DiagnosticUnderlineHint = { undercurl = true, sp = colors.cyan, },
      DiagnosticSignError = { fg = colors.red, },
      DiagnosticSignWarn = { fg = colors.yellow, },
      DiagnosticSignInfo = { fg = colors.cyan, },
      DiagnosticSignHint = { fg = colors.cyan, },
      DiagnosticFloatingError = { fg = colors.red, },
      DiagnosticFloatingWarn = { fg = colors.yellow, },
      DiagnosticFloatingInfo = { fg = colors.cyan, },
      DiagnosticFloatingHint = { fg = colors.cyan, },
      DiagnosticVirtualTextError = { fg = colors.red, },
      DiagnosticVirtualTextWarn = { fg = colors.yellow, },
      DiagnosticVirtualTextInfo = { fg = colors.cyan, },
      DiagnosticVirtualTextHint = { fg = colors.cyan, },

      LspDiagnosticsDefaultError = { fg = colors.red, },
      LspDiagnosticsDefaultWarning = { fg = colors.yellow, },
      LspDiagnosticsDefaultInformation = { fg = colors.cyan, },
      LspDiagnosticsDefaultHint = { fg = colors.cyan, },
      LspDiagnosticsUnderlineError = { fg = colors.red, undercurl = true, },
      LspDiagnosticsUnderlineWarning = { fg = colors.yellow, undercurl = true, },
      LspDiagnosticsUnderlineInformation = { fg = colors.cyan, undercurl = true, },
      LspDiagnosticsUnderlineHint = { fg = colors.cyan, undercurl = true, },
      LspReferenceText = { fg = colors.orange, },
      LspReferenceRead = { fg = colors.orange, },
      LspReferenceWrite = { fg = colors.orange, },
      LspCodeLens = { fg = colors.cyan, },
      LspInlayHint = { fg = "#969696", bg = "#2f3146" },

      --LSP Saga
      LspFloatWinNormal = { fg = colors.fg, },
      LspFloatWinBorder = { fg = colors.comment, },
      LspSagaHoverBorder = { fg = colors.comment, },
      LspSagaSignatureHelpBorder = { fg = colors.comment, },
      LspSagaCodeActionBorder = { fg = colors.comment, },
      LspSagaDefPreviewBorder = { fg = colors.comment, },
      LspLinesDiagBorder = { fg = colors.comment, },
      LspSagaRenameBorder = { fg = colors.comment, },
      LspSagaBorderTitle = { fg = colors.menu, },
      LSPSagaDiagnosticTruncateLine = { fg = colors.comment, },
      LspSagaDiagnosticBorder = { fg = colors.comment, },
      LspSagaShTruncateLine = { fg = colors.comment, },
      LspSagaDocTruncateLine = { fg = colors.comment, },
      LspSagaLspFinderBorder = { fg = colors.comment, },
      CodeActionNumber = { bg = 'NONE', fg = colors.cyan },

      -- IndentBlankLine
      IndentBlanklineContextChar = { fg = colors.bright_red, nocombine = true, },

      -- Nvim compe
      CmpItemAbbrDeprecated = { fg = colors.white, bg = colors.bg, },
      CmpItemAbbrMatch = { fg = colors.cyan, bg = colors.bg, },

      -- barbar
      BufferVisibleTarget = { fg = colors.red },
      BufferTabpages = { fg = colors.nontext, bg = colors.black, bold = true },
      BufferTabpageFill = { fg = colors.nontext, bg = colors.black },
      BufferCurrentSign = { fg = colors.purple },
      BufferCurrentTarget = { fg = colors.red },
      BufferInactive = { fg = colors.comment, bg = colors.black, italic = true },
      BufferInactiveIndex = { fg = colors.nontext, bg = colors.black, italic = true },
      BufferInactiveMod = { fg = colors.yellow, bg = colors.black, italic = true },
      BufferInactiveSign = { fg = colors.nontext, bg = colors.black, italic = true },
      BufferInactiveTarget = { fg = colors.red, bg = colors.black, bold = true },

      -- Compe
      CompeDocumentation = { link = "Pmenu" },
      CompeDocumentationBorder = { link = "Pmenu" },

      -- Cmp
      CmpItemAbbr = { fg = colors.white, bg = colors.bg },
      CmpItemKind = { fg = colors.white, bg = colors.bg },
      CmpItemKindMethod = { link = "@function.method" },
      CmpItemKindText = { link = "@markup" },
      CmpItemKindFunction = { link = "@function" },
      CmpItemKindConstructor = { link = "@type" },
      CmpItemKindVariable = { link = "@variable" },
      CmpItemKindClass = { link = "@type" },
      CmpItemKindInterface = { link = "@type" },
      CmpItemKindModule = { link = "@module" },
      CmpItemKindProperty = { link = "@property" },
      CmpItemKindOperator = { link = "@operator" },
      CmpItemKindReference = { link = "@variable.parameter.reference" },
      CmpItemKindUnit = { link = "@variable.member" },
      CmpItemKindValue = { link = "@variable.member" },
      CmpItemKindField = { link = "@variable.member" },
      CmpItemKindEnum = { link = "@variable.member" },
      CmpItemKindKeyword = { link = "@keyword" },
      CmpItemKindSnippet = { link = "@markup" },
      CmpItemKindColor = { link = "DevIconCss" },
      CmpItemKindFile = { link = "TSURI" },
      CmpItemKindFolder = { link = "TSURI" },
      CmpItemKindEvent = { link = "@constant" },
      CmpItemKindEnumMember = { link = "@variable.member" },
      CmpItemKindConstant = { link = "@constant" },
      CmpItemKindStruct = { link = "@structure" },
      CmpItemKindTypeParameter = { link = "@variable.parameter" },

      -- Blink
      BlinkCmpLabel = { fg = colors.white, bg = colors.menu },
      BlinkCmpLabelDeprecated = { fg = colors.white, bg = colors.menu },
      BlinkCmpLabelMatch = { fg = colors.cyan, bg = colors.menu },
      BlinkCmpKind = { fg = colors.white, bg = colors.menu },
      BlinkCmpScrollBarThumb = { bg = colors.fg },
      BlinkCmpScrollBarGutter = { bg = colors.menu },
      BlinkCmpKindFunction = { link = "@function" },
      BlinkCmpKindConstructor = { link = "@type" },
      BlinkCmpKindVariable = { link = "@variable" },
      BlinkCmpKindClass = { link = "@type" },
      BlinkCmpKindInterface = { link = "@type" },
      BlinkCmpKindModule = { link = "@module" },
      BlinkCmpKindProperty = { link = "@property" },
      BlinkCmpKindOperator = { link = "@operator" },
      BlinkCmpKindReference = { link = "@variable.parameter.reference" },
      BlinkCmpKindUnit = { link = "@variable.member" },
      BlinkCmpKindValue = { link = "@variable.member" },
      BlinkCmpKindField = { link = "@variable.member" },
      BlinkCmpKindEnum = { link = "@variable.member" },
      BlinkCmpKindKeyword = { link = "@keyword" },
      BlinkCmpKindSnippet = { link = "@markup" },
      BlinkCmpKindColor = { link = "DevIconCss" },
      BlinkCmpKindFile = { link = "TSURI" },
      BlinkCmpKindFolder = { link = "TSURI" },
      BlinkCmpKindEvent = { link = "@constant" },
      BlinkCmpKindEnumMember = { link = "@variable.member" },
      BlinkCmpKindConstant = { link = "@constant" },
      BlinkCmpKindStruct = { link = "@structure" },
      BlinkCmpKindTypeParameter = { link = "@variable.parameter" },

      -- navic
      NavicIconsFile = { link = "CmpItemKindFile" },
      NavicIconsModule = { link = "CmpItemKindModule" },
      NavicIconsNamespace = { link = "CmpItemKindModule" },
      NavicIconsPackage = { link = "CmpItemKindModule" },
      NavicIconsClass = { link = "CmpItemKindClass" },
      NavicIconsMethod = { link = "CmpItemKindMethod" },
      NavicIconsProperty = { link = "CmpItemKindProperty" },
      NavicIconsField = { link = "CmpItemKindField" },
      NavicIconsConstructor = { link = "CmpItemKindConstructor" },
      NavicIconsEnum = { link = "CmpItemKindEnum" },
      NavicIconsInterface = { link = "CmpItemKindInterface" },
      NavicIconsFunction = { link = "CmpItemKindFunction" },
      NavicIconsVariable = { link = "CmpItemKindVariable" },
      NavicIconsConstant = { link = "CmpItemKindConstant" },
      NavicIconsString = { link = "String" },
      NavicIconsNumber = { link = "Number" },
      NavicIconsBoolean = { link = "Boolean" },
      NavicIconsArray = { link = "CmpItemKindClass" },
      NavicIconsObject = { link = "CmpItemKindClass" },
      NavicIconsKey = { link = "CmpItemKindKeyword" },
      NavicIconsKeyword = { link = "CmpItemKindKeyword" },
      NavicIconsNull = { fg = "blue" },
      NavicIconsEnumMember = { link = "CmpItemKindEnumMember" },
      NavicIconsStruct = { link = "CmpItemKindStruct" },
      NavicIconsEvent = { link = "CmpItemKindEvent" },
      NavicIconsOperator = { link = "CmpItemKindOperator" },
      NavicIconsTypeParameter = { link = "CmpItemKindTypeParameter" },
      NavicText = { fg = 'gray' },
      NavicSeparator = { fg = 'gray' },

      -- TS rainbow colors
      rainbowcol1 = { fg = colors.fg },
      rainbowcol2 = { fg = colors.pink },
      rainbowcol3 = { fg = colors.cyan },
      rainbowcol4 = { fg = colors.green },
      rainbowcol5 = { fg = colors.purple },
      rainbowcol6 = { fg = colors.orange },
      rainbowcol7 = { fg = colors.fg },

      -- Rainbow delimiter
      RainbowDelimiterRed = { fg = colors.fg },
      RainbowDelimiterYellow = {fg = colors.pink },
      RainbowDelimiterBlue = {fg = colors.cyan },
      RainbowDelimiterOrange = { fg = colors.green },
      RainbowDelimiterGreen = { fg = colors.purple },
      RainbowDelimiterViolet = { fg = colors.orange },
      RainbowDelimiterCyan = { fg = colors.fg },

      -- mini.indentscope
      MiniIndentscopeSymbol = { fg = "#B5629B" },
      MiniIndentscopeSymbolOff = { fg = "#B5629B" },

      -- mini.icons
      MiniIconsAzure = { fg = colors.bright_cyan },
      MiniIconsBlue = { fg = colors.bright_blue },
      MiniIconsCyan = { fg = colors.cyan },
      MiniIconsGrey = { fg = colors.white },
      MiniIconsOrange = { fg = colors.orange },
      MiniIconsPurple = { fg = colors.purple },
      MiniIconsRed = { fg = colors.red },
      MiniIconsYellow = { fg = colors.yellow },

      -- mini.statusline
      MiniStatuslineModeNormal = { fg = colors.black, bg = colors.purple, bold = true },
      MiniStatuslineModeInsert = { fg = colors.black, bg = colors.green, bold = true },
      MiniStatuslineModeVisual = { fg = colors.black, bg = colors.pink, bold = true },
      MiniStatuslineModeReplace = { fg = colors.black, bg = colors.yellow, bold = true },
      MiniStatuslineModeCommand = { fg = colors.black, bg = colors.cyan, bold = true },
      MiniStatuslineInactive = { fg = colors.fg, bg = colors.visual, bold = true },
      MiniStatuslineDevinfo = { fg = colors.purple, bg = colors.black },
      MiniStatuslineFilename = { fg = colors.white, bg = colors.black },
      MiniStatuslineFileinfo = { fg = colors.purple, bg = colors.black },

      -- mini.files
      MiniFilesNormal = { fg = colors.fg, bg = colors.menu },
      MiniFilesBorder = { fg = colors.purple, bg = colors.menu },
      MiniFilesBorderModified = { },
      MiniFilesCursorLine = { bg = colors.selection, },
      MiniFilesDirectory = { fg = colors.fg },
      MiniFilesFile = { fg = colors.fg },
      MiniFilesTitle = { fg = colors.fg },
      MiniFilesTitleFocused = { fg = colors.yellow },

      -- goolord/alpha-nvim
      AlphaHeader = { fg = colors.purple },
      AlphaButtons = { fg = colors.cyan },
      AlphaShortcut = { fg = colors.orange },
      AlphaFooter = { fg = colors.purple, italic = true },

      -- nvimdev/dashboard-nvim
      DashboardShortCut = { fg = colors.cyan },
      DashboardHeader = { fg = colors.purple },
      DashboardCenter = { fg = colors.fg },
      DashboardFooter = { fg = colors.purple, italic = true },
      DashboardKey = { fg = colors.orange },
      DashboardDesc = { fg = colors.cyan },
      DashboardIcon = { fg = colors.cyan, bold = true },

      -- dap UI
      DapUIPlayPause = { fg = colors.bright_green },
      DapUIRestart = { fg = colors.green },
      DapUIStop = { fg = colors.red },
      DapUIStepOver = { fg = colors.cyan },
      DapUIStepInto = { fg = colors.cyan },
      DapUIStepOut = { fg = colors.cyan },
      DapUIStepBack = { fg = colors.cyan },
      DapUIType = { fg = colors.bright_blue },
      DapUIScope = { fg = colors.bright_cyan },
      DapUIModifiedValue = { fg = colors.bright_cyan, bold = true },
      DapUIDecoration = { fg = colors.bright_cyan },
      DapUIThread = { fg = colors.bright_green },
      DapUIStoppedThread = { fg = colors.bright_cyan },
      DapUISource = { fg = colors.bright_blue },
      DapUILineNumber = { fg = colors.bright_cyan },
      DapUIFloatBorder = { fg = colors.bright_cyan },
      DapUIWatchesEmpty = { fg = colors.pink },
      DapUIWatchesValue = { fg = colors.bright_green },
      DapUIWatchesError = { fg = colors.pink },
      DapUIBreakpointsPath = { fg = colors.bright_cyan },
      DapUIBreakpointsInfo = { fg = colors.bright_green },
      DapUIBreakpointsCurrentLine = { fg = colors.bright_green, bold = true },
      DapStoppedLine = { default = true, link = 'Visual' },
      DapUIWinSelect = { fg = colors.bright_cyan, bold = true },

      -- Notify
      NotifyInfoIcon = { fg = colors.green },
      NotifyInfoTitle = { fg = colors.green },
      NotifyInfoBorder = { fg = "#2C453F" },
      NotifyErrorIcon = { fg = colors.red },
      NotifyErrorTitle = { fg = colors.red },
      NotifyErrorBorder = { fg = "#DD6E6B" },
      NotifyWarnIcon = { fg = colors.orange },
      NotifyWarnTitle = { fg = colors.orange },
      NotifyWarnBorder = { fg = "#785637" },

      -- SnacksDashboard
      SnacksDashboardHeader = { fg = colors.purple },
      SnacksDashboardKey = { fg = colors.orange },
      SnacksDashboardDesc = { fg = colors.cyan },
      SnacksDashboardIcon = { fg = colors.cyan },
      SnacksDashboardFooter = { fg = colors.purple, italic = true },

      -- SnacksPicker
      SnacksBackdrop = { link = "FloatShadow" },
      SnacksPickerBorder = { fg = colors.comment },
      SnacksPickerDir = { fg = colors.fg },
      SnacksPickerDirectory = { fg = colors.fg },
      SnacksPickerFile = { fg = colors.fg },
      SnacksPickerGitStatusIgnored = { fg = colors.comment },
      SnacksPickerGitStatusModified = { fg = colors.yellow },
      SnacksPickerGitStatusRenamed = { fg = colors.yellow },
      SnacksPickerGitStatusStaged = { fg = colors.bright_green },
      SnacksPickerGitStatusUnmerged = { fg = colors.orange },
      SnacksPickerGitStatusUntracked = { fg = colors.green },
      SnacksPickerInput = { link = "NormalFloat" },
      SnacksPickerInputBorder = { link = "SnacksPickerBorder" },
      SnacksPickerMatch = { fg = colors.green, italic = true },
      SnacksPickerPathHidden = { fg = colors.comment },
      SnacksPickerPrompt = { fg = colors.purple },
      SnacksPickerTitle = { fg = colors.cyan, bold = true },

      -- Neogit
      NeogitDiffAdd = { fg = colors.bright_green, bg = colors.menu },
      NeogitDiffDelete = { fg = colors.bright_red, bg = colors.menu },
      NeogitDiffContext = { fg = colors.comment, bg = colors.visual },
      NeogitDiffAddHighlight = { fg = colors.green, bg = colors.bg },
      NeogitDiffDeleteHighlight = { fg = colors.red, bg = colors.bg },
      NeogitDiffContextHighlight = { fg = colors.comment, bg = colors.visual },
      NeogitDiffAddCursor = { fg = colors.green, bg = colors.selection },
      NeogitDiffDeleteCursor = { fg = colors.red, bg = colors.selection },
      NeogitDiffContextCursor = { fg = colors.comment, bg = colors.selection },

}

for group, setting in pairs(groups) do
    vim.api.nvim_set_hl(0, group, setting)
end
