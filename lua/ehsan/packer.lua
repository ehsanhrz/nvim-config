-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
        end
	}
	use { "catppuccin/nvim", as = "catppuccin" }
	use {

		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	-- Simple plugins can be specified as strings
	use 'rstacruz/vim-closer'
	use 'theprimeagen/harpoon'
	use {
		"jiaoshijie/undotree",
		config = function()
			require('undotree').setup({
				float_diff = true,  -- using float window previews diff, set this `true` will disable layout option
				layout = "left_bottom", -- "left_bottom", "left_left_bottom"
				position = "left", -- "right", "bottom"
				ignore_filetype = { 'undotree', 'undotreeDiff', 'qf', 'TelescopePrompt', 'spectre_panel', 'tsplayground' },
				window = {
					winblend = 30,
				},
				keymaps = {
					['j'] = "move_next",
					['k'] = "move_prev",
					['gj'] = "move2parent",
					['J'] = "move_change_next",
					['K'] = "move_change_prev",
					['<cr>'] = "action_enter",
					['p'] = "enter_diffbuf",
					['q'] = "quit",
				},
			})
		end,
		requires = {
			"nvim-lua/plenary.nvim",
		},
	}
    use 'nvim-lua/plenary.nvim'
    use ("folke/tokyonight.nvim")
  -- LSP Support
    use ("VonHeikemen/lsp-zero.nvim")
    use ("neovim/nvim-lspconfig")
    use ("hrsh7th/cmp-nvim-lsp")
    use ("hrsh7th/nvim-cmp")
    use("L3MON4D3/LuaSnip")
    use("williamboman/mason.nvim")
    use('williamboman/mason-lspconfig.nvim')
    -- nvim v0.7.2
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
end)
