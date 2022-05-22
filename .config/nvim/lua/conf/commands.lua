local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local command = vim.api.nvim_create_user_command
local fns = require("conf.functions")

command("GetSelection", fns.get_selection, {})
command("TrailspaceTrim", fns.trailspace_trim, {})
command("SmartBufferPicker", fns.smart_buffer_picker, {})
command("EditMacro", fns.edit_macro, {})
command("LoadProject", fns.load_project, {})

-- Highlight yanked text
local highlightYank = augroup("highlightYank", {})
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 460 })
  end,
  group = highlightYank,
})

-- windows to close with "q"
local windowClose = augroup("windowClose", {})
autocmd("FileType", {
  group = windowClose,
  pattern = { "help", "startuptime", "qf", "lspinfo" },
  command = [[nnoremap <buffer><silent> q :close<CR>]]
})
autocmd("FileType", {
  group = windowClose,
  pattern = "man",
  command = [[nnoremap <buffer><silent> q :quit<CR>]]
})

-- don't auto comment new line
local disabledComment = augroup("disabledComment", {})
autocmd("BufEnter", {
  group = disabledComment,
  command = [[set formatoptions-=cro]]
})

-- Format code on save for certain file types
local formatCode = augroup("formatCode", {})
autocmd("BufWritePre", {
  pattern = {
    "*.cpp",
    "*.js",
    "*.lua",
    "*.md",
    "*.ts",
  },
  callback = vim.lsp.buf.formatting_sync,
  group = formatCode,
})

-- Cursorline highlight controll
augroup("CursorLineControl", {})
local setCursorline = function(event, value, pattern)
  vim.api.nvim_create_autocmd(event, {
    group = group,
    pattern = pattern,
    callback = function()
      vim.opt_local.cursorline = value
    end,
  })
end
setCursorline("WinLeave", false)
setCursorline("WinEnter", true)
setCursorline("FileType", false, "TelescopePrompt")

--[[ -- Save/restore code folds
local saveFolds = augroup("saveFolds", {})
autocmd("BufWritePost", {
  command = "silent mkview",
  group = saveFolds,
})
autocmd("BufReadPost", {
  command = "silent! loadview",
  group = saveFolds,
}) ]]

--[[ -- Opens PDF files in Zathura instead of viewing the binary in Neovim
local openPDF = augroup("openPDF", {})
autocmd("BufReadPost", {
    pattern = {
        "*.pdf",
    },
    callback = function()
        vim.fn.jobstart("zathura '" .. vim.fn.expand("%") .. "'", {
            detach = true,
        })
        vim.api.nvim_buf_delete(0, {})
    end,
    group = openPDF,
}) ]]

-- Plugin source

vim.cmd([[
  augroup pluginSource
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | so %
  augroup end
]])
