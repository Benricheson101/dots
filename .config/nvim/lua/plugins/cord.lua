return {
  'vyfor/cord.nvim',
  build = ':Cord update',
  opts = {
    display = {
      theme = 'default',
      flavor = 'accent',
    },

    buttons = {
      {
        label = function (opts)
          return opts.repo_url and 'View Repository' or 'GitHub'
        end,
        url = function (opts)
          return opts.repo_url or 'https://github.com/Benricheson101'
        end,
      },
    },

    editor = {
      icon = ' ',
    },

    idle = {
      timeout = 600000,
    },

    advanced = {
      server = {
        update = 'none',
      },
    },
  },
}
