--vim.g.mapleader = " "

-- 1. 先设置 leader 键为空格（必须先设！）
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 2. 绑定 <leader>q 为退出 Neovim
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "退出 Neovim" })

-- 可选：绑定 <leader>Q 为强制退出（不保存）
vim.keymap.set("n", "<leader>Q", "<cmd>q!<CR>", { desc = "强制退出 Neovim" })

-- 可选：绑定 <leader>wq 为保存并退出
vim.keymap.set("n", "<leader>wq", "<cmd>wq<CR>", { desc = "保存并退出" })

vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("i", "jk", "<Esc>")
-- 空格 + w 保存
vim.keymap.set("n", "<space>w", ":w<CR>", { desc = "Save file" })

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

-- 在 keymaps.lua 里加
local themes = { "catppuccin", "solarized-osaka" }
local current = 1

vim.keymap.set("n", "<leader>tt", function()
	current = current % #themes + 1
	vim.cmd.colorscheme(themes[current])
	print("Switched to: " .. themes[current])
end, { desc = "切换主题" })

-- ==============================================
-- 项目列表快捷键：空格+p 打开
-- ==============================================
vim.keymap.set("n", "<leader>p", "<cmd>Telescope projects<CR>", { desc = "打开项目列表" })
