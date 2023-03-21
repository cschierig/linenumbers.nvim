local vim = vim
local M = {}

local group = vim.api.nvim_create_augroup('Linenumbers', { clear = true })

local function setup_autocommands()
  vim.api.nvim_create_autocmd('InsertEnter', {
    group = group,
    callback = function()
      vim.wo.relativenumber = false
    end,
  })
  vim.api.nvim_create_autocmd('InsertLeave', {
    group = group,
    callback = function()
      vim.wo.relativenumber = true
    end,
  })
end

function M.setup(cfg)
  vim.opt.number = true
  vim.wo.relativenumber = true
  setup_autocommands()
end
return M
