local M = {}

M.file_explorer = function(cwd)
  if vim.o.lines > 17 then
    require("lir.float").toggle(cwd)
  else
    vim.cmd("edit " .. (cwd or vim.fn.expand("%:p:h")))
  end
end

return M
