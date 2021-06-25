require 'plugins.other.config'

local other = {
  'sbdchd/neoformat',
  'wakatime/vim-wakatime',

  ['https://github.com/Benricheson101/coc-discord-rpc'] = {
    run = 'yarn install --frozen-lockfile || true && yarn build || true',
    branch = 'button'
  },
}

return other
