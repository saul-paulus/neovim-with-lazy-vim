local M = {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
	},
}

function M.config()
	local servers = {
		"lua_ls",
		"cssls",
		"html",
		"tsserver",
		"pyright",
		"bashls",
		"jsonls",
	}

	require("mason").setup({
		ui = {
			border = "rounded",
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
		log_level = vim.log.levels.INFO,
		max_concurrent_installers = 4,
	})

	require("mason-lspconfig").setup({
		ensure_installed = {
			"lua_ls",
			"bashls",
			"clangd",
			"cssls",
			"cssmodules_ls",
			"dockerls",
			"eslint",
			"golangci_lint_ls",
			"gopls",
			"html",
			"jsonls",
			"quick_lint_js",
			"intelephense",
			"phpactor",
			"psalm",
			"pyright",
			"tsserver",
		},
		handlers = nil,
		automatic_installation = false,
		cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUpdate", "MasonUninstallAll", "MasonLog" },
	})
end

return M
