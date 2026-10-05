local P = require("neonforge.palette")
local c, u = P.syntax, P.ui
local M = {}

function M.get(cfg)
  local bg = cfg.transparent and "NONE" or u.bg
  local bg_alt = cfg.transparent and "NONE" or u.bg_alt
  local bg_float = cfg.transparent and "NONE" or u.bg_float
  local ital = cfg.italic_comments

  local g = {
    ---------------------------------------------------------------- UI
    Normal = { fg = u.fg, bg = bg }, NormalNC = { fg = u.fg, bg = bg },
    NormalFloat = { fg = u.fg, bg = bg_float }, FloatBorder = { fg = u.border, bg = bg_float },
    FloatTitle = { fg = u.cursor_line_nr, bg = bg_float, bold = true },
    SignColumn = { bg = bg }, FoldColumn = { fg = u.line_nr, bg = bg }, Folded = { fg = u.fg_dim, bg = u.bg_hl },
    LineNr = { fg = u.line_nr }, CursorLineNr = { fg = u.cursor_line_nr, bold = true },
    CursorLine = { bg = u.bg_hl }, CursorColumn = { bg = u.bg_hl }, ColorColumn = { bg = u.bg_alt },
    Cursor = { fg = u.bg, bg = u.fg }, lCursor = { fg = u.bg, bg = u.fg }, TermCursor = { fg = u.bg, bg = u.fg },
    Visual = { bg = u.bg_visual }, VisualNOS = { bg = u.bg_visual },
    Search = { fg = u.fg, bg = u.bg_search }, IncSearch = { fg = u.bg, bg = u.cursor_line_nr, bold = true },
    CurSearch = { fg = u.bg, bg = u.cursor_line_nr, bold = true }, MatchParen = { bold = true, underline = true, sp = u.cursor_line_nr },
    NonText = { fg = u.border }, EndOfBuffer = { fg = u.bg }, Whitespace = { fg = u.border }, SpecialKey = { fg = u.border },
    Conceal = { fg = u.fg_dim }, Directory = { fg = u.info }, Title = { fg = u.cursor_line_nr, bold = true },
    VertSplit = { fg = u.border }, WinSeparator = { fg = u.border },
    StatusLine = { fg = u.fg, bg = u.bg_alt }, StatusLineNC = { fg = u.fg_dim, bg = u.bg_alt },
    TabLine = { fg = u.fg_dim, bg = u.bg_alt }, TabLineFill = { bg = u.bg_alt }, TabLineSel = { fg = u.fg, bg = u.bg_hl, bold = true },
    WinBar = { fg = u.fg, bg = bg }, WinBarNC = { fg = u.fg_dim, bg = bg },
    Pmenu = { fg = u.fg, bg = u.bg_float }, PmenuSel = { bg = u.bg_visual, bold = true },
    PmenuSbar = { bg = u.bg_hl }, PmenuThumb = { bg = u.line_nr },
    WildMenu = { bg = u.bg_visual }, ModeMsg = { fg = u.hint, bold = true }, MsgArea = { fg = u.fg },
    MoreMsg = { fg = u.hint }, Question = { fg = u.info }, ErrorMsg = { fg = u.error, bold = true }, WarningMsg = { fg = u.warn },
    SpellBad = { sp = u.error, undercurl = true }, SpellCap = { sp = u.warn, undercurl = true },
    SpellLocal = { sp = u.info, undercurl = true }, SpellRare = { sp = u.hint, undercurl = true },

    DiagnosticError = { fg = u.error }, DiagnosticWarn = { fg = u.warn }, DiagnosticInfo = { fg = u.info }, DiagnosticHint = { fg = u.hint },
    DiagnosticOk = { fg = u.git_add },
    DiagnosticUnderlineError = { undercurl = true, sp = u.error }, DiagnosticUnderlineWarn = { undercurl = true, sp = u.warn },
    DiagnosticUnderlineInfo = { undercurl = true, sp = u.info }, DiagnosticUnderlineHint = { undercurl = true, sp = u.hint },
    DiagnosticVirtualTextError = { fg = u.error, bg = u.bg_alt }, DiagnosticVirtualTextWarn = { fg = u.warn, bg = u.bg_alt },
    DiagnosticVirtualTextInfo = { fg = u.info, bg = u.bg_alt }, DiagnosticVirtualTextHint = { fg = u.hint, bg = u.bg_alt },
    DiagnosticUnnecessary = { fg = u.fg_dim },
    LspReferenceText = { bg = u.sel }, LspReferenceRead = { bg = u.sel }, LspReferenceWrite = { bg = u.sel, underline = true },
    LspInlayHint = { fg = u.fg_dim, bg = u.bg_alt, italic = true },

    DiffAdd = { bg = "#0f2a1a" }, DiffChange = { bg = "#101e33" }, DiffDelete = { bg = "#33101c" }, DiffText = { bg = "#1b3560" },
    Added = { fg = u.git_add }, Changed = { fg = u.git_change }, Removed = { fg = u.git_delete },
    GitSignsAdd = { fg = u.git_add }, GitSignsChange = { fg = u.git_change }, GitSignsDelete = { fg = u.git_delete },

    TelescopeNormal = { fg = u.fg, bg = bg_float }, TelescopeBorder = { fg = u.border, bg = bg_float },
    TelescopeSelection = { bg = u.bg_visual }, TelescopeMatching = { fg = u.cursor_line_nr, bold = true },
    TelescopePromptPrefix = { fg = u.cursor_line_nr },

    ------------------------------------------------- legacy Vim syntax (fallback when treesitter is off)
    Comment = { fg = c.comment, italic = ital }, Constant = { fg = c.const }, String = { fg = c.string },
    Character = { fg = c.char }, Number = { fg = c.number }, Boolean = { fg = c.bool }, Float = { fg = c.float },
    Identifier = { fg = c.variable }, Function = { fg = c.function_call },
    Statement = { fg = c.keyword }, Conditional = { fg = c.kw_conditional }, Repeat = { fg = c.kw_repeat },
    Label = { fg = c.label }, Operator = { fg = c.operator }, Keyword = { fg = c.keyword },
    Exception = { fg = c.kw_exception }, PreProc = { fg = c.directive }, Include = { fg = c.kw_import },
    Define = { fg = c.directive_define }, Macro = { fg = c.macro }, PreCondit = { fg = c.directive },
    Type = { fg = c.type }, StorageClass = { fg = c.kw_modifier }, Structure = { fg = c.struct },
    Typedef = { fg = c.type_def }, Special = { fg = c.string_format }, SpecialChar = { fg = c.string_escape },
    Tag = { fg = c.class }, Delimiter = { fg = c.punct_delim }, SpecialComment = { fg = c.comment_doc },
    Debug = { fg = c.kw_exception }, Underlined = { underline = true }, Error = { fg = u.error }, Todo = { fg = u.bg, bg = c.number, bold = true },

    ------------------------------------------------- Treesitter (C / C++ / Rust all share these)
    ["@comment"] = { fg = c.comment, italic = ital },
    ["@comment.documentation"] = { fg = c.comment_doc, italic = ital },
    ["@comment.todo"] = { fg = u.bg, bg = c.number, bold = true },
    ["@comment.note"] = { fg = u.bg, bg = c.type_builtin, bold = true },
    ["@comment.warning"] = { fg = u.bg, bg = c.string_format, bold = true },
    ["@comment.error"] = { fg = u.bg, bg = c.kw_exception, bold = true },

    ["@string"] = { fg = c.string },
    ["@string.escape"] = { fg = c.string_escape, bold = true },
    ["@string.special"] = { fg = c.string_format },
    ["@string.special.path"] = { fg = c.string_path },
    ["@string.special.symbol"] = { fg = c.string_format },
    ["@character"] = { fg = c.char },
    ["@character.special"] = { fg = c.string_escape },
    ["@number"] = { fg = c.number },
    ["@number.float"] = { fg = c.float },
    ["@boolean"] = { fg = c.bool, bold = true },

    ["@constant"] = { fg = c.const },
    ["@constant.builtin"] = { fg = c.const_builtin, bold = true },    -- NULL nullptr None
    ["@constant.macro"] = { fg = c.macro_const },                     -- #define FOO

    ["@variable"] = { fg = c.variable },
    ["@variable.builtin"] = { fg = c.variable_builtin, italic = true }, -- this / self
    ["@variable.parameter"] = { fg = c.parameter },
    ["@variable.member"] = { fg = c.field },
    ["@property"] = { fg = c.field },
    ["@module"] = { fg = c.module },
    ["@module.builtin"] = { fg = c.module },
    ["@label"] = { fg = c.label },

    ["@keyword"] = { fg = c.keyword },
    ["@keyword.function"] = { fg = c.kw_function },
    ["@keyword.return"] = { fg = c.kw_return, bold = true },
    ["@keyword.conditional"] = { fg = c.kw_conditional },
    ["@keyword.conditional.ternary"] = { fg = c.kw_conditional },
    ["@keyword.repeat"] = { fg = c.kw_repeat },
    ["@keyword.exception"] = { fg = c.kw_exception },
    ["@keyword.import"] = { fg = c.kw_import },
    ["@keyword.modifier"] = { fg = c.kw_modifier },     -- static const mut pub extern virtual
    ["@keyword.operator"] = { fg = c.kw_operator },     -- sizeof new delete as
    ["@keyword.type"] = { fg = c.kw_type },             -- struct enum class impl trait
    ["@keyword.coroutine"] = { fg = c.kw_coroutine },   -- async await co_await
    ["@keyword.directive"] = { fg = c.directive },      -- #include #if #ifdef
    ["@keyword.directive.define"] = { fg = c.directive_define }, -- #define
    ["@keyword.storage"] = { fg = c.kw_modifier },
    ["@keyword.debug"] = { fg = c.kw_exception },

    ["@type"] = { fg = c.type },
    ["@type.builtin"] = { fg = c.type_builtin },
    ["@type.definition"] = { fg = c.type_def },
    ["@type.qualifier"] = { fg = c.kw_modifier },
    ["@attribute"] = { fg = c.attribute },
    ["@attribute.builtin"] = { fg = c.attribute_builtin },

    ["@function"] = { fg = c.func, bold = true },
    ["@function.call"] = { fg = c.function_call },
    ["@function.builtin"] = { fg = c.function_builtin },
    ["@function.method"] = { fg = c.method, bold = true },
    ["@function.method.call"] = { fg = c.method_call },
    ["@function.macro"] = { fg = c.macro },
    ["@constructor"] = { fg = c.constructor },

    ["@operator"] = { fg = c.operator },
    ["@punctuation.delimiter"] = { fg = c.punct_delim },
    ["@punctuation.bracket"] = { fg = c.punct_bracket },
    ["@punctuation.special"] = { fg = c.punct_special },

    ------------------------------------------------- LSP semantic tokens
    -- Roles that treesitter already colours better are cleared so treesitter shows through.
    ["@lsp.type.keyword"] = {}, ["@lsp.type.comment"] = {}, ["@lsp.type.string"] = {},
    ["@lsp.type.number"] = {}, ["@lsp.type.operator"] = {}, ["@lsp.type.modifier"] = {},
    ["@lsp.type.bracket"] = {}, ["@lsp.type.angle"] = {}, ["@lsp.type.brace"] = {},
    ["@lsp.type.parenthesis"] = {}, ["@lsp.type.punctuation"] = {}, ["@lsp.type.semicolon"] = {},
    ["@lsp.type.comma"] = {}, ["@lsp.type.colon"] = {}, ["@lsp.type.dot"] = {},
    ["@lsp.type.arithmetic"] = {}, ["@lsp.type.logical"] = {}, ["@lsp.type.bitwise"] = {},
    ["@lsp.type.comparison"] = {}, ["@lsp.type.escapeSequence"] = {}, ["@lsp.type.unknown"] = {},
    ["@lsp.type.boolean"] = { fg = c.bool, bold = true },
    ["@lsp.type.formatSpecifier"] = { fg = c.string_format },
    ["@lsp.type.unresolvedReference"] = { undercurl = true, sp = u.error },

    ["@lsp.type.namespace"] = { fg = c.module },
    ["@lsp.type.class"] = { fg = c.class },
    ["@lsp.type.struct"] = { fg = c.struct },
    ["@lsp.type.enum"] = { fg = c.enum },
    ["@lsp.type.enumMember"] = { fg = c.enum_member },
    ["@lsp.type.union"] = { fg = c.union },
    ["@lsp.type.interface"] = { fg = c.trait },        -- Rust traits
    ["@lsp.type.typeParameter"] = { fg = c.type_param },
    ["@lsp.type.generic"] = { fg = c.type_param },
    ["@lsp.type.type"] = { fg = c.type },
    ["@lsp.type.typeAlias"] = { fg = c.type_def },
    ["@lsp.type.builtinType"] = { fg = c.type_builtin },
    ["@lsp.type.concept"] = { fg = c.concept },
    ["@lsp.type.selfTypeKeyword"] = { fg = c.type_self, italic = true },
    ["@lsp.type.selfKeyword"] = { fg = c.variable_builtin, italic = true },
    ["@lsp.type.macro"] = { fg = c.macro },
    ["@lsp.type.decorator"] = { fg = c.attribute },
    ["@lsp.type.builtinAttribute"] = { fg = c.attribute_builtin },
    ["@lsp.type.deriveHelper"] = { fg = c.attribute_builtin },
    ["@lsp.type.derive"] = { fg = c.attribute_builtin },
    ["@lsp.type.attributeBracket"] = { fg = c.punct_special },
    ["@lsp.type.lifetime"] = { fg = c.lifetime, italic = true },
    ["@lsp.type.label"] = { fg = c.label },
    ["@lsp.type.function"] = { fg = c.function_call },
    ["@lsp.type.method"] = { fg = c.method_call },
    ["@lsp.type.variable"] = { fg = c.variable },
    ["@lsp.type.parameter"] = { fg = c.parameter },
    ["@lsp.type.property"] = { fg = c.field },

    -- declarations / definitions get the "definition" colours + bold
    ["@lsp.typemod.function.declaration"] = { fg = c.func, bold = true },
    ["@lsp.typemod.function.definition"] = { fg = c.func, bold = true },
    ["@lsp.typemod.method.declaration"] = { fg = c.method, bold = true },
    ["@lsp.typemod.method.definition"] = { fg = c.method, bold = true },
    ["@lsp.typemod.function.constructorOrDestructor"] = { fg = c.constructor, bold = true },
    ["@lsp.typemod.method.constructorOrDestructor"] = { fg = c.constructor, bold = true },
    ["@lsp.typemod.function.defaultLibrary"] = { fg = c.function_builtin },
    ["@lsp.typemod.method.defaultLibrary"] = { fg = c.function_builtin },
    ["@lsp.typemod.class.defaultLibrary"] = { fg = c.type_builtin },
    ["@lsp.typemod.struct.defaultLibrary"] = { fg = c.type_builtin },
    ["@lsp.typemod.enum.defaultLibrary"] = { fg = c.type_builtin },
    ["@lsp.typemod.macro.defaultLibrary"] = { fg = c.macro },

    -- globals / statics / constants
    ["@lsp.typemod.variable.globalScope"] = { fg = c.var_global },
    ["@lsp.typemod.variable.fileScope"] = { fg = c.var_global },
    ["@lsp.typemod.variable.static"] = { fg = c.var_global },
    ["@lsp.typemod.variable.constant"] = { fg = c.const },
    ["@lsp.typemod.variable.readonly"] = { fg = c.const },
    ["@lsp.typemod.property.readonly"] = { fg = c.field, italic = true },

    -- style-only modifiers (no extra colours -> no collisions)
    ["@lsp.mod.mutable"] = { underline = true },                 -- Rust `mut`
    ["@lsp.mod.usedAsMutableReference"] = { underline = true },  -- C++ non-const &
    ["@lsp.mod.usedAsMutablePointer"] = { underline = true },
    ["@lsp.mod.unsafe"] = { undercurl = true, sp = u.warn },     -- Rust unsafe ops
    ["@lsp.mod.deprecated"] = { strikethrough = true },
    ["@lsp.mod.virtual"] = { italic = true }, ["@lsp.mod.abstract"] = { italic = true },
    ["@lsp.mod.async"] = { italic = true },

    ------------------------------------------------- rainbow-delimiters.nvim
    RainbowDelimiterRed = { fg = c.rb_red }, RainbowDelimiterYellow = { fg = c.rb_yellow },
    RainbowDelimiterBlue = { fg = c.rb_blue }, RainbowDelimiterOrange = { fg = c.rb_orange },
    RainbowDelimiterGreen = { fg = c.rb_green }, RainbowDelimiterViolet = { fg = c.rb_violet },
    RainbowDelimiterCyan = { fg = c.rb_cyan },
  }
  return g
end

return M
