-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	use("bluz71/vim-nightfly-guicolors")
	use("szw/vim-maximizer")
	use("christoomey/vim-tmux-navigator")
	use("nvim-tree/nvim-tree.lua")
	use("tpope/vim-surround")
	use("vim-scripts/ReplaceWithRegister")
	use("numToStr/Comment.nvim")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	use({ "catppuccin/nvim", as = "catppuccin" })
	use({

		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion
	-- Simple plugins can be specified as strings
	use("rstacruz/vim-closer")
	use("theprimeagen/harpoon")
	use({
		"jiaoshijie/undotree",
		config = function()
			require("undotree").setup({
				float_diff = true, -- using float window previews diff, set this `true` will disable layout option
				layout = "left_bottom", -- "left_bottom", "left_left_bottom"
				position = "left", -- "right", "bottom"
				ignore_filetype = {
					"undotree",
					"undotreeDiff",
					"qf",
					"TelescopePrompt",
					"spectre_panel",
					"tsplayground",
				},
				window = {
					winblend = 30,
				},
				keymaps = {
					["j"] = "move_next",
					["k"] = "move_prev",
					["gj"] = "move2parent",
					["J"] = "move_change_next",
					["K"] = "move_change_prev",
					["<cr>"] = "action_enter",
					["p"] = "enter_diffbuf",
					["q"] = "quit",
				},
			})
		end,
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})
	use("nvim-lua/plenary.nvim")
	use("folke/tokyonight.nvim")
	-- LSP Support
	use("VonHeikemen/lsp-zero.nvim")
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	-- nvim v0.7.2
	use("mfussenegger/nvim-lint")
	use({
		"kdheepak/lazygit.nvim",
		requires = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("telescope").load_extension("lazygit")
		end,
	})
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		requires = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	}) -- enhanced lsp uis
	use("mfussenegger/nvim-dap")
	use("folke/neodev.nvim")
	use("rcarriga/nvim-dap-ui")
	use("nvim-tree/nvim-web-devicons")
	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-Lorem
	use("jose-elias-alvarez/typescript.nvim")
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags
end)
