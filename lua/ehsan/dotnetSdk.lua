vim.api.nvim_set_keymap("n", "<leader>cc", ":lua CreateClass()<CR>", { noremap = true, silent = true })

local setup, nvimtree = pcall(require, "nvim-tree.core")
if not setup then
	return
end

local utils = require("nvim-tree.utils")
local lib = require("nvim-tree.lib")

local function get_containing_folder(node)
	if node.nodes ~= nil then
		return utils.path_add_trailing(node.absolute_path)
	end
	local node_name_size = #(node.name or "")
	return node.absolute_path:sub(0, -node_name_size - 1)
end

function CreateClass()
	-- Prompt for class name
	local cwd = nvimtree.get_cwd()
	if cwd == nil then
		return
	end
	local node = lib.get_node_at_cursor()
	node = node and lib.get_last_group_node(node)
	if not node or node.name == ".." then
		node = {
			absolute_path = cwd,
			name = "",
			nodes = nvimtree.get_explorer().nodes,
			open = true,
		}
	end

	local containing_folder = get_containing_folder(node)

	-- Get current directory or prompt for it if not set
	local current_dir = containing_folder or vim.ui.input({ prompt = "Enter directory: " })
	vim.ui.input({ prompt = "Enter class name " .. current_dir .. ": " }, function(name)
		if name ~= nil then
			if current_dir ~= nil then
				-- Construct the command
				local command = string.format("!dotnet new class -n %s -o %s", name, current_dir)

				-- Execute the command silently
				vim.api.nvim_command(command)
			else
				vim.notify("Directory not specified.", vim.lsp.log_levels.ERROR)
			end
		end
	end)
end
