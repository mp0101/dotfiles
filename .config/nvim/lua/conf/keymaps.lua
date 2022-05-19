local fns = require("conf.functions")

local augroup = vim.api.nvim_create_augroup("mapping_cmds", { clear = true })
local autocmd = vim.api.nvim_create_autocmd

-- Bind options
local bind = vim.keymap.set
local remap = { remap = true }

-- [[[ Disable Keymaps

-- Ensure space not used
bind("n", "<Space>", "<Nop>")
bind("n", "<CR>", "<Nop>")

-- Disable ArrowKeys
bind({ "n", "i", "x", "v" }, "<Up>", "<Nop>")
bind({ "n", "i", "x", "v" }, "<Down>", "<Nop>")
bind({ "n", "i", "x", "v" }, "<Right>", "<Nop>")
bind({ "n", "i", "x", "v" }, "<Left>", "<Nop>")

-- ]]]
-- [[[ Key Mappings

-- Set MapLeader
vim.g.mapleader = " "

-- Fast to Esc
bind("i", "jk", "<Esc>")
bind("i", "JK", "<Esc>")
bind("i", "kj", "<Esc>")
bind("i", "KJ", "<Esc>")

-- Enter commands
bind("n", "<CR>", ":FineCmdline<CR>")

-- Select all text in current buffer
bind("n", "<C-a>", ":keepjumps normal! ggVG<CR>")

-- Go to matching pair
bind({ "n", "x" }, "<Tab>", "%", remap)

-- Go to first character in line
bind("", "H", "^", remap)

-- Go to last character in line
bind("", "L", "g_", remap)

-- Scroll half page and center
bind("", "<C-u>", "<C-u>M")
bind("", "<C-d>", "<C-d>M")

-- Search will center on the line it's found in
bind("n", "n", "nzzzv")
bind("n", "N", "Nzzzv")
bind("n", "#", "#zz")
bind("n", "*", "*zz")

-- Delete in select mode
bind("s", "<BS>", '<C-g>"_c')
bind("s", "<C-h>", "<BS>", remap)

-- Because of reasons
bind("i", "<C-h>", "<BS>", remap)

-- Whatever you delete, make it go away
bind("n", "c", '"_c')
bind("n", "C", '"_C')
bind("x", "c", '"_c')
bind("x", "C", '"_C')

bind("n", "x", '"_x')
bind("x", "x", '"_x')
bind("x", "X", '"_c')

-- ]]]
-- [[[ Commands Mappings

-- Moving lines and preserving indentation
bind("n", "<C-j>", ":move .+1<CR>==")
bind("n", "<C-k>", ":move .-2<CR>==")
bind("v", "<C-j>", ":move '>+1<CR>gv=gv")
bind("v", "<C-k>", ":move '<-2<CR>gv=gv")

-- Write file
bind("n", "<M-w>", ":write<CR>")
bind("i", "<M-w>", "<Esc>:write<CR>")

-- Safe quit
bind("n", "<M-q>", ":quitall<CR>")

-- Force quit
bind("n", "<M-Q>", ":quitall!<CR>")

-- Close buffer
bind("n", "<Leader>bq", ":bdelete<CR>")

-- Move to last active buffer
bind("n", "<Leader>bl", ":buffer #<CR>")

-- Navigate between buffers
bind("n", "[b", ":bprevious<CR>")
bind("n", "]b", ":bnext<CR>")

-- Open new tabpage
bind("n", "<Leader>tn", ":tabnew<CR>")

-- Navigate between tabpages
bind("n", "[t", ":tabprevious<CR>")
bind("n", "]t", ":tabnext<CR>")

-- Clear messages
bind("n", "<Leader><space>", ":echo ''<CR>")

-- Switch to the directory of the open buffer
bind("n", "<Leader>cd", ":lcd %:p:h<CR>:pwd<CR>")

-- Universal comments with <C-/> (written as <C-_> to work in terminal)
bind("n", "<C-/>", require("Comment.api").toggle_current_linewise)
bind("x", "<C-/>", "<Cmd>norm gbgv<CR>")
bind("n", "<C-_>", require("Comment.api").toggle_current_linewise)
bind("x", "<C-_>", "<Cmd>norm gbgv<CR>")

-- ]]]
-- [[[ Toggle Elements

-- Show Search highlight
bind("n", "<Leader>hl", "<cmd>set invhlsearch<CR>")
-- Show Tabline
-- bind("n", "<Leader>ut", fns.toggle_opt("showtabline", "o", 1, 0))
-- Show Ruler
-- bind("n", "<Leader>ul", fns.toggle_opt("colorcolumn", "wo", "81", "0"))
-- Cursorline highlight
bind("n", "<Leader>icl", "<cmd>set invcursorline<CR>")
-- Line numbers
bind("n", "<Leader>inn", "<cmd>set invnumber<CR>")
-- Relative line numbers
bind("n", "<Leader>irn", "<cmd>set invrelativenumber<CR>")

-- ]]]
-- [[[ Search Commands

-- Show key bindings list
bind("n", "<Leader>?", ":Telescope keymaps<CR>")

-- Search pattern
bind("n", "<Leader>F", ":FineCmdline TGrep <CR>")
bind("x", "<Leader>F", ":<C-u>GetSelection<CR>:TGrep <C-r>/<CR>")
bind("n", "<Leader>fw", ":TGrep <C-r>=expand('<cword>')<CR><CR>")
bind("n", "<Leader>fg", ":Telescope live_grep<CR>")

-- Find files by name
bind("n", "<Leader>ff", ":Telescope find_files<CR>")

-- Search symbols in buffer
bind("n", "<Leader>fs", ":Telescope treesitter<CR>")

-- Search in files history
bind("n", "<Leader>fh", ":Telescope oldfiles<CR>")

-- Search media files
bind("n", "<Leader>fm", ":Telescope media_files<CR>")

-- Search in active buffers list
bind("n", "<Leader>bb", ":Telescope buffers<CR>")
bind("n", "<Leader>B", ":Telescope buffers only_cwd=true<CR>")

-- Put selected text in register '/'
bind("v", "<Leader>y", ":<C-u>GetSelection<CR>gv")
bind("v", "<Leader>Y", ":<C-u>GetSelection<CR>:set hlsearch<CR>")

-- Nice buffer local search
bind("n", "<Leader>s", ":SearchBoxIncSearch<CR>")
bind("x", "<Leader>s", ":SearchBoxIncSearch visual_mode=true<CR>")
bind("n", "<Leader>S", ":SearchBoxMatchAll title=' Match '<CR>")
bind("x", "<Leader>S", ":SearchBoxMatchAll title=' Match ' visual_mode=true<CR>")
bind("n", "<Leader>;", "<cmd>SearchBoxClear<CR>")

-- Begin search & replace
bind("n", "<Leader>r", ":SearchBoxReplace confirm=menu<CR>")
bind("x", "<Leader>r", ":SearchBoxReplace confirm=menu visual_mode=true<CR>")
bind("n", "<Leader>R", ":SearchBoxReplace confirm=menu -- <C-r>=expand('<cword>')<CR><CR>")
bind("x", "<Leader>R", ":<C-u>GetSelection<CR>:SearchBoxReplace confirm=menu<CR><C-r>/")

-- ]]]
-- [[[ Lsp Keymaps

autocmd("User", {
  pattern = "LSPKeybindings",
  group = augroup,
  callback = function()
    local telescope = require("telescope.builtin")
    local lsp = vim.lsp.buf

    local opts = { silent = true, buffer = true }

    bind("n", "<Leader>fi", "<cmd>LspInfo<cr>", opts)

    bind("n", "K", lsp.hover, opts)
    bind("n", "gd", lsp.definition, opts)
    bind("n", "gD", lsp.declaration, opts)
    bind("n", "gi", lsp.implementation, opts)
    bind("n", "go", lsp.type_definition, opts)
    bind("n", "gr", lsp.references, opts)
    bind("n", "gs", lsp.signature_help, opts)
    bind("n", "<F2>", lsp.rename, opts)
    bind("n", "<F4>", lsp.code_action, opts)
    bind("x", "<F4>", lsp.range_code_action, opts)

    bind("i", "<M-i>", lsp.signature_help, opts)

    bind("n", "gl", vim.diagnostic.open_float, opts)
    bind("n", "[d", vim.diagnostic.goto_prev, opts)
    bind("n", "]d", vim.diagnostic.goto_next, opts)

    bind("n", "<Leader>fd", telescope.lsp_document_symbols, opts)
    bind("n", "<Leader>fq", telescope.lsp_workspace_symbols, opts)
  end
})

-- ]]]
-- [[[ Misc Mappings

-- Change word under cursor
bind("n", "cj", '"_ciw')

-- Change word but repeatable
bind("n", "<Leader>j", "<cmd>let @/='\\<'.expand('<cword>').'\\>'<cr>\"_ciw")

-- Use lightspeed's omni mode
bind("", "s", "<Plug>Lightspeed_omni_s")

-- Close buffer while preserving the layout
bind("n", "<Leader>bc", ":Bdelete<CR>")

-- Toggle zen-mode
bind("n", "<Leader>uz", "<cmd>ZenMode<CR>")

-- Override some `cv` bindings from `vim-system-copy`.
bind("n", "cvv", "ax<Esc><plug>SystemPastel", remap)
bind("n", "cvk", "Ox<Esc><Plug>SystemPastel", remap)
bind("n", "cvj", "ox<Esc><Plug>SystemPastel", remap)

-- Manage the quickfix list
bind("n", "[q", "<Plug>(qf_qf_previous)zz")
bind("n", "]q", "<Plug>(qf_qf_next)zz")
bind("n", "<Leader>cc", "<Plug>(qf_qf_toggle)")

autocmd("filetype", {
  pattern = "qf",
  group = augroup,
  callback = function()
    local opts = { remap = true, buffer = true }

    -- Go to location under the cursor
    bind("n", "<CR>", "<CR>zz<C-w>w", { buffer = true })

    -- Go to next location and stay in the quickfix window
    bind("n", "<Up>", "<Plug>(qf_qf_previous)zz<C-w>w", opts)

    -- Go to previous location and stay in the quickfix window
    bind("n", "<Down>", "<Plug>(qf_qf_next)zz<C-w>w", opts)

    bind("n", "<Leader>r", ":%s///g<Left><Left>", opts)
  end
})

-- Open file manager
bind("n", "<Leader>dd", fns.file_explorer)
bind("n", "<Leader>da", function() fns.file_explorer(vim.fn.getcwd()) end)

-- Undo break points
local break_points = { "<Space>", "-", "_", ":", ".", "/" }
for _, char in ipairs(break_points) do
  bind("i", char, char .. "<C-g>u")
end

-- ]]]
