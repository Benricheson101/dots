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

local group = vim.api.nvim_create_augroup('TrailingWhitespace', {
  clear = true,
})

vim.api.nvim_create_autocmd({'InsertEnter'}, {
  group = group,
  callback = function ()
    vim.cmd.syntax {'clear', 'TrailingWhitespace'}
  end
})

vim.api.nvim_create_autocmd({'BufEnter', 'BufWinEnter', 'InsertLeave'}, {
  group = group,
  callback = function ()
    vim.cmd.syntax {'match', 'TrailingWhitespace', 'excludenl', '/\\s\\+$/'}
  end
})

vim.api.nvim_create_autocmd({'ColorScheme'}, {
  group = group,
  callback = function ()
    vim.api.nvim_set_hl(0, 'TrailingWhitespace', {
      bg = '#BF616A',
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
    local range = opts.range == 0
      and {0, vim.fn.line('$')}
      or {opts.line1, opts.line2}

    trim_whitespace(range)
  end,
  {bang = true, range = true}
)
