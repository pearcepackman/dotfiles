local set = vim.api.nvim_set_hl

-- UI
set(0, "Normal",        { fg = "#d3c6aa", bg = "NONE" })
set(0, "LineNr",        { fg = "#475258" })
set(0, "CursorLineNr",  { fg = "#DFA000", bold = true })
set(0, "Visual",        { bg = "#3b4348" })
set(0, "Pmenu",         { bg = "#2a2e32", fg = "#d3c6aa" })
set(0, "PmenuSel",      { bg = "#3A94C5", fg = "#1e2326" })

-- Syntax
set(0, "Comment",       { fg = "#727c7c", italic = true })
set(0, "Constant",      { fg = "#3A94C5" })  -- blue
set(0, "String",        { fg = "#8DA101" })  -- green
set(0, "Function",      { fg = "#DFA000" })  -- yellow
set(0, "Identifier",    { fg = "#F85552" })  -- red
set(0, "Type",          { fg = "#d699b6" })  -- magenta
set(0, "Statement",     { fg = "#e67e80" })  -- bright red
set(0, "PreProc",       { fg = "#83c092" })  -- cyan

