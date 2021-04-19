local fn = vim.fn
local cmd = vim.cmd

local plugin_path = fn.stdpath('config')..'/lua/plugins'
local packer = nil

PluginManager = {repos = {}}

function get_plugin_list()
  local repos = {}
  local plugins = fn.split(fn.globpath(plugin_path, '*/plugins.lua'), '\n')

  for _, v in ipairs(plugins) do
    table.insert(repos, v:sub(#plugin_path - 6))
  end

  return repos
end

function PluginManager:load_plugin_info()
  for _, p in ipairs(get_plugin_list()) do
    local plugin_file = p:sub(0, #p - 4):gsub("/", ".")
    local repos = require(plugin_file)

    for idx, name in ipairs(repos) do
      repos[idx] = nil;
      repos[name] = {}
    end

    for plug, conf in pairs(repos) do
      self.repos[#self.repos + 1] = vim.tbl_extend('force', {plug}, conf)
    end
  end
end

function PluginManager:load_plugins()
  if not packer then
    cmd 'packadd packer.nvim'
    packer = require 'packer'
  end

  self:load_plugin_info()
  packer.init()
  packer.reset()

  local use = packer.use

  use 'wbthomason/packer.nvim'
  for _, repo in ipairs(self.repos) do
    use(repo)
  end
end
