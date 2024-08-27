local function trim_whitespace(range, silent)
  silent = silent or false

  local pos = vim.api.nvim_win_get_cursor(0)
  vim.cmd {
    cmd = 'substitute',
    args = {'/\\s\\+$//e'},
    mods = {
      keeppatterns = true,
      silent = silent,
    },
    range = range,
  }
  vim.api.nvim_win_set_cursor(0, pos)
end

local group = vim.api.nvim_create_augroup('HLWhitespace', {
  clear = true,
})

-- TODO: is there a better way to toggle this than setting/unsetting listchars.trail? maybe proper syn match?

vim.api.nvim_create_autocmd({'InsertEnter'}, {
  group = group,
  callback = function ()
    vim.opt_local.listchars:remove {'trail'}
  end
})

vim.api.nvim_create_autocmd({'BufEnter', 'InsertLeave'}, {
  group = group,
  callback = function ()
    vim.opt_local.listchars:append {trail = '•'}
  end
})

vim.api.nvim_create_autocmd({'ColorScheme'}, {
  group = group,
  callback = function ()
    vim.api.nvim_set_hl(0, 'Whitespace', {
      fg = '#BF616A',
    })
  end
})

vim.api.nvim_create_autocmd({'BufWritePre'}, {
  group = group,
  callback = function ()
    if vim.b.WhitespaceTrimOnSave == 1 then
      local range = {0, vim.fn.line('$')}
      trim_whitespace(range, true)
    end
  end
})

vim.api.nvim_create_user_command(
  'TrimWhitespace',
  function (opts)
    local range = {0, vim.fn.line('$')}
    if opts.range ~= 0 then
      range = {opts.line1, opts.line2}
    end

    trim_whitespace(range)
  end,
  {bang = true, range = true}
)
