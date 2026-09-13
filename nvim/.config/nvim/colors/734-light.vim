set background=light
hi clear
if exists('syntax_on') | syntax reset | endif
let g:colors_name = '734-light'
highlight SpecialKey guifg=#77767b
highlight EndOfBuffer guifg=#77767b
highlight TermCursor cterm=reverse gui=reverse
highlight NonText guifg=#77767b
highlight Directory ctermfg=14 guifg=#1c71d8
highlight ErrorMsg ctermfg=9 guifg=#c01c28 guibg=#fcfcfc
highlight IncSearch guifg=#241f31 guibg=#ffbe6f
highlight Search ctermfg=0 ctermbg=11 guifg=#241f31 guibg=#f8e45c
highlight CurSearch ctermfg=0 ctermbg=11 guifg=#241f31 guibg=#ffbe6f
highlight MoreMsg ctermfg=14 guifg=#26a269
highlight ModeMsg ctermfg=10 guifg=#26a269
highlight LineNr guifg=#5e5c64
highlight LineNrAbove guifg=#77767b
highlight LineNrBelow guifg=#77767b
highlight CursorLineNr cterm=bold guifg=#5e5c64 guibg=#f2f2f2
highlight CursorLineSign guifg=#77767b guibg=#f2f2f2
highlight CursorLineFold guifg=#2190a4 guibg=#f2f2f2
highlight Question ctermfg=14 guifg=#1c71d8
highlight StatusLine cterm=NONE gui=NONE ctermfg=15 ctermbg=0 guifg=#fcfcfc guibg=#000000
highlight StatusLineNC cterm=NONE gui=NONE ctermfg=7 ctermbg=0 guifg=#8b8b8b guibg=#000000
highlight WinSeparator guifg=#dedede guibg=#dedede
highlight VertSplit guifg=#dedede guibg=#dedede
highlight Title cterm=bold guifg=#1a5fb4
highlight Visual cterm=NONE gui=NONE ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000 blend=0

highlight WarningMsg ctermfg=11 guifg=#c01c28
highlight WildMenu guifg=#ed333b guibg=#f8e45c
highlight Folded guifg=#77767b guibg=#f2f2f2
highlight FoldColumn guifg=#2190a4
highlight DiffAdd ctermfg=0 ctermbg=10 guifg=#26a269 guibg=#f2f2f2
highlight DiffChange guifg=#9141ac guibg=#f2f2f2
highlight DiffDelete cterm=bold ctermfg=9 guifg=#c01c28 guibg=#f2f2f2
highlight DiffText ctermfg=0 ctermbg=14 guifg=#1c71d8 guibg=#f2f2f2
highlight! link DiffTextAdd DiffText
highlight SignColumn guifg=#77767b
highlight Conceal guifg=#1c71d8
highlight SpellBad cterm=undercurl gui=undercurl guisp=#c01c28
highlight SpellCap cterm=undercurl gui=undercurl guisp=#1c71d8
highlight SpellRare cterm=undercurl gui=undercurl guisp=#9141ac
highlight SpellLocal cterm=undercurl gui=undercurl guisp=#2190a4
highlight Pmenu cterm=reverse guifg=#241f31 guibg=#f2f2f2
highlight PmenuSel cterm=underline,reverse gui=reverse guifg=#241f31 guibg=#f2f2f2
highlight PmenuMatch cterm=bold gui=bold guifg=#241f31 guibg=#f2f2f2
highlight PmenuMatchSel cterm=bold gui=bold,reverse guifg=#241f31 guibg=#f2f2f2
highlight PmenuKind guifg=#241f31 guibg=#f2f2f2
highlight PmenuKindSel gui=reverse guifg=#241f31 guibg=#f2f2f2
highlight PmenuExtra guifg=#241f31 guibg=#f2f2f2
highlight PmenuExtraSel gui=reverse guifg=#241f31 guibg=#f2f2f2
highlight PmenuSbar guibg=#ececec
highlight PmenuThumb guibg=#241f31
highlight TabLine guifg=#77767b
highlight TabLineSel guifg=#26a269
highlight TabLineFill guifg=#77767b

highlight CursorLine guibg=#f2f2f2
highlight ColorColumn guibg=#f7f7f7
highlight QuickFixLine ctermfg=14 guibg=#f2f2f2
highlight Whitespace guifg=#77767b
highlight NormalNC guifg=#241f31 guibg=#fcfcfc
highlight MsgSeparator guifg=#fcfcfc guibg=#000000
highlight NormalFloat guifg=#241f31 guibg=#f2f2f2
highlight MsgArea guifg=#241f31 guibg=#fcfcfc
highlight! link FloatBorder NormalFloat
highlight WinBar cterm=bold guifg=#5e5c64 guibg=#ececec
highlight WinBarNC cterm=bold guifg=#77767b guibg=#f2f2f2
highlight Cursor guifg=#14171c guibg=#ff6900
highlight! link FloatTitle Title
highlight! link FloatFooter FloatTitle
highlight! link StatusLineTerm StatusLine
highlight! link StatusLineTermNC StatusLineNC
highlight! link StderrMsg ErrorMsg

highlight RedrawDebugNormal cterm=reverse gui=reverse
highlight Underlined cterm=underline gui=underline
highlight lCursor guifg=#14171c guibg=#ff6900
highlight CursorIM guifg=#14171c guibg=#ff6900

highlight Substitute guifg=#241f31 guibg=#f8e45c
highlight VisualNOS cterm=NONE gui=NONE ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000 blend=0
highlight Normal guifg=#241f31 guibg=#fcfcfc
highlight Character guifg=#c01c28
highlight Constant guifg=#c64600
highlight Number guifg=#c64600 guibg=#fcfcfc
highlight Boolean guifg=#c64600
highlight Float guifg=#c64600
highlight Conditional guifg=#9141ac
highlight Statement cterm=bold guifg=#c01c28
highlight Repeat guifg=#9141ac
highlight Label guifg=#9141ac
highlight Keyword guifg=#9141ac
highlight Exception guifg=#c01c28
highlight Include guifg=#1c71d8
highlight PreProc guifg=#613583
highlight Define guifg=#613583
highlight Macro guifg=#c01c28
highlight PreCondit guifg=#613583
highlight StorageClass guifg=#986a44
highlight Type guifg=#986a44
highlight Structure guifg=#9141ac
highlight Typedef guifg=#986a44
highlight Tag guifg=#9141ac
highlight Special ctermfg=14 guifg=#2190a4
highlight SpecialChar guifg=#986a44
highlight SpecialComment guifg=#2190a4
highlight Debug guifg=#c01c28
highlight Ignore guifg=#2190a4
highlight! link LspCodeLens Comment
highlight! link LspCodeLensSeparator Comment
highlight! link LspInlayHint NonText
highlight! link LspReferenceRead LspReferenceText
highlight LspReferenceText guibg=#ececec
highlight! link LspReferenceWrite LspReferenceText
highlight! link LspReferenceTarget LspReferenceText
highlight! link LspSignatureActiveParameter LspReferenceText
highlight! link SnippetTabstop Visual
highlight DiagnosticFloatingError guifg=#c01c28
highlight DiagnosticError ctermfg=9 guifg=#c01c28
highlight DiagnosticFloatingWarn guifg=#9141ac
highlight DiagnosticWarn ctermfg=11 guifg=#9141ac
highlight DiagnosticFloatingInfo guifg=#2190a4
highlight DiagnosticInfo ctermfg=14 guifg=#2190a4
highlight DiagnosticFloatingHint guifg=#1c71d8
highlight DiagnosticHint ctermfg=12 guifg=#1c71d8
highlight DiagnosticFloatingOk guifg=#26a269
highlight DiagnosticOk ctermfg=10 guifg=#26a269
highlight! link DiagnosticVirtualTextError DiagnosticError
highlight! link DiagnosticVirtualTextWarn DiagnosticWarn
highlight! link DiagnosticVirtualTextInfo DiagnosticInfo
highlight! link DiagnosticVirtualTextHint DiagnosticHint
highlight! link DiagnosticVirtualTextOk DiagnosticOk
highlight! link DiagnosticVirtualLinesError DiagnosticError
highlight! link DiagnosticVirtualLinesWarn DiagnosticWarn
highlight! link DiagnosticVirtualLinesInfo DiagnosticInfo
highlight! link DiagnosticVirtualLinesHint DiagnosticHint
highlight! link DiagnosticVirtualLinesOk DiagnosticOk
highlight! link DiagnosticSignError DiagnosticFloatingError
highlight! link DiagnosticSignWarn DiagnosticFloatingWarn
highlight! link DiagnosticSignInfo DiagnosticFloatingInfo
highlight! link DiagnosticSignHint DiagnosticFloatingHint
highlight! link DiagnosticSignOk DiagnosticFloatingOk
highlight! link DiagnosticUnnecessary Comment
highlight Comment guifg=#77767b
highlight @variable guifg=#241f31
highlight! link @variable.builtin Special
highlight! link @variable.parameter.builtin Special
highlight! link @constant Constant
highlight! link @constant.builtin Special
highlight! link @module Structure
highlight! link @module.builtin Special
highlight! link @label Label
highlight! link @string String
highlight String ctermfg=10 guifg=#26a269
highlight! link @string.regexp @string.special
highlight! link @string.special SpecialChar
highlight! link @string.escape @string.special
highlight! link @string.special.url Underlined
highlight! link @character Character
highlight! link @character.special SpecialChar
highlight! link @boolean Boolean
highlight! link @number Number
highlight! link @number.float Float
highlight! link @type Type
highlight! link @type.builtin Special
highlight! link @attribute Macro
highlight! link @attribute.builtin Special
highlight! link @property Identifier
highlight Identifier ctermfg=12 guifg=#1c71d8
highlight! link @function Function
highlight Function ctermfg=14 guifg=#1c71d8
highlight! link @function.builtin Special
highlight! link @constructor Special
highlight! link @operator Operator
highlight Operator guifg=#241f31
highlight! link @keyword Keyword
highlight! link @punctuation Delimiter
highlight Delimiter guifg=#5e5c64
highlight! link @punctuation.special Special
highlight! link @comment Comment
highlight! link @comment.error DiagnosticError
highlight! link @comment.warning DiagnosticWarn
highlight! link @comment.note DiagnosticInfo
highlight! link @comment.todo Todo
highlight Todo cterm=bold guifg=#c88800 guibg=#f2f2f2
highlight! link @markup Special
highlight @markup.strong cterm=bold gui=bold
highlight! link links @text.strong
highlight @markup.italic cterm=italic gui=italic
highlight! link links @text.emphasis
highlight @markup.strikethrough cterm=strikethrough gui=strikethrough
highlight! link links @text.strike
highlight @markup.underline cterm=underline gui=underline
highlight! link links @text.underline
highlight! link @markup.heading Title
highlight! link @markup.link Underlined

