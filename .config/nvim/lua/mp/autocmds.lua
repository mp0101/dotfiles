local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- Highlight on yank
augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
  group = "YankHighlight",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = "460" })
  end
})

-- window to close with "q"
local windowClose = augroup("windowClose", {})
autocmd("FileType", {
  group = windowClose,
  pattern = { "help", "startuptime", "qf", "lspinfo" },
  command = [[nnoremap <buffer><silent> q :close<CR>]]
})
autocmd("FileType", {
  pattern = "man",
  command = [[nnoremap <buffer><silent> q :quit<CR>]]
})

-- don't auto comment new line
local disableComment = augroup("autoComment", {})
autocmd("BufEnter", {
  group = disableComment,
  command = [[set formatoptions-=cro]]
})

-- Show Cursorline only active window
augroup("CursorLineControl", { clear = true })
local setCursorLine = function(event, value, pattern)
  vim.api.nvim_create_autocmd(event, {
    group = "CursorLineControl",
    pattern = pattern,
    callback = function()
      vim.opt_local.cursorline = value
    end,
  })
end
setCursorLine("WinLeave", false)
setCursorLine("WinEnter", true)
setCursorLine("FileType", false, "TelescopePrompt")

-- Save/restore code folds
local saveFolds = augroup("saveFolds", {})
autocmd("BufWritePost", {
  command = "silent mkview",
  group = saveFolds,
})
autocmd("BufReadPost", {
  command = "silent! loadview",
  group = saveFolds,
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

-- Opens PDF files in Zathura instead of viewing the binary in Neovim
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
})
