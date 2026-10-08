local current

local function set_colorscheme_by_time()
	local hour = tonumber(os.date("%H"))

	local wanted = (hour >= 8 and hour < 17) and "rose-pine-dawn" or "rose-pine-moon"

	if wanted ~= current then
		vim.cmd.colorscheme(wanted)
		current = wanted
	end
end

-- Set colorscheme now and re-check every 5 minutes
vim.uv.new_timer():start(0, 5 * 60 * 1000, vim.schedule_wrap(set_colorscheme_by_time))
