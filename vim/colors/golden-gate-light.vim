" golden-gate-light.vim - Warm light Vim theme inspired by the Golden Gate
" Maintainer: Sam Rawal
" License: MIT

set background=light

if exists("+termguicolors")
  set termguicolors
endif

highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "golden-gate-light"

let s:bg = "#f7f1e6"
let s:bg_alt = "#eae0cf"
let s:bg_soft = "#f2eadc"
let s:bg_strong = "#d6ccb6"
let s:fg = "#2b2f29"
let s:fg_muted = "#625c4f"
let s:fg_faint = "#8a7e6d"
let s:bridge = "#a84732"
let s:bridge_light = "#c95d45"
let s:bay = "#1e668e"
let s:bay_light = "#cfe1ee"
let s:bay_soft = "#dcecf5"
let s:cypress = "#4f6d2f"
let s:cypress_light = "#6f8a40"
let s:earth = "#7d5412"
let s:cliff = "#7a5b2e"
let s:wood = "#4f463c"
let s:rust_shadow = "#7b4b3e"
let s:cyan = "#2b7a8e"
let s:warning = "#9a6a12"
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
call s:hi("Cursor", s:bg, s:bridge, "NONE")
call s:hi("CursorLine", s:none, s:bg_soft, "NONE")
call s:hi("CursorColumn", s:none, s:bg_soft, "NONE")
call s:hi("LineNr", s:fg_faint, s:bg, "NONE")
call s:hi("CursorLineNr", s:fg, s:bg_soft, "bold")
call s:hi("SignColumn", s:fg_faint, s:bg, "NONE")
call s:hi("FoldColumn", s:fg_faint, s:bg, "NONE")
call s:hi("Folded", s:fg_muted, s:bg_alt, "NONE")
call s:hi("VertSplit", s:bg_strong, s:bg, "NONE")
call s:hi("WinSeparator", s:bg_strong, s:bg, "NONE")
call s:hi("StatusLine", s:fg, s:bg_strong, "bold")
call s:hi("StatusLineNC", s:fg_muted, s:bg_alt, "NONE")
call s:hi("TabLine", s:fg_muted, s:bg_alt, "NONE")
call s:hi("TabLineFill", s:fg_muted, s:bg_alt, "NONE")
call s:hi("TabLineSel", s:bay, s:bg, "bold")
call s:hi("ToolbarLine", s:fg, s:bg_alt, "NONE")
call s:hi("ToolbarButton", s:bay, s:bg_strong, "bold")
call s:hi("Visual", s:none, s:bay_light, "NONE")
call s:hi("VisualNOS", s:none, s:bg_strong, "NONE")
call s:hi("Search", s:fg, "#e6d7b3", "bold")
call s:hi("IncSearch", s:bg, s:bridge, "bold")
call s:hi("CurSearch", s:bg, s:bridge, "bold")
call s:hi("Substitute", s:bg, s:bridge_light, "bold")
call s:hi("MatchParen", s:fg, s:bay_light, "bold")
call s:hi("NonText", s:fg_faint, s:none, "NONE")
call s:hi("SpecialKey", s:fg_faint, s:none, "NONE")
call s:hi("Whitespace", s:bg_strong, s:none, "NONE")
call s:hi("Directory", s:bay, s:none, "bold")
call s:hi("Title", s:bridge, s:none, "bold")
call s:hi("Question", s:bay, s:none, "bold")
call s:hi("MoreMsg", s:cypress, s:none, "bold")
call s:hi("ModeMsg", s:fg_muted, s:none, "NONE")
call s:hi("WarningMsg", s:warning, s:none, "bold")
call s:hi("ErrorMsg", s:bg, s:bridge, "bold")

" Menus and completion
call s:hi("Pmenu", s:fg, s:bg_alt, "NONE")
call s:hi("PmenuSel", s:fg, s:bay_light, "bold")
call s:hi("PmenuSbar", s:none, s:bg_strong, "NONE")
call s:hi("PmenuThumb", s:none, s:fg_faint, "NONE")
call s:hi("WildMenu", s:fg, s:bay_light, "bold")

