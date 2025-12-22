return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")
			vim.keymap.set("n", "<leader>a", function()
				harpoon:list():add()
			end, { desc = "Harpoon: Add file" })
			vim.keymap.set("n", "<C-e>", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end, { desc = "Harpoon: Menu" })

			-- Loop for files 1-9
			for i = 1, 9 do
				vim.keymap.set("n", "<leader>" .. i, function()
					harpoon:list():select(i)
				end, { desc = "Harpoon: Select " .. i })
			end

			-- File 10 (mapped to 0)
			vim.keymap.set("n", "<leader>0", function()
				harpoon:list():select(10)
			end, { desc = "Harpoon: Select 10" })
		end,
	},
}
