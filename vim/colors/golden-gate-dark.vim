" golden-gate-dark.vim - Dark Golden Gate Vim theme
" Maintainer: Sam Rawal
" License: MIT

set background=dark

if exists("+termguicolors")
  set termguicolors
endif

highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "golden-gate-dark"

let s:bg = "#10130f"
let s:bg_alt = "#181b16"
let s:bg_soft = "#20251d"
let s:bg_strong = "#2c3325"
let s:fg = "#eadfca"
let s:fg_muted = "#b7aa90"
let s:fg_faint = "#7d735f"
let s:bridge = "#d66a4d"
let s:bridge_light = "#ef8667"
let s:bay = "#5ca7c9"
let s:bay_light = "#87c4df"
let s:bay_soft = "#173142"
let s:cypress = "#8fa866"
let s:cypress_light = "#aac276"
let s:copper = "#c98243"
let s:copper_light = "#e19a5e"
let s:copper_dark = "#7f4a28"
let s:cliff = "#b7955a"
let s:wood = "#d0b88b"
let s:rust_shadow = "#bf7c66"
let s:cyan = "#65b8c7"
let s:warning = "#d08a4e"
let s:none = "NONE"

function! s:cterm(color) abort
  if a:color ==# "NONE"
    return "NONE"
  endif

  let l:hex = substitute(a:color, "^#", "", "")
  if strlen(l:hex) != 6
    return "NONE"
  endif

  let l:r = str2nr(l:hex[0:1], 16)
  let l:g = str2nr(l:hex[2:3], 16)
  let l:b = str2nr(l:hex[4:5], 16)
  let l:levels = [0, 95, 135, 175, 215, 255]
  let l:best = 16
  let l:best_dist = 999999

  for l:ri in range(0, 5)
    for l:gi in range(0, 5)
      for l:bi in range(0, 5)
        let l:dr = l:r - l:levels[l:ri]
        let l:dg = l:g - l:levels[l:gi]
        let l:db = l:b - l:levels[l:bi]
        let l:dist = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
        if l:dist < l:best_dist
          let l:best_dist = l:dist
          let l:best = 16 + (36 * l:ri) + (6 * l:gi) + l:bi
        endif
      endfor
    endfor
  endfor

  for l:i in range(0, 23)
    let l:level = 8 + (10 * l:i)
    let l:dr = l:r - l:level
    let l:dg = l:g - l:level
    let l:db = l:b - l:level
    let l:dist = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
    if l:dist < l:best_dist
      let l:best_dist = l:dist
      let l:best = 232 + l:i
    endif
  endfor

  return string(l:best)
endfunction

function! s:cterm_attr(attr) abort
  return substitute(a:attr, "\\<undercurl\\>", "underline", "g")
endfunction

function! s:hi(group, fg, bg, attr) abort
  let l:cmd = "highlight " . a:group
  let l:cmd .= " guifg=" . a:fg . " guibg=" . a:bg . " gui=" . a:attr
  let l:cmd .= " ctermfg=" . s:cterm(a:fg) . " ctermbg=" . s:cterm(a:bg) . " cterm=" . s:cterm_attr(a:attr)
  execute l:cmd
endfunction

function! s:link(group, target) abort
  execute "highlight! link " . a:group . " " . a:target
endfunction