highlight! link @diff.plus Added
highlight Added ctermfg=10 guifg=#26a269
highlight! link @diff.minus Removed
highlight Removed ctermfg=9 guifg=#c01c28
highlight! link @diff.delta Changed
highlight Changed ctermfg=14 guifg=#9141ac
highlight! link @tag Tag
highlight! link @tag.builtin Special
highlight! link @markup.heading.1 markdownH1
highlight @markup.heading.1.delimiter.vimdoc cterm=underdouble,nocombine gui=underdouble,nocombine guifg=bg guibg=bg guisp=fg
highlight! link @markup.heading.2 markdownH2
highlight @markup.heading.2.delimiter.vimdoc cterm=underline,nocombine gui=underline,nocombine guifg=bg guibg=bg guisp=fg

highlight! link @lsp.type.class @type
highlight! link @lsp.type.comment @comment
highlight! link @lsp.type.decorator @attribute
highlight! link @lsp.type.enum @type
highlight! link @lsp.type.enumMember @constant
highlight! link @lsp.type.event @type
highlight! link @lsp.type.function @function
highlight! link @lsp.type.interface @type
highlight! link @lsp.type.keyword @keyword
highlight! link @lsp.type.macro @constant.macro
highlight! link @lsp.type.method @function.method
highlight! link @lsp.type.modifier @type.qualifier
highlight! link @lsp.type.namespace @module
highlight! link @lsp.type.number @number
highlight! link @lsp.type.operator @operator
highlight! link @lsp.type.parameter @variable.parameter
highlight! link @lsp.type.property @property
highlight! link @lsp.type.regexp @string.regexp
highlight! link @lsp.type.string @string
highlight! link @lsp.type.struct @type
highlight! link @lsp.type.type @type
highlight! link @lsp.type.typeParameter @type.definition
highlight @lsp.type.variable guifg=#241f31
highlight @lsp.mod.deprecated guifg=#c01c28
highlight DiagnosticDeprecated cterm=strikethrough gui=strikethrough guisp=NvimLightRed
highlight FloatShadow ctermbg=0 guibg=NvimDarkGrey4 blend=80
highlight FloatShadowThrough ctermbg=0 guibg=NvimDarkGrey4 blend=100
highlight MatchParen cterm=bold,underline guibg=#ececec
highlight RedrawDebugClear ctermfg=0 ctermbg=11 guibg=NvimDarkYellow
highlight RedrawDebugComposed ctermfg=0 ctermbg=10 guibg=NvimDarkGreen
highlight RedrawDebugRecompose ctermfg=0 ctermbg=9 guibg=NvimDarkRed
highlight Error ctermfg=0 ctermbg=9 guifg=#ffffff guibg=#ed333b
highlight DiagnosticUnderlineError cterm=underline gui=underline guisp=#c01c28
highlight DiagnosticUnderlineWarn cterm=underline gui=underline guisp=#9141ac
highlight DiagnosticUnderlineInfo cterm=underline gui=underline guisp=#2190a4
highlight DiagnosticUnderlineHint cterm=underline gui=underline guisp=#1c71d8
highlight DiagnosticUnderlineOk cterm=underline gui=underline guisp=#26a269
highlight NvimInternalError ctermfg=9 ctermbg=9 guifg=Red guibg=Red