" Syntax
call s:hi("Comment", s:fg_muted, s:none, "italic")
call s:hi("Constant", s:rust_shadow, s:none, "NONE")
call s:hi("String", s:cypress, s:none, "NONE")
call s:hi("Character", s:cypress, s:none, "NONE")
call s:hi("Number", s:rust_shadow, s:none, "NONE")
call s:hi("Boolean", s:rust_shadow, s:none, "bold")
call s:hi("Float", s:rust_shadow, s:none, "NONE")
call s:hi("Identifier", s:wood, s:none, "NONE")
call s:hi("Function", s:bay, s:none, "bold")
call s:hi("Statement", s:bridge, s:none, "bold")
call s:hi("Conditional", s:bridge, s:none, "bold")
call s:hi("Repeat", s:bridge, s:none, "bold")
call s:hi("Label", s:earth, s:none, "NONE")
call s:hi("Operator", s:fg, s:none, "NONE")
call s:hi("Keyword", s:bridge, s:none, "bold")
call s:hi("Exception", s:bridge, s:none, "bold")
call s:hi("PreProc", s:cliff, s:none, "NONE")
call s:hi("Include", s:bridge, s:none, "bold")
call s:hi("Define", s:cliff, s:none, "NONE")
call s:hi("Macro", s:cliff, s:none, "NONE")
call s:hi("PreCondit", s:cliff, s:none, "NONE")
call s:hi("Type", s:cliff, s:none, "bold")
call s:hi("StorageClass", s:earth, s:none, "NONE")
call s:hi("Structure", s:cliff, s:none, "bold")
call s:hi("Typedef", s:cliff, s:none, "NONE")
call s:hi("Special", s:earth, s:none, "NONE")
call s:hi("SpecialChar", s:earth, s:none, "bold")
call s:hi("Tag", s:bay, s:none, "NONE")
call s:hi("Delimiter", s:fg_muted, s:none, "NONE")
call s:hi("SpecialComment", s:fg_muted, s:none, "italic")
call s:hi("Debug", s:bridge, s:none, "NONE")
call s:hi("Underlined", s:bay, s:none, "underline")
call s:hi("Ignore", s:fg_faint, s:none, "NONE")
call s:hi("Error", s:bg, s:bridge, "bold")
call s:hi("Todo", s:bridge, s:bg_alt, "bold")

" Diagnostics and spelling
call s:hi("SpellBad", s:bridge, s:none, "undercurl")
call s:hi("SpellCap", s:bay, s:none, "undercurl")
call s:hi("SpellLocal", s:cyan, s:none, "undercurl")
call s:hi("SpellRare", s:rust_shadow, s:none, "undercurl")
call s:hi("DiagnosticError", s:bridge, s:none, "NONE")
call s:hi("DiagnosticWarn", s:warning, s:none, "NONE")
call s:hi("DiagnosticInfo", s:bay, s:none, "NONE")
call s:hi("DiagnosticHint", s:cyan, s:none, "NONE")
call s:hi("DiagnosticOk", s:cypress, s:none, "NONE")
call s:hi("DiagnosticUnderlineError", s:bridge, s:none, "undercurl")
call s:hi("DiagnosticUnderlineWarn", s:warning, s:none, "undercurl")
call s:hi("DiagnosticUnderlineInfo", s:bay, s:none, "undercurl")
call s:hi("DiagnosticUnderlineHint", s:cyan, s:none, "undercurl")

" Diffs
call s:hi("DiffAdd", s:cypress, "#e2ebd0", "NONE")
call s:hi("DiffChange", s:earth, "#eadfbe", "NONE")
call s:hi("DiffDelete", s:bridge, "#f0d8cf", "NONE")
call s:hi("DiffText", s:earth, "#dfcfa0", "bold")
call s:hi("Added", s:cypress, s:none, "NONE")
call s:hi("Changed", s:earth, s:none, "NONE")
call s:hi("Removed", s:bridge, s:none, "NONE")

" Vim help, markdown, and common plugins
call s:hi("helpHyperTextJump", s:bay, s:none, "underline")
call s:hi("helpCommand", s:rust_shadow, s:none, "NONE")
call s:hi("markdownHeadingDelimiter", s:bridge, s:none, "bold")
call s:hi("markdownH1", s:bridge, s:none, "bold")
call s:hi("markdownH2", s:bay, s:none, "bold")
call s:hi("markdownH3", s:cypress, s:none, "bold")
call s:hi("markdownCode", s:rust_shadow, s:bg_soft, "NONE")
call s:hi("markdownCodeBlock", s:rust_shadow, s:bg_soft, "NONE")
call s:hi("markdownUrl", s:bay, s:none, "underline")
call s:hi("GitGutterAdd", s:cypress, s:bg, "NONE")
call s:hi("GitGutterChange", s:earth, s:bg, "NONE")
call s:hi("GitGutterDelete", s:bridge, s:bg, "NONE")
call s:hi("GitSignsAdd", s:cypress, s:bg, "NONE")
call s:hi("GitSignsChange", s:earth, s:bg, "NONE")
call s:hi("GitSignsDelete", s:bridge, s:bg, "NONE")

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
        \ "#2b2f29", "#a84732", "#4f6d2f", "#7d5412",
        \ "#1e668e", "#7b4b3e", "#2b7a8e", "#eae0cf",
        \ "#625c4f", "#c95d45", "#6f8a40", "#9a6a12",
        \ "#2f86b7", "#9a6253", "#4c98aa", "#fffaf0"
        \ ]
endif

" vim: sw=2 ts=2 et
