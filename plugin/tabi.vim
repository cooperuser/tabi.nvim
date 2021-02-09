if !has('nvim')
    echohl Error
	echom "Sorry, tabi.nvim requires neovim to have lua support!"
    echohl clear
    finish
endif

function! tabi#toggle()
	lua require("tabi").toggle()
endfunction

function! tabi#enable()
	lua require("tabi").enable()
endfunction

function! tabi#disable()
	lua require("tabi").disable()
endfunction

function! s:arglist(...)
	return "toggle\nenable\ndisable"
endfunction

function! s:command(...)
	if a:0 == 0 || a:1 == "toggle"
		call tabi#toggle()
	elseif a:1 == "enable"
		call tabi#enable()
	elseif a:1 == "disable"
		call tabi#disable()
	else
		echohl Error
		echom "Invalid argument: " . a:1
		echohl clear
	end
endfunction

command! -nargs=? -complete=custom,s:arglist Tabi call s:command(<f-args>)

