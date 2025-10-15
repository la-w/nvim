return {
	"lervag/vimtex",
	lazy = false, -- VimTex is already lazy loaded by default
	ft = { "tex" },
	init = function()
		-- Set PDF viewer options
		vim.g.vimtex_view_method = "skim" -- for Linux use "zathura"

		vim.g.vimtex_compiler_method = "latexmk"

		-- Configure Skim for forward/inverse search -> might be subject to change later on
		vim.g.vimtex_view_skim_sync = 1
		vim.g.vimtex_view_skim_activate = 1
	end,
}
