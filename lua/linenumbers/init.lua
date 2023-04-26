local vim = vim
local M = {}

local group = vim.api.nvim_create_augroup('Linenumbers', { clear = true })

local function set_absolute()
  vim.wo.relativenumber = false
end

local function set_relative()
  vim.wo.relativenumber = true
end

local function setup_autocommands()
  vim.api.nvim_create_autocmd('InsertEnter', {
    group = group,
    callback = set_absolute,
  })
  vim.api.nvim_create_autocmd('InsertLeave', {
    group = group,
    callback = set_relative,
  })
  vim.api.nvim_create_autocmd('WinLeave', {
    group = group,
    callback = set_absolute,
  })
  vim.api.nvim_create_autocmd('WinEnter', {
    group = group,
    callback = function()
      if vim.fn.mode() == 'i' then
        set_absolute()
      else
        set_relative()
      end
    end,
  })
end

function M.setup(cfg)
  vim.opt.number = true
  vim.wo.relativenumber = true
  setup_autocommands()
end
return M
