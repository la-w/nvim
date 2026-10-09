return {
	{ -- Autocompletion
		"saghen/blink.cmp",
		event = "InsertEnter",
		version = "1.*",
		dependencies = {
			-- Snippet Engine & its associated nvim-cmp source
			{
				"L3MON4D3/LuaSnip",
				version = "2.x",
				build = (function()
					-- Build Step is needed for regex support in snippets.
					-- This step is not supported in many windows environments.
					-- Remove the below condition to re-enable on windows.
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
				dependencies = {
					-- `friendly-snippets` contains a variety of premade snippets.
					--    See the README about individual language/framework/plugin snippets:
					--    https://github.com/rafamadriz/friendly-snippets
					{
						"rafamadriz/friendly-snippets",
						config = function()
							require("luasnip.loaders.from_vscode").lazy_load()
						end,
					},
				},
				opts = {},
			},
		},
		-- @module 'blink.cmp'
		-- @type blink.cmp.Config
		opts = {
			keymap = {
				-- 'default' preset
				-- <C-n>/<C-p> select [n]ext/[p]revious, <C-y> to accept ([y]es) completion,
				-- <C-b>/<C-f> scroll docs [b]ack and [f]orward, <C-Space> open menu/docs,
				-- <C-e> close menu, <C-k> toggle signature help
				preset = "default",

				-- Set <Tab> to false for Copilot (subject to change) instead of snippet jumping
				["<Tab>"] = false,
				["<S-Tab>"] = false,

				-- Jump forward/backward within a snippet expansion
				["<C-l>"] = { "snippet_forward", "fallback" },
				["<C-h>"] = { "snippet_backward", "fallback" },
			},

			appearance = {
				-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "mono",
			},

			completion = {
				-- (Default) Only show the documentation popup when manually triggered
				-- Preselect the first item but don't insert it until accepted (like "noinsert")
				list = { selection = { preselect = true, auto_insert = false } },
				documentation = { auto_show = true, auto_show_delay_ms = 200 },
			},

			sources = {
				default = { "lsp", "path", "snippets", "lazydev" },
				providers = {
					lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
				},
			},

			snippets = { preset = "luasnip" },

			-- Show function signatures while typing arguments
			signature = { enabled = true },
		},
	},
}
