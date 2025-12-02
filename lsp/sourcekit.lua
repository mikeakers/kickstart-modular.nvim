local function xcode_path()
  return vim.fn.system('xcode-select -p'):gsub('\n$', '')
end

return {
  capabilities = capabilities,
  --on_attach = on_attach,
  cmd = {
    xcode_path() .. '/usr/bin/sourcekit-lsp',
  },
  root_dir = function(filename, _)
    local util = require 'lspconfig.util'
    return util.root_pattern 'buildServer.json'(filename)
      or util.root_pattern('*.xcodeproj', '*.xcworkspace')(filename)
      or util.find_git_ancestor(filename)
      or util.root_pattern 'Package.swift'(filename)
  end,
}
-- vim: ts=2 sts=2 sw=2 et
