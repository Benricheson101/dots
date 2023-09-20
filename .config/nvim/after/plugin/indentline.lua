local optutil = require('util.opt')

optutil.let_g {
  indentLine_char = '¦',
  indentLine_setConceal = 0,
  indentLine_bufTypeExclude = {
    'help',
    'nofile',
    'nowrite',
    'quickfix',
    'terminal',
    'prompt',
  }
}
