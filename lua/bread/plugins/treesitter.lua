return {
	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false, -- Treesitter does not support lazy-loading
		build = ":TSUpdate",
		config = function()
			-- [[ Configure Treesitter ]] See `:help nvim-treesitter`
			-- Parsers to install (no-op if already installed).
			-- Requires the tree-sitter CLI (>= 0.26.1) and a C compiler.
			-- Note: For latex the tree-sitter CLI needs to be installed
			require("nvim-treesitter").install({
				"python",
				"c",
				"rust",
				"lua",
				"luadoc",
				"latex",
				"markdown",
				"markdown_inline",
				"html",
				"query",
				"vim",
				"vimdoc",
			})

			-- Highlighting is no longer enabled and is directly provided by Neovim. Starting it by buffer.
			local max_filesize = 100 * 1024 -- 100KB

			vim.api.nvim_create_autocmd("FileType", {
				desc = "Start treesitter highlighting",
				group = vim.api.nvim_create_augroup("treesitter-start", { clear = true }),
				callback = function(args)
					local buf = args.buf
					local lang = vim.treesitter.language.get_lang(vim.bo[buf].filetype)

					-- Skip filetypes without an installed parser
					if not lang or not vim.treesitter.language.add(lang) then
						return
					end

					-- Skip large files
					local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return
					end

					vim.treesitter.start(buf, lang)
				end,
			})
		end,
	},
}

-- There are additional nvim-treesitter modules that you can use to interact
-- with nvim-treesitter. You should go explore a few and see what interests you:
--
--    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
--    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
--    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
