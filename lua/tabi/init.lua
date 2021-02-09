local tabi = {}

local ns = -1
local enabled = true
local visible = true
local timer = -1
local cursor = {}

local function is_on_tab()
	local line = vim.api.nvim_get_current_line()
	return line:sub(cursor[2] + 1, cursor[2] + 1) == "\t"
end

local function hide_indent()
	vim.api.nvim_buf_clear_namespace(0, ns, 1, -1)
end

local function show_indent()
	vim.api.nvim_buf_add_highlight(
		0,
		ns,
		"TabiIndent",
		tonumber(cursor[1] - 1),
		tonumber(cursor[2]),
		tonumber(cursor[2] + 1)
	)
end

local function blink()
	if visible then
		show_indent()
	else
		hide_indent()
	end
	visible = not visible
end

function tabi.cursor_move()
	if not enabled then return end

	vim.fn["timer_stop"](timer)
	hide_indent()

	cursor = vim.api.nvim_win_get_cursor(0)
	if is_on_tab() then
		visible = true
		timer = vim.fn["timer_start"](500, blink, {["repeat"] = 30})
		blink()
	end
end

function tabi.insert_enter()
	vim.fn["timer_stop"](timer)
	hide_indent()
end

function tabi.insert_leave()
	tabi.cursor_move()
end

function tabi.enable()
	enabled = false
	tabi.toggle()
end

function tabi.disable()
	enabled = true
	tabi.toggle()
end

function tabi.setup(opts)
	opts = opts or {}
	ns = vim.api.nvim_create_namespace("tabi")
	vim.cmd("autocmd CursorMoved * lua require('tabi').cursor_move()")
	vim.cmd("autocmd InsertEnter * lua require('tabi').insert_enter()")
	vim.cmd("autocmd InsertLeave * lua require('tabi').insert_leave()")
end

function tabi.toggle()
	enabled = not enabled
	if enabled then
		tabi.cursor_move()
		return true
	end
	vim.fn["timer_stop"](timer)
	hide_indent()
	return false
end

return tabi

