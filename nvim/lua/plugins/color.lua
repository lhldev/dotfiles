return {
	{ -- You can easily change to a different colorscheme.
		-- Change the name of the colorscheme plugin below, and then
		-- change the command in the config to whatever the name of that colorscheme is.
		--
		-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
		"ellisonleao/gruvbox.nvim",
		priority = 1000, -- Make sure to load this before all the other start plugins.
		config = function()
			-- Load the colorscheme here.
			-- Like many other themes, this one has different styles, and you could load
			-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
			require("gruvbox").setup({
				contrast = "hard", -- Optional: "hard", "soft", or "" for standard contrast
			})
			vim.cmd.colorscheme("gruvbox")
			vim.api.nvim_set_hl(0, "NormalNC", { bg = "#1a1a1a" })
		end,
	},
}
