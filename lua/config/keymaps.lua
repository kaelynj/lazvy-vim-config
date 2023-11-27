-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- Map local leader to ','
vim.g.maplocalleader = ","

-------------------------------------------------------------------------------
-- SET NEORG MOTIONS AND REGISTER THEM TO WHICH-KEY
-------------------------------------------------------------------------------
--
--  Couple toggle concealer with the conceallevel
vim.keymap.set("n", "<leader>nt", function()
	if vim.opt.conceallevel:get() == 2 then
		vim.opt.conceallevel = 0
	elseif vim.opt.conceallevel:get() == 0 then
		vim.opt.conceallevel = 2
	end
	vim.cmd.Neorg("toggle-concealer")
end)

-- Register neorg motions to whichkey
local wk = require("which-key")
wk.register({
	["<leader>n"] = {
		name = "+Neorg",
		w = {
			name = "+workspace",
			w = { "<cmd>Neorg workspace work<cr>", "Open 'work' workspace" },
			q = { "<cmd>Neorg workspace quantum<cr>", "Open Qauntum Wiki workspace" },
		},
		j = {
			name = "+journal",
			c = { "<cmd>Neorg journal custom<cr>", "Custom journal" },
			j = { "<cmd>Neorg journal template<cr>", "Template journal" },
			t = { "<cmd>Neorg journal today<cr>", "Today journal" },
			m = { "<cmd>Neorg journal tomorrow<cr>", "Tomorrow journal" },
			y = { "<cmd>Neorg journal yesterday<cr>", "Yesterday journal" },
		},
		t = "Toggle concealer",
		r = { "<cmd>Neorg return<cr>", "Exit neorg" },
	},
})