highlight! link NvimAssignment Operator
highlight! link NvimPlainAssignment NvimAssignment
highlight! link NvimAugmentedAssignment NvimAssignment
highlight! link NvimAssignmentWithAddition NvimAugmentedAssignment
highlight! link NvimAssignmentWithSubtraction NvimAugmentedAssignment
highlight! link NvimAssignmentWithConcatenation NvimAugmentedAssignment
highlight! link NvimOperator Operator
highlight! link NvimUnaryOperator NvimOperator
highlight! link NvimUnaryPlus NvimUnaryOperator
highlight! link NvimUnaryMinus NvimUnaryOperator
highlight! link NvimNot NvimUnaryOperator
highlight! link NvimBinaryOperator NvimOperator
highlight! link NvimComparison NvimBinaryOperator
highlight! link NvimComparisonModifier NvimComparison
highlight! link NvimBinaryPlus NvimBinaryOperator
highlight! link NvimBinaryMinus NvimBinaryOperator
highlight! link NvimConcat NvimBinaryOperator
highlight! link NvimConcatOrSubscript NvimConcat
highlight! link NvimOr NvimBinaryOperator
highlight! link NvimAnd NvimBinaryOperator
highlight! link NvimMultiplication NvimBinaryOperator
highlight! link NvimDivision NvimBinaryOperator
highlight! link NvimMod NvimBinaryOperator
highlight! link NvimTernary NvimOperator
highlight! link NvimTernaryColon NvimTernary
highlight! link NvimParenthesis Delimiter
highlight! link NvimLambda NvimParenthesis
highlight! link NvimNestingParenthesis NvimParenthesis
highlight! link NvimCallingParenthesis NvimParenthesis
highlight! link NvimSubscript NvimParenthesis
highlight! link NvimSubscriptBracket NvimSubscript
highlight! link NvimSubscriptColon NvimSubscript
highlight! link NvimCurly NvimSubscript
highlight! link NvimContainer NvimParenthesis
highlight! link NvimDict NvimContainer
highlight! link NvimList NvimContainer
highlight! link NvimIdentifier Identifier
highlight! link NvimIdentifierScope NvimIdentifier
highlight! link NvimIdentifierScopeDelimiter NvimIdentifier
highlight! link NvimIdentifierName NvimIdentifier
highlight! link NvimIdentifierKey NvimIdentifier
highlight! link NvimColon Delimiter
highlight! link NvimComma Delimiter
highlight! link NvimArrow Delimiter
highlight! link NvimRegister SpecialChar
highlight! link NvimNumber Number
highlight! link NvimFloat NvimNumber
highlight! link NvimNumberPrefix Type
highlight! link NvimOptionSigil Type
highlight! link NvimOptionName NvimIdentifier
highlight! link NvimOptionScope NvimIdentifierScope
highlight! link NvimOptionScopeDelimiter NvimIdentifierScopeDelimiter
highlight! link NvimEnvironmentSigil NvimOptionSigil
highlight! link NvimEnvironmentName NvimIdentifier
highlight! link NvimString String
highlight! link NvimStringBody NvimString
highlight! link NvimStringQuote NvimString
highlight! link NvimStringSpecial SpecialChar
highlight! link NvimSingleQuote NvimStringQuote
highlight! link NvimSingleQuotedBody NvimStringBody
highlight! link NvimSingleQuotedQuote NvimStringSpecial
highlight! link NvimDoubleQuote NvimStringQuote
highlight! link NvimDoubleQuotedBody NvimStringBody
highlight! link NvimDoubleQuotedEscape NvimStringSpecial
highlight! link NvimFigureBrace NvimInternalError
highlight! link NvimSingleQuotedUnknownEscape NvimInternalError
highlight! link NvimSpacing Normal
highlight! link NvimInvalidSingleQuotedUnknownEscape NvimInternalError
highlight! link NvimInvalid Error
highlight! link NvimInvalidAssignment NvimInvalid
highlight! link NvimInvalidPlainAssignment NvimInvalidAssignment
highlight! link NvimInvalidAugmentedAssignment NvimInvalidAssignment
highlight! link NvimInvalidAssignmentWithAddition NvimInvalidAugmentedAssignment
highlight! link NvimInvalidAssignmentWithSubtraction NvimInvalidAugmentedAssignment
highlight! link NvimInvalidAssignmentWithConcatenation NvimInvalidAugmentedAssignment
highlight! link NvimInvalidOperator NvimInvalid
highlight! link NvimInvalidUnaryOperator NvimInvalidOperator
highlight! link NvimInvalidUnaryPlus NvimInvalidUnaryOperator
highlight! link NvimInvalidUnaryMinus NvimInvalidUnaryOperator
highlight! link NvimInvalidNot NvimInvalidUnaryOperator
highlight! link NvimInvalidBinaryOperator NvimInvalidOperator
highlight! link NvimInvalidComparison NvimInvalidBinaryOperator
highlight! link NvimInvalidComparisonModifier NvimInvalidComparison
highlight! link NvimInvalidBinaryPlus NvimInvalidBinaryOperator
highlight! link NvimInvalidBinaryMinus NvimInvalidBinaryOperator
highlight! link NvimInvalidConcat NvimInvalidBinaryOperator
highlight! link NvimInvalidConcatOrSubscript NvimInvalidConcat
highlight! link NvimInvalidOr NvimInvalidBinaryOperator
highlight! link NvimInvalidAnd NvimInvalidBinaryOperator
highlight! link NvimInvalidMultiplication NvimInvalidBinaryOperator
highlight! link NvimInvalidDivision NvimInvalidBinaryOperator
highlight! link NvimInvalidMod NvimInvalidBinaryOperator
highlight! link NvimInvalidTernary NvimInvalidOperator
highlight! link NvimInvalidTernaryColon NvimInvalidTernary
highlight! link NvimInvalidDelimiter NvimInvalid
highlight! link NvimInvalidParenthesis NvimInvalidDelimiter
highlight! link NvimInvalidLambda NvimInvalidParenthesis
highlight! link NvimInvalidNestingParenthesis NvimInvalidParenthesis
highlight! link NvimInvalidCallingParenthesis NvimInvalidParenthesis
highlight! link NvimInvalidSubscript NvimInvalidParenthesis
highlight! link NvimInvalidSubscriptBracket NvimInvalidSubscript
highlight! link NvimInvalidSubscriptColon NvimInvalidSubscript
highlight! link NvimInvalidCurly NvimInvalidSubscript
highlight! link NvimInvalidContainer NvimInvalidParenthesis
highlight! link NvimInvalidDict NvimInvalidContainer
highlight! link NvimInvalidList NvimInvalidContainer
highlight! link NvimInvalidValue NvimInvalid
highlight! link NvimInvalidIdentifier NvimInvalidValue
highlight! link NvimInvalidIdentifierScope NvimInvalidIdentifier
highlight! link NvimInvalidIdentifierScopeDelimiter NvimInvalidIdentifier
highlight! link NvimInvalidIdentifierName NvimInvalidIdentifier
highlight! link NvimInvalidIdentifierKey NvimInvalidIdentifier
highlight! link NvimInvalidColon NvimInvalidDelimiter
highlight! link NvimInvalidComma NvimInvalidDelimiter
highlight! link NvimInvalidArrow NvimInvalidDelimiter
highlight! link NvimInvalidRegister NvimInvalidValue
highlight! link NvimInvalidNumber NvimInvalidValue
highlight! link NvimInvalidFloat NvimInvalidNumber
highlight! link NvimInvalidNumberPrefix NvimInvalidNumber
highlight! link NvimInvalidOptionSigil NvimInvalidIdentifier
highlight! link NvimInvalidOptionName NvimInvalidIdentifier
highlight! link NvimInvalidOptionScope NvimInvalidIdentifierScope
highlight! link NvimInvalidOptionScopeDelimiter NvimInvalidIdentifierScopeDelimiter
highlight! link NvimInvalidEnvironmentSigil NvimInvalidOptionSigil
highlight! link NvimInvalidEnvironmentName NvimInvalidIdentifier
highlight! link NvimInvalidString NvimInvalidValue
highlight! link NvimInvalidStringBody NvimStringBody
highlight! link NvimInvalidStringQuote NvimInvalidString
highlight! link NvimInvalidStringSpecial NvimStringSpecial
highlight! link NvimInvalidSingleQuote NvimInvalidStringQuote
highlight! link NvimInvalidSingleQuotedBody NvimInvalidStringBody
highlight! link NvimInvalidSingleQuotedQuote NvimInvalidStringSpecial
highlight! link NvimInvalidDoubleQuote NvimInvalidStringQuote
highlight! link NvimInvalidDoubleQuotedBody NvimInvalidStringBody
highlight! link NvimInvalidDoubleQuotedEscape NvimInvalidStringSpecial
highlight! link NvimInvalidDoubleQuotedUnknownEscape NvimInvalidValue
highlight! link NvimInvalidFigureBrace NvimInvalidDelimiter
highlight! link NvimInvalidSpacing ErrorMsg
highlight! link NvimDoubleQuotedUnknownEscape NvimInvalidValue

highlight! link CccFloatNormal NormalFloat
highlight! link CccFloatBorder FloatBorder
highlight MiniTablineCurrent gui=bold guifg=#241f31 guibg=#ececec
highlight MiniTablineVisible gui=bold guifg=#241f31 guibg=#f2f2f2
highlight MiniTablineHidden guifg=#5e5c64
highlight MiniTablineModifiedCurrent gui=bold guifg=#ececec guibg=#241f31
highlight MiniTablineModifiedVisible gui=bold guifg=#ececec guibg=#5e5c64
highlight MiniTablineModifiedHidden guifg=#241f31 guibg=#f2f2f2
highlight MiniTablineTabpagesection gui=bold guifg=#241f31 guibg=#f8e45c

highlight MiniTablineTrunc gui=bold guifg=#241f31 guibg=#f2f2f2
highlight MiniIconsAzure guifg=#1a5fb4
highlight MiniIconsBlue guifg=#1c71d8
highlight MiniIconsCyan guifg=#2190a4
highlight MiniIconsGreen guifg=#26a269
highlight MiniIconsGrey guifg=#5e5c64
highlight MiniIconsOrange guifg=#c64600
highlight MiniIconsPurple guifg=#9141ac
highlight MiniIconsRed guifg=#c01c28
highlight MiniIconsYellow guifg=#c88800
highlight! link MiniSurround IncSearch
highlight! link MiniCompletionActiveParameter LspSignatureActiveParameter
highlight! link MiniCompletionInfoBorderOutdated DiagnosticFloatingWarn
highlight MiniSnippetsCurrent cterm=underdouble gui=underdouble guisp=#9141ac
highlight MiniSnippetsCurrentReplace cterm=underdouble gui=underdouble guisp=#c01c28
highlight MiniSnippetsFinal cterm=underdouble gui=underdouble guisp=#26a269
highlight MiniSnippetsUnvisited cterm=underdouble gui=underdouble guisp=#1c71d8
highlight MiniSnippetsVisited cterm=underdouble gui=underdouble guisp=#2190a4
highlight! link MiniFilesBorder NormalFloat
highlight! link MiniFilesBorderModified DiagnosticFloatingWarn
highlight MiniFilesCursorLine guibg=#ececec
highlight! link MiniFilesDirectory Directory
highlight MiniFilesFile guifg=#241f31
highlight! link MiniFilesNormal NormalFloat
highlight MiniFilesTitle guifg=#1c71d8 guibg=#f2f2f2
highlight MiniFilesTitleFocused gui=bold guifg=#1c71d8 guibg=#f2f2f2
highlight TermCursorNC gui=reverse
highlight Bold gui=bold
highlight Italic gui=italic
highlight TooLong guifg=#c01c28
highlight diffAdded guifg=#26a269
highlight diffChanged guifg=#9141ac
highlight diffFile guifg=#c64600
highlight diffLine guifg=#2190a4
highlight diffRemoved guifg=#c01c28
highlight gitcommitBranch gui=bold guifg=#c64600
highlight! link gitcommitComment Comment
highlight! link gitcommitDiscarded Comment
highlight gitcommitDiscardedFile gui=bold guifg=#c01c28
highlight gitcommitDiscardedType guifg=#1c71d8
highlight gitcommitHeader guifg=#9141ac
highlight gitcommitOverflow guifg=#c01c28
highlight! link gitcommitSelected Comment
highlight gitcommitSelectedFile gui=bold guifg=#26a269
highlight! link gitcommitSelectedType gitcommitDiscardedType
highlight gitcommitSummary guifg=#26a269
highlight! link gitcommitUnmergedFile gitcommitDiscardedFile
highlight! link gitcommitUnmergedType gitcommitDiscardedType
highlight! link gitcommitUntracked Comment
highlight gitcommitUntrackedFile guifg=#c88800
highlight markdownH1 guifg=#1a5fb4
highlight markdownH2 guifg=#813d9c
highlight markdownH3 guifg=#26a269
highlight markdownH4 guifg=#c64600
highlight markdownH5 guifg=#986a44
highlight markdownH6 guifg=#5e5c64
highlight @keyword.return guifg=#c01c28
highlight @symbol guifg=#9141ac

