-- ========================================================================== --
-- ==                NEORG: ORGANIZE YOUR LIFE PLUGIN                      == --
-- ========================================================================== --
--    Neorg (_Neo_: new, _org_:organization)	is a plugin designed to
--      reimagine orgaization as you know it.  Modernity meats instane
--      flexibility.  The furture of organizing your life in Neovim
--
return {
	"nvim-neorg/neorg",
	build = ":Neorg sync-parsers",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-neorg/neorg-telescope" },
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {}, -- Loads default behaviour
				["core.concealer"] = {}, -- Adds pretty icons to your documents
				["core.dirman"] = { -- Manages Neorg workspaces
					config = {
						workspaces = {
							quantum = "~/projects/notes/quantum-wiki/",
							work = "~/projects/notes/work/",
						},
						index = "index.norg",
						default_workspaces = "work",
					},
				},
				["core.export"] = {},
				["core.summary"] = {},
				["core.integrations.telescope"] = {},
				-- ["core.keybinds"] = {
				--   config = {
				--     neorg_leader = ",",
				--   },
				-- },
			},
		})
	end,
}
