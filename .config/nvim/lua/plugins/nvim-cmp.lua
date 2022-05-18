local augroup = vim.api.nvim_create_augroup("compe_cmds", { clear = true })
local autocmd = vim.api.nvim_create_autocmd
local command = vim.api.nvim_create_user_command

local cmp = require("cmp")
local luasnip = require("luasnip")

local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = ""
}

local user = { autocomplete = true }

local select_opts = { behavior = cmp.SelectBehavior.Select }
local documentation = vim.tbl_deep_extend(
  "force",
  cmp.config.window.bordered(),
  {
    max_height = 15,
    max_width = 60,
  }
)

user.config = {
  enabled = function()
    if vim.bo.buftype == "prompt" then
      return false
    end

    return user.autocomplete
  end,
  completion = {
    completeopt = "menu,menuone,noinsert",
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  sources = {
    { name = "path" },
    { name = "nvim_lsp", keyword_length = 3 },
    { name = "buffer", keyword_length = 3 },
    { name = "luasnip", keyword_length = 2 },
    { name = "treesitter" },
    { name = "nvim_lsp_signature_help" },
  },
  window = {
    documentation = documentation
  },
  sorting = {
    -- TODO: Would be cool to add stuff like "See variable names before method names" in rust, or something like that.
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,

      -- copied from cmp-under, but I don't think I need the plugin for this.
      -- I might add some more of my own.
      function(entry1, entry2)
        local _, entry1_under = entry1.completion_item.label:find "^_+"
        local _, entry2_under = entry2.completion_item.label:find "^_+"
        entry1_under = entry1_under or 0
        entry2_under = entry2_under or 0
        if entry1_under > entry2_under then
          return false
        elseif entry1_under < entry2_under then
          return true
        end
      end,

      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
      vim_item.menu = ({
        buffer = "[Buffer]",
        path = "[Path]",
        nvim_lsp = "[Lsp]",
        nvim_lua = "[API]",
        luasnip = "[Snip]",
        treesitter = "[TS]",
      })[entry.source.name]
      return vim_item
    end
  },
  experimental = {
    native_menu = false,
    ghost_text = false,
  },
  mapping = {
    ["<Up>"] = cmp.mapping.select_prev_item(select_opts),
    ["<Down>"] = cmp.mapping.select_next_item(select_opts),

    ["<M-k>"] = cmp.mapping.select_prev_item(select_opts),
    ["<M-j>"] = cmp.mapping.select_next_item(select_opts),

    ["<C-d>"] = cmp.mapping.scroll_docs(5),
    ["<C-u>"] = cmp.mapping.scroll_docs(-5),

    ["<C-e>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.close()
        user.set_autocomplete(false)
        fallback()
      else
        cmp.complete()
        user.set_autocomplete(true)
      end
    end),

    ["<Tab>"] = cmp.mapping(function(fallback)
      user.set_autocomplete(true)

      if cmp.visible() then
        cmp.confirm({ select = true })
      elseif luasnip.jumpable(1) then
        luasnip.jump(1)
      elseif user.check_back_space() then
        fallback()
      else
        cmp.complete()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function() luasnip.jump(-1) end, { "i", "s" }),
  }
}

user.set_autocomplete = function(new_value)
  local old_value = user.autocomplete

  if new_value == old_value then return end

  if new_value == false then
    -- restore autocomplete in the next word
    vim.api.nvim_buf_set_keymap(
      0,
      "i",
      "<Space>",
      "<cmd>UserCmpEnable<CR><Space>",
      { noremap = true }
    )

    -- restore when leaving insert mode
    autocmd("InsertLeave", {
      group = augroup,
      command = "UserCmpEnable",
      once = true,
    })
  end

  user.autocomplete = new_value
end

user.check_back_space = function()
  local col = vim.fn.col(".") - 1
  if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
    return true
  else
    return false
  end
end

user.enable_cmd = function()
  if user.autocomplete then return end

  pcall(vim.api.nvim_buf_del_keymap, 0, "i", "<Space>")
  user.set_autocomplete(true)
end

command("UserCmpEnable", user.enable_cmd, {})

cmp.setup(user.config)

cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  source = {
    { name = "nvim_lsp_document_symbol" },
    { name = "buffer" },
  }
})

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "cmdline" }
  }
})
