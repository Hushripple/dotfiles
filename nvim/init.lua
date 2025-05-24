vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

-- Abrir nvim-tree automáticamente al iniciar
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("nvim-tree.api").tree.open()
  end,
})

-- Función para cerrar nvim-tree y luego salir de nvim con :q
function CloseNvimTreeAndQuit()
  require("nvim-tree.api").tree.close()
  vim.cmd("q")
end

-- Mapeo para usar <leader>q y cerrar todo
vim.api.nvim_set_keymap("n", "<leader>q", ":lua CloseNvimTreeAndQuit()<CR>", { noremap = true, silent = true })

require("tree")

-- Asegura transparencia en NvimTree y UI general
vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
  callback = function()
    -- Transparencia global
    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })

    -- Transparencia en NvimTree
    vim.api.nvim_set_hl(0, 'NvimTreeNormal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NvimTreeNormalNC', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NvimTreeEndOfBuffer', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NvimTreeWinSeparator', { bg = 'none', fg = '#3e4452' })
  end,
})

