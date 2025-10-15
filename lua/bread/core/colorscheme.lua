local function set_colorscheme_by_time()
	local hour = tonumber(os.date("%H"))
	-- local hour = 20 -- for testing
	if hour >= 8 and hour < 19 then
		vim.cmd("colorscheme rose-pine-dawn")
	else
		vim.cmd("colorscheme rose-pine-moon")
	end
end

-- set colorscheme based on time of day
set_colorscheme_by_time()

-- Update colorscheme every hour
vim.uv.new_timer():start(0, 60 * 60 * 1000, vim.schedule_wrap(set_colorscheme_by_time))
