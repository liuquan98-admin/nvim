-- Neovim 入口文件
-- 所有配置统一放在 lua/config/ 下

-- 加载基础设置

--require("config.basic")
-- 加载快捷键
vim.opt.clipboard = ""
require("config.keymaps")
require("core.lazy")
require("cmake.cmake")
require("config.basic")

--require("config.lsp")
--vim.deprecate = function() end --屏蔽所有弃用警告
-- 加载 Lua 语法提示（LSP）
-- 延迟加载剪贴板，彻底解决启动卡死问题
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		-- 仅在进入编辑器后，才启用剪贴板
		vim.opt.clipboard = "unnamedplus"
		-- 强制指定剪贴板工具，避免自动检测超时
		vim.g.clipboard = {
			name = "xclip",
			copy = {
				["+"] = "xclip -selection clipboard",
				["*"] = "xclip -selection primary",
			},
			paste = {
				["+"] = "xclip -selection clipboard -o",
				["*"] = "xclip -selection primary -o",
			},
			cache_enabled = 1, -- 启用缓存，减少 xclip 调用
		}
	end,
	once = true, -- 仅执行一次，避免重复加载
})
