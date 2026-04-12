-- ==============================================
-- CMake 编译运行（弹出窗口显示日志）
-- ==============================================
vim.api.nvim_create_user_command("Make", function()
	vim.cmd("botright split | terminal cmake -S . -B build && make -C build -j$(nproc)")
end, { desc = "CMake 编译（弹出窗口）" })

vim.api.nvim_create_user_command("Run", function()
	vim.cmd("botright split | terminal ./build/myapp")
end, { desc = "运行程序（弹出窗口）" })

vim.api.nvim_create_user_command("Clean", function()
	vim.cmd("botright split | terminal rm -rf build && echo '✅ 清理完成'")
end, { desc = "清理 build（弹出窗口）" })

-- --------------
-- 快捷键
-- --------------
vim.keymap.set("n", "<F5>", ":Make<CR>:Run<CR>", { desc = "编译+运行" })
vim.keymap.set("n", "<F6>", ":Run<CR>", { desc = "仅运行" })
vim.keymap.set("n", "<F7>", ":Make<CR>", { desc = "仅编译" })
vim.keymap.set("n", "<F8>", ":Clean<CR>", { desc = "清理" })
