--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]

-- vim options
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.relativenumber = true

-- general
lvim.log.level = "info"
lvim.format_on_save = {
    enabled = true,
    pattern = "*.lua",
    timeout = 1000,
}
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

vim.opt.list = true
vim.opt.listchars:append "space: "

vim.opt.listchars:append "eol: "




require("indent_blankline").setup {
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}
-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<leader>f"] = false
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<C-g>"] = ":Telescope live_grep<CR>"
lvim.keys.normal_mode["<C-f>"] = ":Telescope find_files<CR>"
lvim.keys.normal_mode["<C-b>"] = ":Telescope buffers<CR>"
lvim.keys.normal_mode["<C-h>"] = ":Telescope help_tags<CR>"

lvim.keys.normal_mode["<leader>gf"] = ":Telescope live_grep<CR>"
lvim.keys.normal_mode["<leader>of"] = ":Telescope find_files<CR>"
lvim.keys.normal_mode["<leader>bf"] = ":Telescope buffers<CR>"
lvim.keys.normal_mode["<leader>hf"] = ":Telescope help_tags<CR>"
lvim.keys.normal_mode["<C-n>"] = ":tabnew<CR>"
lvim.keys.normal_mode["<C-c>"] = ":tabclose<CR>"
lvim.builtin.terminal.open_mapping = "<C-t>"

lvim.keys.normal_mode["<C-l>"] = ":LiveServer<CR>"

-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

-- -- Change theme lvim.builtin.telescope.settings
lvim.colorscheme = "onedark"

-- Lua
require('onedark').setup {
    style = 'darker'
}
require('onedark').load()
-- After changing plugin config exit and reopen LunarVim, Run :PackerSync
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "right"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true
-- lvim.builtin.treesitter.ignore_install = { "haskell" }

-- -- generic LSP settings <https://www.lunarvim.org/docs/languages#lsp-support>

-- --- disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "stylua" },
--   {
--     command = "prettier",
--     extra_args = { "--print-width", "100" },
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     command = "shellcheck",
--     args = { "--severity", "warning" },
--   },
-- }

-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
    {
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
        "lukas-reineke/indent-blankline.nvim",
        "navarasu/onedark.nvim",
        "mawkler/modicator.nvim",
        after = 'onedark.nvim',
        "yamatsum/nvim-cursorline",
        {
            "aurum77/live-server.nvim",
            run = function()
                require "live_server.util".install()
            end,
            cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
        }
    },
}


require('nvim-cursorline').setup {
    cursorline = {
        enable = true,
        timeout = 500,
        number = false,
    },
    cursorword = {
        enable = true,
        min_length = 3,
        hl = { underline = true },
    }
}
local modicator = require('modicator')

-- NOTE: Modicator requires line_numbers and cursorline to be enabled
modicator.setup({
    after = 'onedark.nvim',
    show_warnings = true, -- Show warning if any required option is missing
    highlights = {
        modes = {
            ['i'] = modicator.get_highlight_fg('Question'),
            ['v'] = modicator.get_highlight_fg('Type'),
            ['V'] = modicator.get_highlight_fg('Type'),
            ['�'] = modicator.get_highlight_fg('Type'),
            ['s'] = modicator.get_highlight_fg('Keyword'),
            ['S'] = modicator.get_highlight_fg('Keyword'),
            ['R'] = modicator.get_highlight_fg('Title'),
            ['c'] = modicator.get_highlight_fg('Constant'),
        },
    },
})

local status_ok, live_server = pcall(require, "live_server")
if not status_ok then
    return
end

live_server.setup({
    port = 8080,
    browser_command = "", -- Empty string starts up with default browser
    quiet = false,
    no_css_inject = false, -- Disables css injection if true, might be useful when testing out tailwindcss
})

-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