" Core editor
call s:hi("Normal", s:fg, s:bg, "NONE")
call s:hi("NormalFloat", s:fg, s:bg_alt, "NONE")
call s:hi("FloatBorder", s:fg_faint, s:bg_alt, "NONE")
call s:hi("EndOfBuffer", s:bg_strong, s:bg, "NONE")
call s:hi("ColorColumn", s:none, s:bg_soft, "NONE")
call s:hi("Conceal", s:fg_faint, s:none, "NONE")
call s:hi("Cursor", s:bg, s:copper, "NONE")
call s:hi("CursorLine", s:none, s:bg_soft, "NONE")
call s:hi("CursorColumn", s:none, s:bg_soft, "NONE")
call s:hi("LineNr", s:fg_faint, s:bg, "NONE")
call s:hi("CursorLineNr", s:copper_light, s:bg_soft, "bold")
call s:hi("SignColumn", s:fg_faint, s:bg, "NONE")
call s:hi("FoldColumn", s:fg_faint, s:bg, "NONE")
call s:hi("Folded", s:fg_muted, s:bg_alt, "NONE")
call s:hi("VertSplit", s:bg_strong, s:bg, "NONE")
call s:hi("WinSeparator", s:bg_strong, s:bg, "NONE")
call s:hi("StatusLine", s:fg, s:copper_dark, "bold")
call s:hi("StatusLineNC", s:fg_muted, s:bg_alt, "NONE")
call s:hi("TabLine", s:fg_muted, s:bg_alt, "NONE")
call s:hi("TabLineFill", s:fg_muted, s:bg_alt, "NONE")
call s:hi("TabLineSel", s:copper_light, s:bg, "bold")
call s:hi("ToolbarLine", s:fg, s:bg_alt, "NONE")
call s:hi("ToolbarButton", s:copper_light, s:bg_strong, "bold")
call s:hi("Visual", s:none, "#33495a", "NONE")
call s:hi("VisualNOS", s:none, s:bg_strong, "NONE")
call s:hi("Search", s:bg, s:copper, "bold")
call s:hi("IncSearch", s:bg, s:bridge_light, "bold")
call s:hi("CurSearch", s:bg, s:bridge_light, "bold")
call s:hi("Substitute", s:bg, s:bridge, "bold")
call s:hi("MatchParen", s:copper_light, "#3a2b20", "bold")
call s:hi("NonText", s:fg_faint, s:none, "NONE")
call s:hi("SpecialKey", s:fg_faint, s:none, "NONE")
call s:hi("Whitespace", s:bg_strong, s:none, "NONE")
call s:hi("Directory", s:bay_light, s:none, "bold")
call s:hi("Title", s:copper_light, s:none, "bold")
call s:hi("Question", s:copper_light, s:none, "bold")
call s:hi("MoreMsg", s:cypress_light, s:none, "bold")
call s:hi("ModeMsg", s:fg_muted, s:none, "NONE")
call s:hi("WarningMsg", s:warning, s:none, "bold")
call s:hi("ErrorMsg", s:bg, s:bridge, "bold")

" Menus and completion
call s:hi("Pmenu", s:fg, s:bg_alt, "NONE")
call s:hi("PmenuSel", s:fg, "#33495a", "bold")
call s:hi("PmenuSbar", s:none, s:bg_strong, "NONE")
call s:hi("PmenuThumb", s:none, s:fg_faint, "NONE")
call s:hi("WildMenu", s:fg, "#33495a", "bold")

" Syntax
call s:hi("Comment", s:fg_faint, s:none, "italic")
call s:hi("Constant", s:copper_light, s:none, "NONE")
call s:hi("String", s:cypress_light, s:none, "NONE")
call s:hi("Character", s:cypress_light, s:none, "NONE")
call s:hi("Number", s:copper_light, s:none, "NONE")
call s:hi("Boolean", s:copper_light, s:none, "bold")
call s:hi("Float", s:copper_light, s:none, "NONE")
call s:hi("Identifier", s:wood, s:none, "NONE")
call s:hi("Function", s:bay_light, s:none, "bold")
call s:hi("Statement", s:bridge_light, s:none, "bold")
call s:hi("Conditional", s:bridge_light, s:none, "bold")
call s:hi("Repeat", s:bridge_light, s:none, "bold")
call s:hi("Label", s:copper, s:none, "NONE")
call s:hi("Operator", s:fg, s:none, "NONE")
call s:hi("Keyword", s:bridge_light, s:none, "bold")
call s:hi("Exception", s:bridge_light, s:none, "bold")
call s:hi("PreProc", s:copper, s:none, "NONE")
call s:hi("Include", s:bridge_light, s:none, "bold")
call s:hi("Define", s:copper, s:none, "NONE")
call s:hi("Macro", s:copper, s:none, "NONE")
call s:hi("PreCondit", s:copper, s:none, "NONE")
call s:hi("Type", s:cliff, s:none, "bold")
call s:hi("StorageClass", s:copper, s:none, "NONE")
call s:hi("Structure", s:cliff, s:none, "bold")
call s:hi("Typedef", s:cliff, s:none, "NONE")
call s:hi("Special", s:copper, s:none, "NONE")
call s:hi("SpecialChar", s:copper_light, s:none, "bold")
call s:hi("Tag", s:bay_light, s:none, "NONE")
call s:hi("Delimiter", s:fg_muted, s:none, "NONE")
call s:hi("SpecialComment", s:fg_faint, s:none, "italic")
call s:hi("Debug", s:bridge_light, s:none, "NONE")
call s:hi("Underlined", s:bay_light, s:none, "underline")
call s:hi("Ignore", s:fg_faint, s:none, "NONE")
call s:hi("Error", s:bg, s:bridge, "bold")
call s:hi("Todo", s:copper_light, s:bg_soft, "bold")