highlight @text.strong gui=bold
highlight @text.emphasis gui=italic
highlight @text.strike gui=strikethrough
highlight! link @text.underline Underlined
highlight! link @markup.heading.3 markdownH3
highlight! link @markup.heading.4 markdownH4
highlight! link @markup.heading.5 markdownH5
highlight! link @markup.heading.6 markdownH6
highlight! link @string.special.vimdoc SpecialChar
highlight @variable.parameter.vimdoc guifg=#c64600
highlight MiniAnimateCursor gui=reverse,nocombine
highlight! link MiniAnimateNormalFloat NormalFloat
highlight! link MiniClueBorder NormalFloat
highlight! link MiniClueDescGroup DiagnosticFloatingWarn
highlight! link MiniClueDescSingle NormalFloat
highlight! link MiniClueNextKey DiagnosticFloatingHint
highlight! link MiniClueNextKeyWithPostkeys DiagnosticFloatingError
highlight! link MiniClueSeparator DiagnosticFloatingInfo
highlight MiniClueTitle gui=bold guifg=#1c71d8 guibg=#f2f2f2
highlight MiniCursorword gui=underline
highlight MiniCursorwordCurrent gui=underline
highlight! link MiniDepsChangeAdded diffAdded
highlight! link MiniDepsChangeRemoved diffRemoved
highlight! link MiniDepsHint DiagnosticHint
highlight! link MiniDepsInfo DiagnosticInfo
highlight! link MiniDepsMsgBreaking DiagnosticWarn
highlight! link MiniDepsPlaceholder Comment
highlight! link MiniDepsTitle Title
highlight! link MiniDepsTitleError DiffDelete
highlight! link MiniDepsTitleSame DiffText
highlight! link MiniDepsTitleUpdate DiffAdd
highlight MiniDiffSignAdd guifg=#26a269 guibg=#f2f2f2
highlight MiniDiffSignChange guifg=#9141ac guibg=#f2f2f2
highlight MiniDiffSignDelete guifg=#c01c28 guibg=#f2f2f2
highlight! link MiniDiffOverAdd DiffAdd
highlight! link MiniDiffOverChange DiffText
highlight! link MiniDiffOverChangeBuf MiniDiffOverChange
highlight! link MiniDiffOverContext DiffChange

highlight! link MiniDiffOverDelete DiffDelete
highlight MiniHipatternsFixme gui=bold guifg=#ffffff guibg=#ed333b
highlight MiniHipatternsHack gui=bold guifg=#241f31 guibg=#dc8add
highlight MiniHipatternsNote gui=bold guifg=#241f31 guibg=#99c1f1
highlight MiniHipatternsTodo gui=bold guifg=#241f31 guibg=#8ff0a4
highlight MiniIndentscopeSymbol guifg=#c4c4c4
highlight MiniIndentscopeSymbolOff guifg=#c01c28
highlight! link MiniJump SpellRare
highlight! link MiniJump2dDim Comment
highlight MiniJump2dSpot gui=bold,nocombine guifg=#241f31 guibg=#f2f2f2
highlight MiniJump2dSpotAhead gui=nocombine guifg=#5e5c64 guibg=#fcfcfc
highlight! link MiniJump2dSpotUnique MiniJump2dSpot
highlight MiniMapNormal guifg=#241f31 guibg=#f2f2f2
highlight MiniMapSymbolCount guifg=#2190a4
highlight MiniMapSymbolLine guifg=#1c71d8
highlight MiniMapSymbolView guifg=#986a44
highlight! link MiniNotifyBorder NormalFloat
highlight! link MiniNotifyLspProgress MiniNotifyNormal
highlight! link MiniNotifyNormal NormalFloat
highlight! link MiniNotifyTitle FloatTitle
highlight! link MiniOperatorsExchangeFrom IncSearch
highlight! link MiniPickBorder NormalFloat
highlight MiniPickBorderBusy guifg=#9141ac guibg=#f2f2f2
highlight MiniPickBorderText gui=bold guifg=#1c71d8 guibg=#f2f2f2
highlight MiniPickCursor gui=nocombine blend=100
highlight! link MiniPickIconDirectory Directory
highlight MiniPickIconFile guifg=#241f31
highlight! link MiniPickHeader DiagnosticFloatingHint
highlight MiniPickMatchCurrent guibg=#ececec
highlight MiniPickMatchMarked guibg=#77767b
highlight! link MiniPickMatchRanges DiagnosticFloatingHint
highlight! link MiniPickNormal NormalFloat
highlight MiniPickPreviewLine guibg=#ececec
highlight! link MiniPickPreviewRegion IncSearch
highlight! link MiniPickPrompt MiniPickMatchRanges
highlight MiniPickPromptCaret guifg=#26a269 guibg=#f2f2f2
highlight MiniPickPromptPrefix guifg=#26a269 guibg=#f2f2f2

highlight MiniStarterFooter guifg=#1c71d8
highlight MiniStarterHeader guifg=#1c71d8
highlight! link MiniStarterInactive Comment
highlight MiniStarterItem guifg=#241f31
highlight MiniStarterItemBullet guifg=#986a44
highlight MiniStarterItemPrefix gui=bold guifg=#c01c28
highlight MiniStarterSection guifg=#986a44
highlight MiniStarterQuery gui=bold guifg=#26a269
highlight MiniStatuslineDevinfo guifg=#c4c4c4 guibg=#000000
highlight! link MiniStatuslineFileinfo MiniStatuslineDevinfo
highlight MiniStatuslineFilename guifg=#8b8b8b guibg=#000000
highlight! link MiniStatuslineInactive StatusLineNC
highlight MiniStatuslineModeCommand gui=bold guifg=#ffffff guibg=#ed333b
highlight MiniStatuslineModeInsert gui=bold guifg=#241f31 guibg=#99c1f1
highlight MiniStatuslineModeNormal gui=bold guifg=#fcfcfc guibg=#241f31
highlight MiniStatuslineModeOther gui=bold guifg=#fcfcfc guibg=#77767b
highlight MiniStatuslineModeReplace gui=bold guifg=#241f31 guibg=#dc8add
highlight MiniStatuslineModeVisual gui=bold guifg=#241f31 guibg=#8ff0a4
highlight MiniTestEmphasis gui=bold
highlight MiniTestFail gui=bold guifg=#c01c28
highlight MiniTestPass gui=bold guifg=#26a269
highlight! link MiniTrailspace Error
highlight BufferLineBuffer guifg=#5e5c64
highlight BufferLineBufferSelected gui=bold guifg=#241f31
highlight BufferLineBufferVisible guifg=#241f31
highlight! link BufferLineCloseButton BufferLineBackground

