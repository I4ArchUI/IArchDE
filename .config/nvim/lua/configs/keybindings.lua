-- add yours here
local map = vim.keymap.set

local builtin = require("telescope.builtin")
map('n', '<C-,>', builtin.find_files, {})
map('n', '<C-o>', builtin.find_files, {})
map('n', '<C-Tab>', builtin.buffers, { desc = 'Telescope buffers' })
map('n', '<C-b>', builtin.buffers, { desc = 'Telescope buffers' })

map('n', '<C-`>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
map('n', '<A-`>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

map('n', '<A-Left>', '<C-w>h', { noremap = true, silent = true })  -- Chuyển đến buffer trước
map('n', '<A-Right>', '<C-w>l', { noremap = true, silent = true }) -- Chuyển đến buffer tiếp theo

map("n", ";", ":", { desc = "CMD enter command mode" })

--[[--------------------------------------------------------------------------------------------------------

███    ██  ██████  ██████  ███    ███  █████  ██          ███████ ██   ██  ██████  ██████  ████████  ██████ ██    ██ ████████
████   ██ ██    ██ ██   ██ ████  ████ ██   ██ ██          ██      ██   ██ ██    ██ ██   ██    ██    ██      ██    ██    ██
██ ██  ██ ██    ██ ██████  ██ ████ ██ ███████ ██          ███████ ███████ ██    ██ ██████     ██    ██      ██    ██    ██
██  ██ ██ ██    ██ ██   ██ ██  ██  ██ ██   ██ ██               ██ ██   ██ ██    ██ ██   ██    ██    ██      ██    ██    ██
██   ████  ██████  ██   ██ ██      ██ ██   ██ ███████     ███████ ██   ██  ██████  ██   ██    ██     ██████  ██████     ██

--------------------------------------------------------------------------------------------------------]] --
map({ 'n', 'v' }, '`', '<esc><C-v>', { noremap = true, silent = true })
map({ 'x' }, '<enter>', '<S-a>', { noremap = true, silent = true })
map({ 'i', 'n' }, '<C-x>', '<esc>"+dd<esc>', { noremap = true, silent = true })
map({ 'v' }, '<C-x>', '"+dd<esc>', { noremap = true, silent = true })

map({ 'n' }, '<enter>', 'i', { noremap = true, silent = true })

map({ 'n', 'v' }, '<C-v>', '<esc>"+p', { noremap = true, silent = true })
map({ 'i' }, '<C-v>', '<esc>"+p ==gi', { noremap = true, silent = true })

map({ 'v' }, '<C-c>', '"+y', { noremap = true, silent = true })
map({ 'i', 'n' }, '<C-c>', '<esc>"+yy', { noremap = true, silent = true })
map({ 'i', 'n' }, '<C-d>', '<esc>"+yyp', { noremap = true, silent = true })

map({ 'i', 'n' }, '<C-Del>', '<esc>daw', { noremap = true, silent = true })
map({ 'i', 'n' }, '<C-Backspace>', '<C-w>', { noremap = true, silent = true })

map({ 'i', 'n', 'v' }, '<C-z>', '<esc>u<esc>', { noremap = true, silent = true })

map("n", "<C-/>", "gcc", { desc = "Toggle Comment", remap = true })
map("i", "<C-/>", "<esc>gcci", { desc = "Toggle Comment", remap = true })
map("v", "<C-/>", "gc", { desc = "Toggle comment", remap = true })

-- Toggle fold tại vị trí con trỏ
map('n', '<C-CR>', 'za', { noremap = true, silent = true })

-- Toggle tất cả các fold tại vị trí con trỏ
map('n', '<C-S-CR>', 'zA', { noremap = true, silent = true })

map({ 'i', 'n', 'v' }, '<C-q>', '<esc>:q<CR>', { noremap = true, silent = true })
map({ 'i', 'n', 'v' }, '<C-S-q>', '<esc>:qa<CR>', { noremap = true, silent = true })
map({ 'i', 'n', 'v' }, '<C-s>', function()
	local filename = vim.fn.expand("%:t")
	vim.notify("Formatting...", "warn")
	vim.cmd("lua vim.lsp.buf.format()")
	vim.cmd("w")
	vim.notify(filename .. " saved", "success", { title = "Saving..." })
end, { noremap = true, silent = true })

--[[--------------------------------------------------------------------------------------------------------

███    ███  ██████  ██    ██ ███████     ███████ ██   ██  ██████  ██████  ████████  ██████ ██    ██ ████████
████  ████ ██    ██ ██    ██ ██          ██      ██   ██ ██    ██ ██   ██    ██    ██      ██    ██    ██
██ ████ ██ ██    ██ ██    ██ █████       ███████ ███████ ██    ██ ██████     ██    ██      ██    ██    ██
██  ██  ██ ██    ██  ██  ██  ██               ██ ██   ██ ██    ██ ██   ██    ██    ██      ██    ██    ██
██      ██  ██████    ████   ███████     ███████ ██   ██  ██████  ██   ██    ██     ██████  ██████     ██

--------------------------------------------------------------------------------------------------------]] --
-- Di chuyển dòng hiện tại lên
map('n', '<A-Up>', ':m .-2<CR>==', { noremap = true, silent = true })
map('i', '<A-Up>', '<Esc>:m .-2<CR>==gi', { noremap = true, silent = true })

-- Di chuyển dòng hiện tại xuống
map('n', '<A-Down>', ':m .+1<CR>==', { noremap = true, silent = true })
map('i', '<A-Down>', '<Esc>:m .+1<CR>==gi', { noremap = true, silent = true })

-- Tab nhiều lần để thụt lề
map({ 'n', 'v' }, '<Tab>', '>gv', { noremap = true, silent = true })

-- Shift-Tab nhiều lần để giảm thụt lề
map({ 'n', 'v' }, '<S-Tab>', '<gv', { noremap = true, silent = true })

-- Bôi đen nhanh với Shift + Mũi tên
map({ 'i', 'n' }, '<S-Left>', '<esc>v<Left>', { noremap = true, silent = true })
map({ 'i', 'n' }, '<S-Right>', '<esc>v<Right>', { noremap = true, silent = true })

-- Bôi đen theo từ với Ctrl + Shift + Mũi tên
map({ 'i', 'n' }, '<C-S-Left>', '<esc>vib', { noremap = true, silent = true })
map({ 'i', 'n' }, '<C-S-Right>', '<esc>viw', { noremap = true, silent = true })

-- Bôi đen các dòng bên dưới với Shift + Mũi tên xuống
map({ 'i', 'n' }, '<S-Down>', '<esc>^V', { noremap = true, silent = true })
map('v', '<S-Down>', ':<C-u>.+1<CR>gv', { noremap = true, silent = true })

map({ 'i', 'n' }, '<S-Up>', '<esc>$V', { noremap = true, silent = true })
map('v', '<S-Up>', ':<C-u>.-1<CR>gv', { noremap = true, silent = true })

map({ 'i', 'n' }, '<C-Down>', '<esc>5j==', { noremap = true, silent = true })
map({ 'i', 'n' }, '<C-Up>', '<esc>5k==', { noremap = true, silent = true })