" Diagnostics and spelling
call s:hi("SpellBad", s:bridge_light, s:none, "undercurl")
call s:hi("SpellCap", s:bay_light, s:none, "undercurl")
call s:hi("SpellLocal", s:cyan, s:none, "undercurl")
call s:hi("SpellRare", s:rust_shadow, s:none, "undercurl")
call s:hi("DiagnosticError", s:bridge_light, s:none, "NONE")
call s:hi("DiagnosticWarn", s:warning, s:none, "NONE")
call s:hi("DiagnosticInfo", s:bay_light, s:none, "NONE")
call s:hi("DiagnosticHint", s:cyan, s:none, "NONE")
call s:hi("DiagnosticOk", s:cypress_light, s:none, "NONE")
call s:hi("DiagnosticUnderlineError", s:bridge_light, s:none, "undercurl")
call s:hi("DiagnosticUnderlineWarn", s:warning, s:none, "undercurl")
call s:hi("DiagnosticUnderlineInfo", s:bay_light, s:none, "undercurl")
call s:hi("DiagnosticUnderlineHint", s:cyan, s:none, "undercurl")

" Diffs
call s:hi("DiffAdd", s:cypress_light, "#1e3324", "NONE")
call s:hi("DiffChange", s:copper_light, "#3a2b20", "NONE")
call s:hi("DiffDelete", s:bridge_light, "#3a201c", "NONE")
call s:hi("DiffText", s:copper_light, "#4a3126", "bold")
call s:hi("Added", s:cypress_light, s:none, "NONE")
call s:hi("Changed", s:copper_light, s:none, "NONE")
call s:hi("Removed", s:bridge_light, s:none, "NONE")

" Vim help, markdown, and common plugins
call s:hi("helpHyperTextJump", s:bay_light, s:none, "underline")
call s:hi("helpCommand", s:copper_light, s:none, "NONE")
call s:hi("markdownHeadingDelimiter", s:copper_light, s:none, "bold")
call s:hi("markdownH1", s:copper_light, s:none, "bold")
call s:hi("markdownH2", s:bridge_light, s:none, "bold")
call s:hi("markdownH3", s:bay_light, s:none, "bold")
call s:hi("markdownCode", s:copper_light, s:bg_soft, "NONE")
call s:hi("markdownCodeBlock", s:copper_light, s:bg_soft, "NONE")
call s:hi("markdownUrl", s:bay_light, s:none, "underline")
call s:hi("GitGutterAdd", s:cypress_light, s:bg, "NONE")
call s:hi("GitGutterChange", s:copper_light, s:bg, "NONE")
call s:hi("GitGutterDelete", s:bridge_light, s:bg, "NONE")
call s:hi("GitSignsAdd", s:cypress_light, s:bg, "NONE")
call s:hi("GitSignsChange", s:copper_light, s:bg, "NONE")
call s:hi("GitSignsDelete", s:bridge_light, s:bg, "NONE")

" Treesitter captures. Vim rejects @ in highlight group names; Neovim uses
" these groups for treesitter syntax.
if has("nvim")
  call s:link("@comment", "Comment")
  call s:link("@constant", "Constant")
  call s:link("@string", "String")
  call s:link("@number", "Number")
  call s:link("@boolean", "Boolean")
  call s:link("@function", "Function")
  call s:link("@function.call", "Function")
  call s:link("@method", "Function")
  call s:link("@method.call", "Function")
  call s:link("@constructor", "Type")
  call s:link("@keyword", "Keyword")
  call s:link("@keyword.function", "Keyword")
  call s:link("@conditional", "Conditional")
  call s:link("@repeat", "Repeat")
  call s:link("@type", "Type")
  call s:link("@variable", "Identifier")
  call s:link("@variable.builtin", "Special")
  call s:link("@property", "Identifier")
  call s:link("@field", "Identifier")
  call s:link("@parameter", "Identifier")
  call s:link("@punctuation", "Delimiter")
  call s:link("@operator", "Operator")
endif

if has("terminal")
  let g:terminal_ansi_colors = [
        \ "#10130f", "#d66a4d", "#8fa866", "#c98243",
        \ "#5ca7c9", "#bf7c66", "#65b8c7", "#eadfca",
        \ "#7d735f", "#ef8667", "#aac276", "#e19a5e",
        \ "#87c4df", "#d99a84", "#8dd6df", "#fff4dc"
        \ ]
endif

" vim: sw=2 ts=2 et
