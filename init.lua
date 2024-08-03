vim.g.mapleader = " "
vim.o.number = true
vim.o.background = "dark"
vim.o.autoread = true
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.whichwrap = '<,>,[,],h,l'

vim.cmd([[ autocmd FocusGained,BufEnter * checktime ]])

vim.api.nvim_set_option("clipboard", "unnamedplus")
-- vim.keymap.set({ 'n', 'v' }, 'y', '"+y')
-- vim.keymap.set({ 'n', 'v' }, 'p', '"+p')

require("config.lazy")
local wk = require('which-key')

vim.cmd.colorscheme "gruvbox"

local function opts_descr(desc, ignore)
    ignore = ignore or false

    if ignore == true then
        desc = "which_key_ignore"
    end

    return {
        noremap = true,
        silent = true,
        desc = desc
    }
end

setter = vim.keymap.set
setter({ 'n', 't' }, '<C-b>', '<cmd>ToggleTerm<CR>')

setter({ 'n', 'v' }, '<C-k>', '3k')
setter({ 'n', 'v' }, '<C-j>', '3j')
setter({ 'n', 'v' }, '<C-h>', 'b')
setter({ 'n', 'v' }, '<C-l>', 'e')

setter('i', '<C-k>', '<C-o>k')
setter('i', '<C-j>', '<C-o>j')
setter('i', '<C-h>', '<C-o>h')
setter('i', '<C-l>', '<C-o>l')

setter('i', '<C-d>', '<C-o>dw')
setter('i', '<C-u>', '<C-o>u')
setter('i', '<C-r>', '<C-o><C-r>')

setter("v", "<Tab>", ">gv")
setter("v", "<S-Tab>", "<gv")
setter('n', '<Tab>', ':bnext<CR>')
setter('n', '<S-Tab>', ':bprevious<CR>')

setter('i', '{', '{}<Esc>ha')
setter('i', '(', '()<Esc>ha')
setter('i', '[', '[]<Esc>ha')
setter('i', '"', '""<Esc>ha')
setter('i', "'", "''<Esc>ha")
setter('i', '`', '``<Esc>ha')
setter('i', '<', '<><Esc>ha')

setter('v', '{', 'c{}<Esc>hp')
setter('v', '(', 'c()<Esc>hp')
setter('v', '[', 'c[]<Esc>hp')
setter('v', '"', 'c""<Esc>hp')
setter('v', "'", "c''<Esc>hp")
setter('v', '`', 'c``<Esc>hp')
setter('v', '<', 'c<><Esc>hp')

setter({ 'n', 'i' }, '<A-j>', '<CMD>m .1<CR>')
setter({ 'n', 'i' }, '<A-k>', '<CMD>m .-2<CR>')
setter("v", "<A-j>", ":m '>1<CR>gv=gv")
setter("v", "<A-k>", ":m '<-2<CR>gv=gv")

setter('n', '<leader>i', require('nvim-tree.api').tree.change_root_to_node, opts_descr("Change Root", true))


mapper = vim.api.nvim_set_keymap
wk.add { { "<leader>c", group = "Comments", icon = '#' } }

-- WK Ignore Group
mapper('n', '<leader>ç', ':qa<CR>', opts_descr("EXIT"))
mapper('n', '<leader>z', ':noh<CR>', opts_descr("Hightlight off", true))
mapper('n', '<leader>q', ':q<CR>', opts_descr("Close Windows", true))
mapper('n', '<leader>h', '<C-w>h', opts_descr("Left window", true))
mapper('n', '<leader>j', '<C-w>j', opts_descr("Bottom window", true))
mapper('n', '<leader>k', '<C-w>k', opts_descr("Top window", true))
mapper('n', '<leader>l', '<C-w>l', opts_descr("Right window", true))
mapper("n", "<leader>s", ":ASToggle<CR>", opts_descr("On/Off Auto Save", true))
mapper('n', '<leader>e', ':NvimTreeToggle<CR>', opts_descr("Toggle Tree", true))

wk.add { { "<leader>g", group = "GIT" } }
mapper('n', '<leader>gn', "<cmd>lua require('gitsigns').next_hunk()<CR>", opts_descr("Next hunk"))
mapper('n', '<leader>gp', "<cmd>lua require('gitsigns').prev_hunk()<CR>", opts_descr("Previous hunk"))
mapper('n', '<leader>gs', "<cmd>lua require('gitsigns').stage_hunk()<CR>", opts_descr("Stage hunk"))
mapper('n', '<leader>gu', "<cmd>lua require('gitsigns').undo_stage_hunk()<CR>", opts_descr("Undo stage hunk"))
mapper('n', '<leader>gr', "<cmd>lua require('gitsigns').reset_hunk()<CR>", opts_descr("Reset hunk"))
mapper('n', '<leader>gg', "<cmd>lua require('gitsigns').preview_hunk()<CR>", opts_descr("Preview hunk"))
mapper('n', '<leader>gD', "<cmd>lua require('gitsigns').diffthis()<CR>", opts_descr("Diff"))
mapper('n', '<leader>gd', "<cmd>lua require('gitsigns').toggle_deleted()<CR>", opts_descr("Toggle deleted"))

wk.add { { "<leader>t", group = "Telescope" } }
mapper('n', '<leader>tp', ':Telescope find_files<CR>', opts_descr("Find files"))
mapper('n', '<leader>tl', ':Telescope live_grep<CR>', opts_descr("Live grep"))
mapper('n', '<leader>tb', ':Telescope buffers<CR>', opts_descr("List buffers"))
mapper('n', '<leader>tg', ':Telescope git_status<CR>', opts_descr("List Git Status"))
mapper('v', '<leader>tw', 'y:Telescope live_grep default_text=<C-r>"<CR>', opts_descr("Grep selection"))

wk.add { { "<leader>f", group = "LSP", icon = '+' } }
mapper('n', '<leader>fd', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts_descr("Go to declaration"))
mapper('n', '<leader>fg', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts_descr("Show hover info"))
mapper('n', '<leader>fh', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts_descr("Show signature help"))
mapper('n', '<leader>fD', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', opts_descr("Go to type definition"))
mapper('n', '<leader>fr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts_descr("List references"))
mapper('n', '<leader>fb', '<Cmd>lua vim.diagnostic.goto_prev()<CR>', opts_descr("Go to previous diagnostic"))
mapper('n', '<leader>fn', '<Cmd>lua vim.diagnostic.goto_next()<CR>', opts_descr("Go to next diagnostic"))
mapper('n', '<leader>ff', '<Cmd>lua vim.diagnostic.open_float()<CR>', opts_descr("Show diagnostics in float"))
mapper('n', '<leader>fl', '<Cmd>lua vim.lsp.buf.format()<CR>', opts_descr("Format code"))
mapper('n', '<leader>fa', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts_descr("Import"))

wk.add { { "<leader>b", group = "Buffer" } }
mapper('n', '<leader>bn', ':bnext<CR>', opts_descr("Go to next buffer"))
mapper('n', '<leader>bb', ':bprevious<CR>', opts_descr("Go to previous buffer"))
mapper('n', '<leader>bc', ':bdelete<CR>', opts_descr("Close current buffer"))
mapper('n', '<leader><Tab>', ':bdelete<CR>:bnext<CR>', opts_descr("Close current buffer", true))
