local vim = vim
local M = {}

local default_config = {
  hybrid = true,
  disabled_buftypes = { 'nofile', 'terminal' },
}

local config = {}

local group = vim.api.nvim_create_augroup('Linenumbers', { clear = true })

local function set_absolute()
  if config.disabled_buftypes[vim.bo.buftype] ~= nil then
    vim.wo.relativenumber = false
  end
end

local function set_relative()
  if config.disabled_buftypes[vim.bo.buftype] ~= nil then
    vim.wo.relativenumber = true
  end
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
  config = vim.tbl_deep_extend('force', default_config, cfg)
  vim.opt.number = config.hybrid
  vim.wo.relativenumber = true
  setup_autocommands()
end
return M