highlight! link BufferLineCloseButtonSelected BufferLineBufferSelected
highlight! link BufferLineCloseButtonVisible BufferLineBufferVisible
highlight! link BufferLineFill Normal
highlight BufferLineTab guifg=#241f31 guibg=#f8e45c
highlight BufferLineTabSelected gui=bold guifg=#241f31 guibg=#f8e45c
highlight HydraRed guifg=#c01c28
highlight HydraBlue guifg=#1c71d8
highlight HydraAmaranth guifg=#9141ac
highlight HydraTeal guifg=#26a269
highlight HydraPink guifg=#c64600
highlight! link HydraHint NormalFloat
highlight Beacon guibg=#241f31
highlight LazyButton guibg=#f2f2f2
highlight LazyButtonActive guibg=#ececec
highlight! link LazyDimmed Comment
highlight LazyH1 gui=bold guibg=#ececec
highlight NoiceCmdlinePopupBorder guifg=#1c71d8
highlight NoiceConfirmBorder guifg=#9141ac
highlight TroubleCount gui=bold guifg=#26a269
highlight TroubleFoldIcon guifg=#241f31
highlight TroubleIndent guifg=#dcdcdc
highlight TroubleLocation guifg=#5e5c64
highlight! link TroubleSignError DiagnosticError
highlight! link TroubleSignHint DiagnosticHint
highlight! link TroubleSignInformation DiagnosticInfo
highlight! link TroubleSignOther DiagnosticInfo
highlight! link TroubleSignWarning DiagnosticWarn
highlight TroubleText guifg=#241f31
highlight! link TroubleTextError TroubleText
highlight! link TroubleTextHint TroubleText
highlight! link TroubleTextInformation TroubleText
highlight! link TroubleTextWarning TroubleText
highlight WhichKey guifg=#1c71d8
highlight WhichKeyDesc guifg=#241f31
highlight WhichKeyFloat guifg=#241f31 guibg=#f2f2f2
highlight WhichKeyGroup guifg=#9141ac
highlight WhichKeySeparator guifg=#26a269 guibg=#f2f2f2
highlight WhichKeyValue guifg=#77767b
highlight LeapMatch gui=bold,underline,nocombine guifg=#9141ac
highlight LeapLabel gui=bold,nocombine guifg=#c01c28
highlight LeapLabelSelected gui=bold,nocombine guifg=#c64600
highlight! link LeapBackdrop Comment
highlight LightspeedLabel gui=bold,underline guifg=#9141ac
highlight LightspeedLabelDistant gui=bold,underline guifg=#1c71d8
highlight LightspeedShortcut gui=bold guifg=#241f31
highlight LightspeedMaskedChar guifg=#5e5c64
highlight LightspeedUnlabeledMatch gui=bold guifg=#241f31
highlight! link LightspeedGreyWash Comment
highlight! link LightspeedUniqueChar LightspeedUnlabeledMatch
highlight! link LightspeedOneCharMatch LightspeedShortcut
highlight! link LightspeedPendingOpArea IncSearch
highlight! link LightspeedCursor Cursor
highlight! link DashboardCenter Delimiter
highlight! link DashboardFooter Title
highlight! link DashboardHeader Title
highlight! link DashboardShortCut WarningMsg
highlight LspSagaCodeActionBorder guifg=#dcdcdc
highlight LspSagaCodeActionContent guifg=#241f31
highlight LspSagaCodeActionTitle gui=bold guifg=#1c71d8
highlight Definitions guifg=#26a269
highlight DefinitionsIcon guifg=#1c71d8
highlight FinderParam guifg=#c01c28
highlight FinderVirtText guifg=#c64600
highlight LspSagaAutoPreview guifg=#dcdcdc
highlight LspSagaFinderSelection guifg=#c88800
highlight LspSagaLspFinderBorder guifg=#dcdcdc
highlight References guifg=#26a269
highlight ReferencesIcon guifg=#1c71d8
highlight TargetFileName guifg=#241f31
highlight FinderSpinner guifg=#26a269
highlight FinderSpinnerBorder guifg=#dcdcdc
highlight! link FinderSpinnerTitle Title
highlight LspSagaDefPreviewBorder guifg=#dcdcdc
highlight LspSagaHoverBorder guifg=#dcdcdc
highlight LspSagaRenameBorder guifg=#dcdcdc
highlight LspSagaDiagnosticBorder guifg=#dcdcdc
highlight! link LspSagaDiagnosticHeader Title
highlight LspSagaDiagnosticSource guifg=#9141ac
highlight! link LspSagaBorderTitle Title
highlight LspSagaSignatureHelpBorder guifg=#dcdcdc
highlight LSOutlinePreviewBorder guifg=#dcdcdc
highlight OutlineDetail guifg=#77767b
highlight OutlineFoldPrefix guifg=#c01c28
highlight OutlineIndentEvn guifg=#5e5c64
highlight OutlineIndentOdd guifg=#241f31
highlight RainbowDelimiterBlue guifg=#1c71d8
highlight RainbowDelimiterCyan guifg=#2190a4
highlight RainbowDelimiterGreen guifg=#26a269
highlight RainbowDelimiterOrange guifg=#c64600
highlight RainbowDelimiterRed guifg=#c01c28
highlight RainbowDelimiterViolet guifg=#9141ac
highlight RainbowDelimiterYellow guifg=#c88800
highlight CmpItemAbbr guifg=#241f31
highlight CmpItemAbbrDeprecated guifg=#77767b
highlight CmpItemAbbrMatch gui=bold guifg=#c88800
highlight CmpItemAbbrMatchFuzzy gui=bold guifg=#c88800
highlight CmpItemKind guifg=#986a44 guibg=#f2f2f2
highlight CmpItemMenu guifg=#241f31 guibg=#f2f2f2
highlight! link CmpItemKindClass Type
highlight! link CmpItemKindColor Special
highlight! link CmpItemKindConstant Constant
highlight! link CmpItemKindConstructor Type
highlight! link CmpItemKindEnum Structure
highlight! link CmpItemKindEnumMember Structure
highlight! link CmpItemKindEvent Exception
highlight! link CmpItemKindField Structure
highlight! link CmpItemKindFile Tag
highlight! link CmpItemKindFolder Directory
highlight! link CmpItemKindFunction Function
highlight! link CmpItemKindInterface Structure
highlight! link CmpItemKindKeyword Keyword
highlight! link CmpItemKindMethod Function
highlight! link CmpItemKindModule Structure
highlight! link CmpItemKindOperator Operator
highlight! link CmpItemKindProperty Structure
highlight! link CmpItemKindReference Tag
highlight! link CmpItemKindSnippet Special
highlight! link CmpItemKindStruct Structure
highlight! link CmpItemKindText Statement
highlight! link CmpItemKindTypeParameter Type
highlight! link CmpItemKindUnit Special
highlight! link CmpItemKindValue Identifier
highlight! link CmpItemKindVariable Delimiter
highlight! link FzfLuaBufFlagAlt Special
highlight! link FzfLuaBufFlagCur CursorLineNr
highlight! link FzfLuaBufNr DiagnosticHint
highlight! link FzfLuaHeaderBind DiagnosticWarn
highlight! link FzfLuaHeaderText DiagnosticInfo
highlight! link FzfLuaLiveSym DiagnosticHint
highlight! link FzfLuaPathColNr DiagnosticHint
highlight! link FzfLuaPathLineNr DiagnosticInfo
highlight! link FzfLuaTabMarker DiagnosticHint
highlight! link FzfLuaTabTitle Title
highlight! link FzfLuaTitle FloatTitle
highlight Sneak guifg=#241f31 guibg=#dc8add
highlight SneakScope guifg=#fcfcfc guibg=#241f31
highlight SneakLabel gui=bold guifg=#241f31 guibg=#dc8add
highlight! link BqfPreviewFloat NormalFloat
highlight BqfPreviewTitle guifg=#1c71d8 guibg=#f2f2f2
highlight BqfSign guifg=#2190a4 guibg=#f2f2f2
highlight GitSignsAdd guifg=#26a269 guibg=#f2f2f2
highlight! link GitSignsAddLn GitSignsAdd
highlight! link GitSignsAddInline GitSignsAdd
highlight GitSignsChange guifg=#9141ac guibg=#f2f2f2
highlight! link GitSignsChangeLn GitSignsChange
highlight! link GitSignsChangeInline GitSignsChange
highlight GitSignsDelete guifg=#c01c28 guibg=#f2f2f2
highlight! link GitSignsDeleteLn GitSignsDelete
highlight! link GitSignsDeleteInline GitSignsDelete
highlight GitSignsUntracked guifg=#1c71d8 guibg=#f2f2f2
highlight! link GitSignsUntrackedLn GitSignsUntracked
highlight! link GitSignsUntrackedInline GitSignsUntracked
highlight IndentBlanklineChar gui=nocombine guifg=#dcdcdc
highlight IndentBlanklineContextChar gui=nocombine guifg=#986a44
highlight IndentBlanklineContextStart gui=underline,nocombine guisp=#986a44
highlight IndentBlanklineIndent1 gui=nocombine guifg=#c01c28
highlight IndentBlanklineIndent2 gui=nocombine guifg=#c64600
highlight IndentBlanklineIndent3 gui=nocombine guifg=#c88800
highlight IndentBlanklineIndent4 gui=nocombine guifg=#26a269
highlight IndentBlanklineIndent5 gui=nocombine guifg=#2190a4
highlight IndentBlanklineIndent6 gui=nocombine guifg=#1c71d8
highlight IndentBlanklineIndent7 gui=nocombine guifg=#9141ac
highlight IndentBlanklineIndent8 gui=nocombine guifg=#986a44
highlight RenderMarkdownBullet guifg=#9141ac
highlight! link RenderMarkdownChecked DiagnosticOk
highlight RenderMarkdownCode guibg=#f2f2f2

