-- ==============================================
-- 基础 UI 与 编辑体验配置（基于你截图的参数优化）
-- ==============================================

-- 1. 界面与视觉
vim.opt.termguicolors = true -- 开启真彩色
vim.opt.cursorline = true -- 高亮当前行
vim.opt.number = true -- 显示绝对行号
vim.opt.relativenumber = true -- 显示相对行号
vim.opt.numberwidth = 4 -- 行号宽度
vim.opt.signcolumn = "yes" -- 始终显示符号列
vim.opt.hidden = true -- 允许隐藏未保存缓冲区

-- 2. 代码折叠 (结合你之前的 UFO 插件)
vim.opt.foldenable = true -- 开启折叠
vim.opt.foldlevel = 99 -- 默认展开所有
vim.opt.foldlevelstart = 99 -- 启动时全部展开
vim.opt.foldcolumn = "1" -- 显示折叠列

-- 3. 编辑与系统交互
vim.opt.swapfile = false -- 关闭交换文件 (嵌入式开发推荐)
vim.opt.clipboard = "unnamedplus" -- 同步系统剪贴板 (最重要！)
vim.opt.smartindent = true -- 智能缩进
vim.opt.wrap = false -- 禁止折行 (代码太长不折行)

-- 4. 搜索
vim.opt.wrapscan = true -- 搜索循环
vim.opt.ignorecase = true -- 搜索忽略大小写
vim.opt.smartcase = true -- 有大写时区分大小写
