vim.g.mapleader = " "

-- 1. 先设置 leader 键为空格（必须先设！）
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

local opts = { noremap = true, silent = true }
-- 2. 绑定 <leader>q 为退出 Neovim
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "退出 Neovim" })

-- 可选：绑定 <leader>Q 为强制退出（不保存）
keymap.set("n", "<leader>Q", "<cmd>q!<CR>", { desc = "强制退出 Neovim" })

-- 可选：绑定 <leader>wq 为保存并退出
keymap.set("n", "<leader>wq", "<cmd>wq<CR>", { desc = "保存并退出" })

-- 普通模式下，按 <F5> 一键运行当前打开的 Lua 文件
keymap.set("n", "<F3>", ":source %<CR>", { desc = "运行当前Lua文件" })
keymap.set("n", "<C-e>", "<cmd>bdelete<CR>", { desc = "Ctrl+W 关闭当前文件" })

keymap.set("i", "jj", "<Esc>")
keymap.set("i", "jk", "<Esc>")
-- 空格 + w 保存
keymap.set("n", "<space>w", ":w<CR>", { desc = "Save file" })

-- ==============================================
-- Telescope 窗口专属快捷键：空格+q 一键关闭，零报错
-- ==============================================
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "TelescopePrompt", "TelescopeResults" },
	callback = function()
		-- 插入模式：空格+q 强制关闭（彻底规避所有报错）
		vim.keymap.set("i", "<leader>q", function()
			-- 直接强制删除 Telescope 缓冲区，无视 buftype/未保存修改
			vim.cmd("bdelete!")
		end, { buffer = true, desc = "关闭Telescope窗口" })

		-- 普通模式：空格+q 强制关闭
		vim.keymap.set("n", "<leader>q", function()
			vim.cmd("bdelete!")
		end, { buffer = true, desc = "关闭Telescope窗口" })
	end,
})

-- ==============================================
-- 项目列表快捷键：空格+p 打开
-- ==============================================
keymap.set("n", "<leader>p", "<cmd>Telescope projects<CR>", { desc = "打开项目列表" })
-- fd 搜索文件
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "fd 查找文件" })
-- rg 全局代码搜索
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "rg 全局文本搜索" })

-- New tab
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

keymap.set("n", "x", '"_x')
keymap.set("n", "<Leader>p", '"0p')
keymap.set("n", "<Leader>P", '"0P')
keymap.set("v", "<Leader>p", '"0p')
keymap.set("n", "<Leader>c", '"_c')
keymap.set("n", "<Leader>C", '"_C')
keymap.set("v", "<Leader>c", '"_c')
keymap.set("v", "<Leader>C", '"_C')
keymap.set("n", "<Leader>d", '"_d')
keymap.set("n", "<Leader>D", '"_D')
keymap.set("v", "<Leader>d", '"_d')
keymap.set("v", "<Leader>D", '"_D')