highlight RenderMarkdownDash guifg=#9141ac
highlight RenderMarkdownH1 guifg=#1a5fb4
highlight RenderMarkdownH1Bg guibg=#f2f2f2
highlight RenderMarkdownH2 guifg=#813d9c
highlight RenderMarkdownH2Bg guibg=#f2f2f2
highlight RenderMarkdownH3 guifg=#26a269
highlight RenderMarkdownH3Bg guibg=#f2f2f2
highlight RenderMarkdownH4 guifg=#c64600
highlight RenderMarkdownH4Bg guibg=#f2f2f2
highlight RenderMarkdownH5 guifg=#986a44
highlight RenderMarkdownH5Bg guibg=#f2f2f2
highlight RenderMarkdownH6 guifg=#5e5c64
highlight RenderMarkdownH6Bg guibg=#f2f2f2
highlight! link RenderMarkdownTodo Todo
highlight! link RenderMarkdownUnchecked DiagnosticWarn
highlight! link CocCodeLens LspCodeLens
highlight! link CocDisabled Comment
highlight! link CocFadeOut Comment
highlight CocMarkdownLink guifg=#986a44
highlight CocMenuSel guibg=#ececec
highlight! link CocNotificationProgress CocMarkdownLink
highlight! link CocPumVirtualText CocMarkdownLink
highlight CocSearch guifg=#c88800
highlight CocSelectedText guifg=#c01c28
highlight! link NeogitCommitViewHeader Special
highlight! link NeogitDiffAddHighlight DiffAdd
highlight! link NeogitDiffAdd DiffAdd
highlight! link NeogitDiffDeleteHighlight DiffDelete
highlight! link NeogitDiffDelete DiffDelete
highlight! link NeogitFold FoldColumn
highlight NeogitHunkHeader guifg=#1c71d8
highlight NeogitHunkHeaderHighlight gui=bold guifg=#1c71d8
highlight! link NeogitNotificationError DiagnosticError
highlight! link NeogitNotificationInfo DiagnosticInfo
highlight! link NeogitNotificationWarning DiagnosticWarn
highlight NeoTreeDimText guifg=#77767b
highlight NeoTreeDotfile guifg=#5e5c64
highlight! link NeoTreeFadeText1 NeoTreeDimText
highlight NeoTreeFadeText2 guifg=#dcdcdc
highlight NeoTreeGitAdded guifg=#26a269
highlight NeoTreeGitConflict gui=bold guifg=#c01c28
highlight NeoTreeGitDeleted guifg=#c01c28
highlight NeoTreeGitModified guifg=#9141ac
highlight NeoTreeGitUnstaged guifg=#c01c28
highlight NeoTreeGitUntracked guifg=#c88800
highlight NeoTreeMessage guifg=#241f31 guibg=#f2f2f2
highlight NeoTreeModified guifg=#241f31
highlight NeoTreeRootName gui=bold guifg=#1c71d8
highlight NeoTreeTabInactive guifg=#5e5c64
highlight NeoTreeTabSeparatorActive guifg=#77767b guibg=#ececec
highlight NeoTreeTabSeparatorInactive guifg=#f2f2f2 guibg=#f2f2f2
highlight TelescopeBorder guifg=#dcdcdc
highlight TelescopeMatching guifg=#c88800
highlight TelescopeMultiSelection gui=bold guibg=#f2f2f2
highlight TelescopeSelection gui=bold guibg=#f2f2f2
highlight NvimTreeExecFile gui=bold guifg=#26a269
highlight NvimTreeFolderIcon guifg=#77767b
highlight NvimTreeGitDeleted guifg=#c01c28
highlight NvimTreeGitDirty guifg=#c01c28
highlight NvimTreeGitMerge guifg=#2190a4
highlight NvimTreeGitNew guifg=#c88800
highlight NvimTreeGitRenamed guifg=#9141ac
highlight NvimTreeGitStaged guifg=#26a269
highlight NvimTreeImageFile gui=bold guifg=#9141ac
highlight! link NvimTreeIndentMarker NvimTreeFolderIcon
highlight! link NvimTreeOpenedFile NvimTreeExecFile
highlight! link NvimTreeRootFolder NvimTreeGitRenamed
highlight NvimTreeSpecialFile gui=bold,underline guifg=#1c71d8
highlight NvimTreeSymlink gui=bold guifg=#986a44
highlight NvimTreeWindowPicker gui=bold guifg=#241f31 guibg=#f2f2f2
highlight! link HelpviewHeading1 markdownH1
highlight! link HelpviewHeading2 markdownH2
highlight! link HelpviewHeading3 markdownH3
highlight! link HelpviewHeading4 markdownH4
highlight HelpviewMentionlink gui=underline
highlight HelpviewOptionlink gui=underline guifg=#1c71d8
highlight HelpviewTaglink gui=bold guifg=#c88800
highlight! link HelpviewTitle Title
highlight MarkviewPalette0 guifg=#9141ac guibg=#fcfcfc
highlight MarkviewPalette0Fg guifg=#9141ac
highlight MarkviewPalette0Bg guibg=#fcfcfc
highlight MarkviewPalette0Sign guifg=#9141ac
highlight MarkviewPalette1 guifg=#c01c28 guibg=#fcfcfc
highlight MarkviewPalette1Fg guifg=#c01c28
highlight MarkviewPalette1Bg guibg=#fcfcfc
highlight MarkviewPalette1Sign guifg=#c01c28
highlight MarkviewPalette2 guifg=#c64600 guibg=#fcfcfc
highlight MarkviewPalette2Fg guifg=#c64600
highlight MarkviewPalette2Bg guibg=#fcfcfc
highlight MarkviewPalette2Sign guifg=#c64600
highlight MarkviewPalette3 guifg=#c88800 guibg=#fcfcfc
highlight MarkviewPalette3Fg guifg=#c88800
highlight MarkviewPalette3Bg guibg=#fcfcfc
highlight MarkviewPalette3Sign guifg=#c88800
highlight MarkviewPalette4 guifg=#26a269 guibg=#fcfcfc
highlight MarkviewPalette4Fg guifg=#26a269
highlight MarkviewPalette4Bg guibg=#fcfcfc
highlight MarkviewPalette4Sign guifg=#26a269
highlight MarkviewPalette5 guifg=#2190a4 guibg=#fcfcfc
highlight MarkviewPalette5Fg guifg=#2190a4
highlight MarkviewPalette5Bg guibg=#fcfcfc
highlight MarkviewPalette5Sign guifg=#2190a4
highlight MarkviewPalette6 guifg=#1c71d8 guibg=#fcfcfc
highlight MarkviewPalette6Fg guifg=#1c71d8
highlight MarkviewPalette6Bg guibg=#fcfcfc
highlight MarkviewPalette6Sign guifg=#1c71d8
highlight MarkviewPalette7 guifg=#986a44 guibg=#fcfcfc
highlight MarkviewPalette7Fg guifg=#986a44
highlight MarkviewPalette7Bg guibg=#fcfcfc
highlight MarkviewPalette7Sign guifg=#986a44
highlight HopNextKey gui=bold,nocombine guifg=#9141ac
highlight HopNextKey1 gui=bold,nocombine guifg=#c01c28
highlight HopNextKey2 gui=bold,nocombine guifg=#5e5c64
highlight HopPreview gui=bold,nocombine guifg=#c64600
highlight! link HopUnmatched Comment
highlight! link DapUIScope Title
highlight! link DapUIType Type
highlight DapUIModifiedValue gui=bold guifg=#9141ac
highlight! link DapUIDecoration Title
highlight! link DapUIThread String
highlight! link DapUIStoppedThread Title
highlight! link DapUISource Directory
highlight! link DapUILineNumber Title
highlight! link DapUIFloatBorder SpecialChar
highlight! link DapUIWatchesEmpty ErrorMsg
highlight! link DapUIWatchesValue String
highlight! link DapUIWatchesError DiagnosticError
highlight! link DapUIBreakpointsPath Directory
highlight! link DapUIBreakpointsInfo DiagnosticInfo
highlight DapUIBreakpointsCurrentLine gui=bold guifg=#26a269
highlight! link DapUIBreakpointsDisabledLine Comment
highlight NotifyDEBUGBorder guifg=#77767b
highlight! link NotifyDEBUGIcon NotifyDEBUGBorder
highlight! link NotifyDEBUGTitle NotifyDEBUGBorder
highlight NotifyERRORBorder guifg=#c01c28
highlight! link NotifyERRORIcon NotifyERRORBorder
highlight! link NotifyERRORTitle NotifyERRORBorder
highlight NotifyINFOBorder guifg=#2190a4
highlight! link NotifyINFOIcon NotifyINFOBorder
highlight! link NotifyINFOTitle NotifyINFOBorder
highlight NotifyTRACEBorder guifg=#1c71d8
highlight! link NotifyTRACEIcon NotifyTRACEBorder
highlight! link NotifyTRACETitle NotifyTRACEBorder
highlight NotifyWARNBorder guifg=#9141ac
highlight! link NotifyWARNIcon NotifyWARNBorder
highlight! link NotifyWARNTitle NotifyWARNBorder
highlight PounceMatch gui=bold,nocombine guifg=#fcfcfc guibg=#241f31
highlight PounceGap gui=bold,nocombine guifg=#fcfcfc guibg=#77767b
highlight PounceAccept gui=bold,nocombine guifg=#ffffff guibg=#ed333b
highlight PounceAcceptBest gui=bold,nocombine guifg=#241f31 guibg=#8ff0a4
highlight BufferCurrent gui=bold guifg=#241f31 guibg=#ececec
highlight BufferCurrentIcon guibg=#ececec
highlight! link BufferCurrentIndex BufferCurrentIcon
highlight BufferCurrentMod gui=bold guifg=#c01c28 guibg=#ececec
highlight! link BufferCurrentSign BufferCurrent
highlight BufferCurrentTarget gui=bold guifg=#9141ac guibg=#ececec
highlight BufferInactive guifg=#5e5c64 guibg=#f2f2f2
highlight BufferInactiveIcon guibg=#f2f2f2
highlight! link BufferInactiveIndex BufferInactiveIcon
highlight BufferInactiveMod guifg=#c01c28 guibg=#f2f2f2
highlight! link BufferInactiveSign BufferInactive
highlight BufferInactiveTarget gui=bold guifg=#9141ac guibg=#f2f2f2
highlight! link BufferOffset Normal
highlight BufferTabpages gui=bold guifg=#241f31 guibg=#f8e45c
highlight! link BufferTabpageFill Normal
highlight BufferVisible gui=bold guifg=#241f31 guibg=#f2f2f2
highlight BufferVisibleIcon guibg=#f2f2f2
highlight! link BufferVisibleIndex BufferVisibleIcon
highlight BufferVisibleMod gui=bold guifg=#c01c28 guibg=#f2f2f2
highlight! link BufferVisibleSign BufferVisible
highlight BufferVisibleTarget gui=bold guifg=#9141ac guibg=#f2f2f2
highlight MasonError guifg=#c01c28
highlight MasonHeader gui=bold guifg=#241f31 guibg=#99c1f1
highlight MasonHeaderSecondary gui=bold guifg=#241f31 guibg=#cdab8f
highlight! link MasonHeading Bold
highlight MasonHighlight guifg=#986a44
highlight MasonHighlightBlock guifg=#241f31 guibg=#cdab8f
highlight! link MasonHighlightBlockBold MasonHeaderSecondary
highlight! link MasonHighlightBlockBoldSecondary MasonHeader
highlight MasonHighlightBlockSecondary guifg=#241f31 guibg=#99c1f1
highlight MasonHighlightSecondary guifg=#1c71d8
highlight! link MasonLink MasonHighlight
highlight! link MasonMuted Comment
highlight MasonMutedBlock guifg=#fcfcfc guibg=#77767b
highlight MasonMutedBlockBold gui=bold guifg=#fcfcfc guibg=#77767b
highlight! link vimTodo Todo
highlight! link vimBang vimOper
highlight! link vimCommand Statement
highlight! link vimCommandModifier vimCommand
highlight! link vimCommandModifierBang vimBang
highlight! link vimOption PreProc
highlight! link vimSetMod vimOption
highlight! link vimOptionVarName Identifier
highlight! link vimErrSetting vimError
highlight! link vimAutoEvent Type
highlight! link vimAutocmdMod Special
highlight! link vimGroup Type
highlight! link vimHLGroup vimGroup
highlight! link nvimHLGroup vimHLGroup
highlight! link vim9Null Constant
highlight! link vim9Boolean Boolean
highlight! link vimSubst1 vimSubst
highlight! link vimNumber Number
highlight! link vimAbb vimCommand
highlight! link vimAddress vimMark
highlight! link vimAutocmd vimCommand
highlight! link vimBehave vimCommand
highlight! link vimCall vimCommand
highlight! link vimCatch vimCommand
highlight! link vimConst vimCommand
highlight! link vimDoautocmd vimCommand
highlight! link vimDebuggreedy vimCommand
highlight! link vimDef vimCommand
highlight! link vimDelcommand vimCommand
highlight! link vimDelFunction vimCommand
highlight! link vimElse vimCommand
highlight! link vimEnddef vimCommand
highlight! link vimEndfunction vimCommand
highlight! link vimEndif vimCommand
highlight! link vimEval vimCommand
highlight! link vimExFilter vimCommand
highlight! link vimExMark vimCommand
highlight! link vimFor vimCommand
highlight! link vimFunction vimCommand
highlight! link vimGrep vimCommand
highlight! link vimGrepAdd vimCommand
highlight! link vimHelpgrep vimCommand
highlight! link vimHighlight vimCommand
highlight! link vimImport vimCommand
highlight! link vimLet vimCommand
highlight! link vimLockvar vimCommand
highlight! link vimMake vimCommand
highlight! link vimMap vimCommand
highlight! link vimMark Number
highlight! link vimMatch vimCommand
highlight! link vimNotFunc vimCommand
highlight! link vimNormal vimCommand
highlight! link vimProfdel vimCommand
highlight! link vimProfile vimCommand
highlight! link vimRedir vimCommand
highlight! link vimSet vimCommand
highlight! link vimSleep vimCommand
highlight! link vimSort vimCommand
highlight! link vimSyntax vimCommand
highlight! link vimSynColor vimCommand
highlight! link vimSynLink vimCommand
highlight! link vimThrow vimCommand
highlight! link vimUniq vimCommand
highlight! link vimUnlet vimCommand
highlight! link vimUnlockvar vimCommand
highlight! link vimUnmap vimMap
highlight! link vimUserCmd vimCommand
highlight! link vimVimgrep vimCommand
highlight! link vimVimgrepadd vimCommand
highlight! link vimMenu vimCommand
highlight! link vimLua vimCommand
highlight! link vimMzScheme vimCommand
highlight! link vimPerl vimCommand
highlight! link vimPython vimCommand
highlight! link vimPython3 vimCommand
highlight! link vimPythonX vimCommand
highlight! link vimRuby vimCommand
highlight! link vimTcl vimCommand
highlight! link vim9Abstract vimCommand
highlight! link vim9Class vimCommand
highlight! link vim9Const vimCommand
highlight! link vim9Enum vimCommand
highlight! link vim9Export vimCommand
highlight! link vim9Final vimCommand
highlight! link vim9For vimCommand
highlight! link vim9Interface vimCommand
highlight! link vim9Type vimCommand
highlight! link vim9Var vimCommand
highlight! link vimCount Number
highlight! link vim9Super Identifier
highlight! link vim9This Identifier
highlight! link vimVar Normal
highlight! link vimVarScope Identifier
highlight! link vimFBVar vimVar
highlight! link vimVimVar Identifier
highlight! link vimVimVarName Identifier
highlight! link vimOptionVar Identifier
highlight! link vimEnvvar PreProc
highlight! link vimLetRegister vimRegister
highlight! link vim9LhsVariable vimVar
highlight! link vimLetHeredoc vimString
highlight! link vimOper Operator
highlight! link vim9LhsRegister vimLetRegister
highlight! link vimString String
highlight! link vimInsert vimString
highlight! link vimBehaveError vimError
highlight! link vimBehaveBang vimBang
highlight! link vimBehaveModel vimBehave
highlight! link vimFTCmd vimCommand
highlight! link vimFTOption vimSynType
highlight! link vimFTError vimError
highlight! link vimImportAutoload Special
highlight! link vim9Comment Comment
highlight! link vimLineComment vimComment
highlight! link vimSpecFile Identifier
highlight! link vimSubst vimCommand
highlight! link vimRegister SpecialChar
highlight! link vimCmplxRepeat SpecialChar
highlight! link vimNotation Special
highlight! link vimCtrlChar SpecialChar
highlight! link vimContinue Special
highlight! link vimAugroupKey vimCommand
highlight! link vimAugroupError vimError
highlight! link vimComment Comment
highlight! link vimAugroupBang vimBang
highlight! link vim9LineComment vimComment
highlight! link vimContinueString vimString
highlight! link vimParenSep Delimiter
highlight! link vimSep Delimiter
highlight! link vimOperError Error
highlight! link vimOperContinue vimContinue
highlight! link vimOperContinueComment vimContinueComment
highlight! link vimLambdaOperator vimOper
highlight! link vimLambdaBrace Delimiter
highlight! link vimFunctionParam vimVar
highlight! link vim9LambdaOperatorComment vim9Comment
highlight! link vim9LambdaOperator vimOper
highlight! link vim9LambdaParen vimParenSep
highlight! link vimDefParam vimVar
highlight! link vimSearch vimString
highlight! link vim9Search vimString
highlight! link vimFunctionBang vimBang
highlight! link vimDefBang vimBang
highlight! link vimFunctionSID vimNotation
highlight! link vimFunctionScope vimVarScope
highlight! link vimFunctionError vimError
highlight! link vimFunctionComment vimComment
highlight! link vimDefComment vim9Comment
highlight! link vimFunctionMod Special
highlight! link vim9CommentError vimError
highlight! link vimCommentError vimError
highlight! link vimFunctionParamEquals vimOper
highlight! link vimDelfunctionBang vimBang
highlight! link vimType Type
highlight! link vimTypeAny vimType
highlight! link vim9MethodDefComment vimDefComment
highlight! link vim9ConstructorDefParam vimVar
highlight! link vim9MethodDef vimCommand
highlight! link vim9Extends Keyword
highlight! link vim9Implements Keyword
highlight! link vim9AbstractDef vimCommand
highlight! link vim9EnumNameComment vim9Comment
highlight! link vim9EnumImplements vim9Implements
highlight! link vimCommentString vimString
highlight! link vim9EnumValueListCommaComment vim9Comment
highlight! link vim9EnumImplementedInterfaceComment vim9Comment
highlight! link vim9TypeAliasError vimError
highlight! link vim9TypeEquals vimOper
highlight! link vimKeymapTailComment vimComment
highlight! link vim9CommentTitle PreProc
highlight! link vimCommentTitle PreProc
highlight! link vimKeymapLineComment vimComment
highlight! link vimSpecFileMod vimSpecFile
highlight! link vimUserCmdAttr Special
highlight! link vimUserCmdAttrError Error
highlight! link vimUserCmdAttrKey vimUserCmdAttr
highlight! link vimUserCmdAttrAddr vimSpecial
highlight! link vimUserCmdAttrComplete vimSpecial
highlight! link vimUserCmdError Error
highlight! link vimUserCmdAttrNargs vimSpecial
highlight! link vimUserCmdAttrRange vimSpecial
highlight! link vimUserCmdAttrCompleteFunc vimVar
highlight! link vimDelcommandAttr vimUserCmdAttr
highlight! link vimPatSepErr vimError
highlight! link vimPatSep SpecialChar
highlight! link vimPatSepZ vimPatSep
highlight! link vimPatSepZone vimString
highlight! link vimPatSepR vimPatSep
highlight! link vimNotPatSep vimString
highlight! link vimEscape Special
highlight! link vimStringEnd vimString
highlight! link vimQuoteEscape vimEscape
highlight! link vimStringInterpolationBrace vimEscape
highlight! link vimSubstTwoBS vimString
highlight! link vimSubstSubstr SpecialChar
highlight! link vimSubstFlags Special
highlight! link vimSubstCount Number
highlight! link vimSubstFlagErr vimError
highlight! link vimSubstDelim Delimiter
highlight! link vimCollClassErr vimError
highlight! link vimMarkArgError vimError
highlight! link vimMarkNumber vimNumber
highlight! link vimPlainMark vimMark
highlight! link vimSetBang vimBang
highlight! link vimSetComment vimComment
highlight! link vimSetAll vimOption
highlight! link vimSetTermcap vimOption
highlight! link vimSetSep vimSep
highlight! link vimLetVar vimVar
highlight! link vimUnletBang vimBang
highlight! link vimLetHeredocStart Special
highlight! link vimLetHeredocStop Special
highlight! link vim9Variable vimVar
highlight! link vim9VariableType vimType
highlight! link vim9VariableTypeAny vimType
highlight! link vimLockvarBang vimBang
highlight! link vimLockvarDepth vimNumber
highlight! link vim9ForInComment vim9Comment
highlight! link vimForInContinue vimContinue
highlight! link vimForInContinueComment vimContinueComment
highlight! link vimMapMod vimBracket
highlight! link vimWildcardQuestion vimWildcard
highlight! link vimWildcardStar vimWildcard
highlight! link vimWildcardBraceComma vimWildcard
highlight! link vimWildcard Special
highlight! link vimWildcardEscape vimWildcard
highlight! link vimWildcardBracket vimWildcard
highlight! link vimWildcardInterval vimWildcard
highlight! link vimWildcardBracketStart vimWildcard
highlight! link vimWildcardBracketHyphen vimWildcard
highlight! link vimWildcardBracketEnd vimWildcard
highlight! link vimWildcardBracketCharacter Normal
highlight! link vimWildcardBracketRightBracket vimWildcardBracketCharacter
highlight! link vimWildcardBracketEscape vimWildcard
highlight! link vimWildcardBracketCharacterClass vimWildcard
highlight! link vimWildcardBracketEquivalenceClass vimWildcard
highlight! link vimWildcardBracketCollatingSymbol vimWildcard
highlight! link vimWildcardBracketCaret vimWildcard
highlight! link nvimAutoEvent vimAutoEvent
highlight! link vimAutoEventGlob Type
highlight! link vimAutocmdBang vimBang
highlight! link vimAutocmdPatternSep vimSep
highlight! link vimAutocmdPatternEscape Special
highlight! link vimAutocmdBufferPattern Special
highlight! link vimDoautocmdMod Special
highlight! link vimEcho vimCommand
highlight! link vimEchohlNone vimGroup
highlight! link vimEchohl vimCommand
highlight! link vimExFilterBang vimBang
highlight! link vimGrepBang vimBang
highlight! link vimMakeBang vimBang
highlight! link vimVimgrepBang vimBang
highlight! link vimVimgrepFlags Special
highlight! link vimMapBang vimBang
highlight! link vimMapLeader vimBracket
highlight! link vimMapModKey vimFunctionSID
highlight! link vimMapModErr vimError
highlight! link vimMapLeaderKey vimNotation
highlight! link vimMenuBang vimBang
highlight! link vimMenuMod vimMapMod
highlight! link vimMenuName PreProc
highlight! link vimMenuPriority Number
highlight! link vimMenuStatus Special
highlight! link vimMenuNotation vimNotation
highlight! link vimMenuClear Special
highlight! link vimMenutranslateComment vimComment
highlight! link vimBracket Delimiter
highlight! link vimCompilerSet vimCommand
highlight! link vimSynMenuPath vimMenuName
highlight! link vimSynMenu vimCommand
highlight! link vimElseIfErr Error
highlight! link vimBufnrWarn vimWarn
highlight! link vimMatchGroup vimGroup
highlight! link vimMatchNone vimGroup
highlight! link vimProfileArg vimSpecial
highlight! link vimProfileBang vimBang
highlight! link vimProfdelArg vimSpecial
highlight! link vimRedirBang vimBang
highlight! link vimRedirFileOperator vimOper
highlight! link vimRedirVariableOperator vimOper
highlight! link vimRedirRegister vimRegister
highlight! link vimRedirEnd Special
highlight! link vimRedirRegisterOperator vimOper
highlight! link vimSleepBang vimBang
highlight! link vimSleepArg Constant
highlight! link vimSortBang vimBang
highlight! link vimSortOptionsError Error
highlight! link vimSortOptions Special
highlight! link vimUniqBang vimBang
highlight! link vimUniqOptions Special
highlight! link vimGroupSpecial Special
highlight! link vimSynError vimError
highlight! link vimSynContains vimSynOption
highlight! link vimSynKeyContainedin vimSynContains
highlight! link vimSynNextgroup vimSynOption
highlight! link vimSynCcharValue Character
highlight! link vimSynCchar vimSynOption
highlight! link vimSynType vimSpecial
highlight! link vimSynCase Type
highlight! link vimSynCaseError vimError
highlight! link vimGroupName Normal
highlight! link vimGroupAdd vimSynOption
highlight! link vimGroupRem vimSynOption
highlight! link vimSynConceal Type
highlight! link vimSynConcealError vimError
highlight! link vimSynFoldlevel Type
highlight! link vimSynFoldlevelError vimError
highlight! link vimSynIskeyword Type
highlight! link vimSynIskeywordSep Delimiter
highlight! link vimSynKeyOpt vimSynOption
highlight! link vimSynMtchOpt vimSynOption
highlight! link vimSynRegPat vimString
highlight! link vimMtchComment vimComment
highlight! link vimSynPatRange vimString
highlight! link vimSynNotPatRange vimSynRegPat
highlight! link vimSynRegOpt vimSynOption
highlight! link vimSynReg Type
highlight! link vimSynMtchGrp vimSynOption
highlight! link vimSynSpell Type
highlight! link vimSynSpellError vimError
highlight! link vimSyncClear Type
highlight! link vimSyncMatch Type
highlight! link vimSyncError vimError
highlight! link vimSyncRegion Type
highlight! link vimSyncLines Type
highlight! link vimSyncLinebreak Type
highlight! link vimSyncLinecont Type
highlight! link vimSyncFromstart Type
highlight! link vimSyncCcomment Type
highlight! link vimSyncGroupName vimGroupName
highlight! link vimSyncKey Type
highlight! link vimSyncGroup vimGroupName
highlight! link vimSyncNone Type
highlight! link vimHiClear Type
highlight! link vimHiCtermError vimError
highlight! link vimHiBang vimBang
highlight! link vimHiGroup vimGroupName
highlight! link vimHiNone vimGroup
highlight! link vimHiAttrib PreProc
highlight! link vimFgBgAttrib vimHiAttrib
highlight! link vimHiAttribList vimError
highlight! link vimHiCtermColor Constant
highlight! link vimHiGuiRgb vimNumber
highlight! link vimHiBlend vimHiTerm
highlight! link vimHiTerm Type
highlight! link vimHiCTerm vimHiTerm
highlight! link vimHiStartStop vimHiTerm
highlight! link vimHiCtermFgBg vimHiTerm
highlight! link vimHiCtermul vimHiTerm
highlight! link vimHiCtermfont vimHiTerm
highlight! link vimHiGui vimHiTerm
highlight! link vimHiGuiFont vimHiTerm
highlight! link vimHiGuiFgBg vimHiTerm
highlight! link vimHiKeyError vimError
highlight! link vimHiNmbr Number
highlight! link luaMetaMethod Function
highlight! link luaParenError Error
highlight! link luaError Error
highlight! link luaFunction Function
highlight! link luaCondElse Conditional
highlight! link luaCond Conditional
highlight! link luaStatement Statement
highlight! link luaRepeat Repeat
highlight! link luaFor Repeat
highlight! link luaLabel Label
highlight! link luaOperator Operator
highlight! link luaSymbolOperator luaOperator
highlight! link luaTodo Todo
highlight! link luaComment Comment
highlight! link luaCommentDelimiter luaComment
highlight! link luaConstant Constant
highlight! link luaSpecial SpecialChar
highlight! link luaString2 String
highlight! link luaStringDelimiter luaString
highlight! link luaString String
highlight! link luaNumber Number
highlight! link luaTable Structure
highlight! link luaFunc Identifier
highlight! link vimScriptHeredocStart vimLetHeredocStart
highlight! link vimScriptHeredocStop vimLetHeredocStop
highlight! link vimFuncName Function
highlight! link vimFunc vimError
highlight! link vimUserFunc Normal
highlight! link vim9MethodName vimFuncName
highlight! link vim9Func vimError
highlight! link vimShebangError vimError
highlight! link vimShebang PreProc
highlight! link vimContinueComment vimComment
highlight! link vim9ContinueComment vimContinueComment
highlight! link vimSearchDelim Delimiter
highlight! link vim9SearchDelim Delimiter
highlight! link vim9Vim9ScriptArg Special
highlight! link vimError Error
highlight! link vimSynIskeywordError vimError
highlight! link vimWarn WarningMsg
highlight! link vimCondHL vimCommand
highlight! link vimFuncEcho vimCommand
highlight! link vimSynOption Special
highlight! link vimImportAs vimImport
highlight! link vim9KeymapLineComment vimKeymapLineComment
highlight! link vimMakeadd vimCommand
highlight! link vimNonText NonText
highlight! link vimPattern Type
highlight! link vimSpecial Type
highlight! link vimScriptDelim Comment
highlight! link vimStringCont vimString
highlight! link vimUserCmdKey vimCommand
highlight! link vim9EnumNameContinue vimContinue
highlight! link vim9EnumNameContinueComment vim9Comment
highlight! link vim9MethodNameError vimFunctionError
highlight! link vim9Public vimCommand
highlight! link vim9Static vimCommand
highlight! link vim9Vim9Script vimCommand
