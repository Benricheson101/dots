return {
  'chomosuke/typst-preview.nvim',
  ft = 'typst',
  version = '1.*',
  dependencies = {'mason.nvim'},
  opts = {
    debug = false,
  },

  config = function(_, opts)
    local p = require('typst-preview')
    local mr = require('mason-registry')

    local tinymist = mr.get_package('tinymist'):get_install_path()
    local binary = vim.split(vim.fn.glob(tinymist .. "/tinymist-*"), "\n")[1]

    if binary then
      opts.dependencies_bin = opts.dependencies_bin or {}
      opts.dependencies_bin.tinymist = binary
    end

    p.setup(opts)
  end
}
