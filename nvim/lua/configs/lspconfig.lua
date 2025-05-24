local lspconfig = require("lspconfig")

-- Carga defaults (configuración general NvChad)
require("nvchad.configs.lspconfig").defaults()

-- Servidores que quieres habilitar:
local servers = { "html", "cssls", "gopls" }

for _, server in ipairs(servers) do
  lspconfig[server].setup({})
end
