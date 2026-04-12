local plugin_specs = {}
local plugin_dirs = {
	"plugins",
	"plugins/Ui",
	"plugins/Editor",
	"plugins/Navigation",
	"plugins/Devtools",
}

for _, dir in ipairs(plugin_dirs) do
	table.insert(plugin_specs, { import = dir })
end

-- 正确、不会卡死的 Lazy.nvim 配置
require("lazy").setup({
	spec = plugin_specs,

	-- 关闭自动检查更新（这就是卡死的元凶！）
	checker = { --控制 Lazy.nvim 是否自动检查插件更新
		enabled = false, --彻底关闭自动更新检查
		notify = false, ---关闭更新通知
	},
	-- 关闭自动安装缺失插件
	install = { --插件安装配置组
		missing = false, --关闭启动时自动安装缺失插件
	},
	-- 性能优化
	performance = { --Neovim 启动性能优化配置组
		rtp = { --运行时路径
			disabled_plugins = { --禁用指定的 Neovim 内置插件
				"gzip",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
