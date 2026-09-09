set background=light
hi clear
if exists('syntax_on') | syntax reset | endif
let g:colors_name = '734-light'
highlight SpecialKey guifg=#8c8c8c
highlight EndOfBuffer guifg=#8c8c8c
highlight TermCursor cterm=reverse gui=reverse
highlight NonText guifg=#8c8c8c
highlight Directory ctermfg=14 guifg=#1f6688
highlight ErrorMsg ctermfg=9 guifg=#a02b28 guibg=#ffffff
highlight IncSearch guifg=#202020 guibg=#dc9656
highlight Search ctermfg=0 ctermbg=11 guifg=#202020 guibg=#f7ca88
highlight CurSearch ctermfg=0 ctermbg=11 guifg=#202020 guibg=#dc9656
highlight MoreMsg ctermfg=14 guifg=#4d6a24
highlight ModeMsg ctermfg=10 guifg=#4d6a24
highlight LineNr guifg=#5c5c5c
highlight LineNrAbove guifg=#8c8c8c
highlight LineNrBelow guifg=#8c8c8c
highlight CursorLineNr cterm=bold guifg=#5c5c5c guibg=#f1f1f1
highlight CursorLineSign guifg=#8c8c8c guibg=#f1f1f1
highlight CursorLineFold guifg=#2b6d63 guibg=#f1f1f1
highlight Question ctermfg=14 guifg=#1f6688
highlight StatusLine cterm=reverse guifg=#5c5c5c guibg=#e0e0e0
highlight StatusLineNC cterm=bold,underline guifg=#8c8c8c guibg=#f1f1f1
highlight WinSeparator guifg=#e0e0e0 guibg=#e0e0e0
highlight VertSplit guifg=#e0e0e0 guibg=#e0e0e0
highlight Title cterm=bold guifg=#1f6688
highlight Visual ctermfg=0 ctermbg=15 guibg=#e0e0e0

highlight WarningMsg ctermfg=11 guifg=#a02b28
highlight WildMenu guifg=#ab4642 guibg=#f7ca88
highlight Folded guifg=#8c8c8c guibg=#f1f1f1
highlight FoldColumn guifg=#2b6d63
highlight DiffAdd ctermfg=0 ctermbg=10 guifg=#4d6a24 guibg=#f1f1f1
highlight DiffChange guifg=#7b426f guibg=#f1f1f1
highlight DiffDelete cterm=bold ctermfg=9 guifg=#a02b28 guibg=#f1f1f1
highlight DiffText ctermfg=0 ctermbg=14 guifg=#1f6688 guibg=#f1f1f1
highlight! link DiffTextAdd DiffText
highlight SignColumn guifg=#8c8c8c
highlight Conceal guifg=#1f6688
highlight SpellBad cterm=undercurl gui=undercurl guisp=#a02b28
highlight SpellCap cterm=undercurl gui=undercurl guisp=#1f6688
highlight SpellRare cterm=undercurl gui=undercurl guisp=#7b426f
highlight SpellLocal cterm=undercurl gui=undercurl guisp=#2b6d63
highlight Pmenu cterm=reverse guifg=#383838 guibg=#f1f1f1
highlight PmenuSel cterm=underline,reverse gui=reverse guifg=#383838 guibg=#f1f1f1
highlight PmenuMatch cterm=bold gui=bold guifg=#383838 guibg=#f1f1f1
highlight PmenuMatchSel cterm=bold gui=bold,reverse guifg=#383838 guibg=#f1f1f1
highlight PmenuKind guifg=#383838 guibg=#f1f1f1
highlight PmenuKindSel gui=reverse guifg=#383838 guibg=#f1f1f1
highlight PmenuExtra guifg=#383838 guibg=#f1f1f1
highlight PmenuExtraSel gui=reverse guifg=#383838 guibg=#f1f1f1
highlight PmenuSbar guibg=#e0e0e0
highlight PmenuThumb guibg=#181818
highlight TabLine guifg=#8c8c8c
highlight TabLineSel guifg=#4d6a24
highlight TabLineFill guifg=#8c8c8c

highlight CursorLine guibg=#f1f1f1
highlight ColorColumn guibg=#f6f6f6
highlight QuickFixLine ctermfg=14 guibg=#f1f1f1
highlight Whitespace guifg=#8c8c8c
highlight NormalNC guifg=#383838 guibg=#ffffff
highlight MsgSeparator guifg=#5c5c5c guibg=#e0e0e0
highlight NormalFloat guifg=#383838 guibg=#f1f1f1
highlight MsgArea guifg=#383838 guibg=#ffffff
highlight! link FloatBorder NormalFloat
highlight WinBar cterm=bold guifg=#5c5c5c guibg=#e0e0e0
highlight WinBarNC cterm=bold guifg=#8c8c8c guibg=#f1f1f1
highlight Cursor guifg=#ffffff guibg=#000000
highlight! link FloatTitle Title
highlight! link FloatFooter FloatTitle
highlight! link StatusLineTerm StatusLine
highlight! link StatusLineTermNC StatusLineNC
highlight! link StderrMsg ErrorMsg

highlight RedrawDebugNormal cterm=reverse gui=reverse
highlight Underlined cterm=underline gui=underline
highlight lCursor guifg=#ffffff guibg=#000000
highlight CursorIM guifg=#ffffff guibg=#000000

highlight Substitute guifg=#202020 guibg=#f7ca88
highlight VisualNOS guifg=#a02b28
highlight Normal guifg=#383838 guibg=#ffffff
highlight Character guifg=#a02b28
highlight Constant guifg=#9c540f
highlight Number guifg=#9c540f guibg=#ffffff
highlight Boolean guifg=#9c540f
highlight Float guifg=#9c540f
highlight Conditional guifg=#7b426f
highlight Statement cterm=bold guifg=#a02b28
highlight Repeat guifg=#836614
highlight Label guifg=#836614
highlight Keyword guifg=#7b426f
highlight Exception guifg=#a02b28
highlight Include guifg=#1f6688
highlight PreProc guifg=#836614
highlight Define guifg=#7b426f
highlight Macro guifg=#a02b28
highlight PreCondit guifg=#836614
highlight StorageClass guifg=#836614
highlight Type guifg=#836614
highlight Structure guifg=#7b426f
highlight Typedef guifg=#836614
highlight Tag guifg=#836614
highlight Special ctermfg=14 guifg=#2b6d63
highlight SpecialChar guifg=#77462a
highlight SpecialComment guifg=#2b6d63
highlight Debug guifg=#a02b28
highlight Ignore guifg=#2b6d63
highlight! link LspCodeLens Comment
highlight! link LspCodeLensSeparator Comment
highlight! link LspInlayHint NonText
highlight! link LspReferenceRead LspReferenceText
highlight LspReferenceText guibg=#e0e0e0
highlight! link LspReferenceWrite LspReferenceText
highlight! link LspReferenceTarget LspReferenceText
highlight! link LspSignatureActiveParameter LspReferenceText
highlight! link SnippetTabstop Visual
highlight DiagnosticFloatingError guifg=#a02b28
highlight DiagnosticError ctermfg=9 guifg=#a02b28
highlight DiagnosticFloatingWarn guifg=#7b426f
highlight DiagnosticWarn ctermfg=11 guifg=#7b426f
highlight DiagnosticFloatingInfo guifg=#2b6d63
highlight DiagnosticInfo ctermfg=14 guifg=#2b6d63
highlight DiagnosticFloatingHint guifg=#1f6688
highlight DiagnosticHint ctermfg=12 guifg=#1f6688
highlight DiagnosticFloatingOk guifg=#4d6a24
highlight DiagnosticOk ctermfg=10 guifg=#4d6a24
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
highlight Comment guifg=#8c8c8c
highlight @variable guifg=#383838
highlight! link @variable.builtin Special
highlight! link @variable.parameter.builtin Special
highlight! link @constant Constant
highlight! link @constant.builtin Special
highlight! link @module Structure
highlight! link @module.builtin Special
highlight! link @label Label
highlight! link @string String
highlight String ctermfg=10 guifg=#4d6a24
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
highlight Identifier ctermfg=12 guifg=#a02b28
highlight! link @function Function
highlight Function ctermfg=14 guifg=#1f6688
highlight! link @function.builtin Special
highlight! link @constructor Special
highlight! link @operator Operator
highlight Operator guifg=#383838
highlight! link @keyword Keyword
highlight! link @punctuation Delimiter
highlight Delimiter guifg=#77462a
highlight! link @punctuation.special Special
highlight! link @comment Comment
highlight! link @comment.error DiagnosticError
highlight! link @comment.warning DiagnosticWarn
highlight! link @comment.note DiagnosticInfo
highlight! link @comment.todo Todo
highlight Todo cterm=bold guifg=#836614 guibg=#f1f1f1
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
highlight Added ctermfg=10 guifg=#4d6a24
highlight! link @diff.minus Removed
highlight Removed ctermfg=9 guifg=#a02b28
highlight! link @diff.delta Changed
highlight Changed ctermfg=14 guifg=#7b426f
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
highlight @lsp.type.variable guifg=#383838
highlight @lsp.mod.deprecated guifg=#a02b28
highlight DiagnosticDeprecated cterm=strikethrough gui=strikethrough guisp=NvimLightRed
highlight FloatShadow ctermbg=0 guibg=NvimDarkGrey4 blend=80
highlight FloatShadowThrough ctermbg=0 guibg=NvimDarkGrey4 blend=100
highlight MatchParen cterm=bold,underline guibg=#e0e0e0
highlight RedrawDebugClear ctermfg=0 ctermbg=11 guibg=NvimDarkYellow
highlight RedrawDebugComposed ctermfg=0 ctermbg=10 guibg=NvimDarkGreen
highlight RedrawDebugRecompose ctermfg=0 ctermbg=9 guibg=NvimDarkRed
highlight Error ctermfg=0 ctermbg=9 guifg=#101010 guibg=#ab4642
highlight DiagnosticUnderlineError cterm=underline gui=underline guisp=#a02b28
highlight DiagnosticUnderlineWarn cterm=underline gui=underline guisp=#7b426f
highlight DiagnosticUnderlineInfo cterm=underline gui=underline guisp=#2b6d63
highlight DiagnosticUnderlineHint cterm=underline gui=underline guisp=#1f6688
highlight DiagnosticUnderlineOk cterm=underline gui=underline guisp=#4d6a24
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
highlight MiniTablineCurrent gui=bold guifg=#383838 guibg=#e0e0e0
highlight MiniTablineVisible gui=bold guifg=#383838 guibg=#f1f1f1
highlight MiniTablineHidden guifg=#5c5c5c
highlight MiniTablineModifiedCurrent gui=bold guifg=#e0e0e0 guibg=#383838
highlight MiniTablineModifiedVisible gui=bold guifg=#e0e0e0 guibg=#5c5c5c
highlight MiniTablineModifiedHidden guifg=#181818 guibg=#f1f1f1
highlight MiniTablineTabpagesection gui=bold guifg=#202020 guibg=#f7ca88

highlight MiniTablineTrunc gui=bold guifg=#383838 guibg=#f1f1f1
highlight MiniIconsAzure guifg=#1f6688
highlight MiniIconsBlue guifg=#77462a
highlight MiniIconsCyan guifg=#2b6d63
highlight MiniIconsGreen guifg=#4d6a24
highlight MiniIconsGrey guifg=#181818
highlight MiniIconsOrange guifg=#9c540f
highlight MiniIconsPurple guifg=#7b426f
highlight MiniIconsRed guifg=#a02b28
highlight MiniIconsYellow guifg=#836614
highlight! link MiniSurround IncSearch
highlight! link MiniCompletionActiveParameter LspSignatureActiveParameter
highlight! link MiniCompletionInfoBorderOutdated DiagnosticFloatingWarn
highlight MiniSnippetsCurrent cterm=underdouble gui=underdouble guisp=#7b426f
highlight MiniSnippetsCurrentReplace cterm=underdouble gui=underdouble guisp=#a02b28
highlight MiniSnippetsFinal cterm=underdouble gui=underdouble guisp=#4d6a24
highlight MiniSnippetsUnvisited cterm=underdouble gui=underdouble guisp=#1f6688
highlight MiniSnippetsVisited cterm=underdouble gui=underdouble guisp=#2b6d63
highlight! link MiniFilesBorder NormalFloat
highlight! link MiniFilesBorderModified DiagnosticFloatingWarn
highlight MiniFilesCursorLine guibg=#e0e0e0
highlight! link MiniFilesDirectory Directory
highlight MiniFilesFile guifg=#383838
highlight! link MiniFilesNormal NormalFloat
highlight MiniFilesTitle guifg=#1f6688 guibg=#f1f1f1
highlight MiniFilesTitleFocused gui=bold guifg=#1f6688 guibg=#f1f1f1
highlight TermCursorNC gui=reverse
highlight Bold gui=bold
highlight Italic gui=italic
highlight TooLong guifg=#a02b28
highlight diffAdded guifg=#4d6a24
highlight diffChanged guifg=#7b426f
highlight diffFile guifg=#9c540f
highlight diffLine guifg=#2b6d63
highlight diffRemoved guifg=#a02b28
highlight gitcommitBranch gui=bold guifg=#9c540f
highlight! link gitcommitComment Comment
highlight! link gitcommitDiscarded Comment
highlight gitcommitDiscardedFile gui=bold guifg=#a02b28
highlight gitcommitDiscardedType guifg=#1f6688
highlight gitcommitHeader guifg=#7b426f
highlight gitcommitOverflow guifg=#a02b28
highlight! link gitcommitSelected Comment
highlight gitcommitSelectedFile gui=bold guifg=#4d6a24
highlight! link gitcommitSelectedType gitcommitDiscardedType
highlight gitcommitSummary guifg=#4d6a24
highlight! link gitcommitUnmergedFile gitcommitDiscardedFile
highlight! link gitcommitUnmergedType gitcommitDiscardedType
highlight! link gitcommitUntracked Comment
highlight gitcommitUntrackedFile guifg=#836614
highlight markdownH1 guifg=#9c540f
highlight markdownH2 guifg=#836614
highlight markdownH3 guifg=#4d6a24
highlight markdownH4 guifg=#2b6d63
highlight markdownH5 guifg=#1f6688
highlight markdownH6 guifg=#77462a
highlight @keyword.return guifg=#a02b28
highlight @symbol guifg=#7b426f

highlight @text.strong gui=bold
highlight @text.emphasis gui=italic
highlight @text.strike gui=strikethrough
highlight! link @text.underline Underlined
highlight! link @markup.heading.3 markdownH3
highlight! link @markup.heading.4 markdownH4
highlight! link @markup.heading.5 markdownH5
highlight! link @markup.heading.6 markdownH6
highlight! link @string.special.vimdoc SpecialChar
highlight @variable.parameter.vimdoc guifg=#9c540f
highlight MiniAnimateCursor gui=reverse,nocombine
highlight! link MiniAnimateNormalFloat NormalFloat
highlight! link MiniClueBorder NormalFloat
highlight! link MiniClueDescGroup DiagnosticFloatingWarn
highlight! link MiniClueDescSingle NormalFloat
highlight! link MiniClueNextKey DiagnosticFloatingHint
highlight! link MiniClueNextKeyWithPostkeys DiagnosticFloatingError
highlight! link MiniClueSeparator DiagnosticFloatingInfo
highlight MiniClueTitle gui=bold guifg=#1f6688 guibg=#f1f1f1
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
highlight MiniDiffSignAdd guifg=#4d6a24 guibg=#f1f1f1
highlight MiniDiffSignChange guifg=#7b426f guibg=#f1f1f1
highlight MiniDiffSignDelete guifg=#a02b28 guibg=#f1f1f1
highlight! link MiniDiffOverAdd DiffAdd
highlight! link MiniDiffOverChange DiffText
highlight! link MiniDiffOverChangeBuf MiniDiffOverChange
highlight! link MiniDiffOverContext DiffChange

highlight! link MiniDiffOverDelete DiffDelete
highlight MiniHipatternsFixme gui=bold guifg=#101010 guibg=#ab4642
highlight MiniHipatternsHack gui=bold guifg=#101010 guibg=#ba8baf
highlight MiniHipatternsNote gui=bold guifg=#101010 guibg=#7cafc2
highlight MiniHipatternsTodo gui=bold guifg=#101010 guibg=#86c1b9
highlight MiniIndentscopeSymbol guifg=#77462a
highlight MiniIndentscopeSymbolOff guifg=#a02b28
highlight! link MiniJump SpellRare
highlight! link MiniJump2dDim Comment
highlight MiniJump2dSpot gui=bold,nocombine guifg=#181818 guibg=#f1f1f1
highlight MiniJump2dSpotAhead gui=nocombine guifg=#2b2b2b guibg=#ffffff
highlight! link MiniJump2dSpotUnique MiniJump2dSpot
highlight MiniMapNormal guifg=#383838 guibg=#f1f1f1
highlight MiniMapSymbolCount guifg=#2b6d63
highlight MiniMapSymbolLine guifg=#1f6688
highlight MiniMapSymbolView guifg=#77462a
highlight! link MiniNotifyBorder NormalFloat
highlight! link MiniNotifyLspProgress MiniNotifyNormal
highlight! link MiniNotifyNormal NormalFloat
highlight! link MiniNotifyTitle FloatTitle
highlight! link MiniOperatorsExchangeFrom IncSearch
highlight! link MiniPickBorder NormalFloat
highlight MiniPickBorderBusy guifg=#7b426f guibg=#f1f1f1
highlight MiniPickBorderText gui=bold guifg=#1f6688 guibg=#f1f1f1
highlight MiniPickCursor gui=nocombine blend=100
highlight! link MiniPickIconDirectory Directory
highlight MiniPickIconFile guifg=#383838
highlight! link MiniPickHeader DiagnosticFloatingHint
highlight MiniPickMatchCurrent guibg=#e0e0e0
highlight MiniPickMatchMarked guibg=#8c8c8c
highlight! link MiniPickMatchRanges DiagnosticFloatingHint
highlight! link MiniPickNormal NormalFloat
highlight MiniPickPreviewLine guibg=#e0e0e0
highlight! link MiniPickPreviewRegion IncSearch
highlight! link MiniPickPrompt MiniPickMatchRanges
highlight MiniPickPromptCaret guifg=#4d6a24 guibg=#f1f1f1
highlight MiniPickPromptPrefix guifg=#4d6a24 guibg=#f1f1f1

highlight MiniStarterFooter guifg=#1f6688
highlight MiniStarterHeader guifg=#1f6688
highlight! link MiniStarterInactive Comment
highlight MiniStarterItem guifg=#383838
highlight MiniStarterItemBullet guifg=#77462a
highlight MiniStarterItemPrefix gui=bold guifg=#a02b28
highlight MiniStarterSection guifg=#77462a
highlight MiniStarterQuery gui=bold guifg=#4d6a24
highlight MiniStatuslineDevinfo guifg=#5c5c5c guibg=#e0e0e0
highlight! link MiniStatuslineFileinfo MiniStatuslineDevinfo
highlight MiniStatuslineFilename guifg=#8c8c8c guibg=#f1f1f1
highlight! link MiniStatuslineInactive StatusLineNC
highlight MiniStatuslineModeCommand gui=bold guifg=#101010 guibg=#ab4642
highlight MiniStatuslineModeInsert gui=bold guifg=#101010 guibg=#7cafc2
highlight MiniStatuslineModeNormal gui=bold guifg=#ffffff guibg=#383838
highlight MiniStatuslineModeOther gui=bold guifg=#ffffff guibg=#8c8c8c
highlight MiniStatuslineModeReplace gui=bold guifg=#101010 guibg=#ba8baf
highlight MiniStatuslineModeVisual gui=bold guifg=#101010 guibg=#a1b56c
highlight MiniTestEmphasis gui=bold
highlight MiniTestFail gui=bold guifg=#a02b28
highlight MiniTestPass gui=bold guifg=#4d6a24
highlight! link MiniTrailspace Error
highlight BufferLineBuffer guifg=#5c5c5c
highlight BufferLineBufferSelected gui=bold guifg=#383838
highlight BufferLineBufferVisible guifg=#383838
highlight! link BufferLineCloseButton BufferLineBackground

highlight! link BufferLineCloseButtonSelected BufferLineBufferSelected
highlight! link BufferLineCloseButtonVisible BufferLineBufferVisible
highlight! link BufferLineFill Normal
highlight BufferLineTab guifg=#101010 guibg=#f7ca88
highlight BufferLineTabSelected gui=bold guifg=#101010 guibg=#f7ca88
highlight HydraRed guifg=#a02b28
highlight HydraBlue guifg=#1f6688
highlight HydraAmaranth guifg=#7b426f
highlight HydraTeal guifg=#4d6a24
highlight HydraPink guifg=#9c540f
highlight! link HydraHint NormalFloat
highlight Beacon guibg=#181818
highlight LazyButton guibg=#f1f1f1
highlight LazyButtonActive guibg=#e0e0e0
highlight! link LazyDimmed Comment
highlight LazyH1 gui=bold guibg=#e0e0e0
highlight NoiceCmdlinePopupBorder guifg=#1f6688
highlight NoiceConfirmBorder guifg=#7b426f
highlight TroubleCount gui=bold guifg=#4d6a24
highlight TroubleFoldIcon guifg=#383838
highlight TroubleIndent guifg=#e0e0e0
highlight TroubleLocation guifg=#5c5c5c
highlight! link TroubleSignError DiagnosticError
highlight! link TroubleSignHint DiagnosticHint
highlight! link TroubleSignInformation DiagnosticInfo
highlight! link TroubleSignOther DiagnosticInfo
highlight! link TroubleSignWarning DiagnosticWarn
highlight TroubleText guifg=#383838
highlight! link TroubleTextError TroubleText
highlight! link TroubleTextHint TroubleText
highlight! link TroubleTextInformation TroubleText
highlight! link TroubleTextWarning TroubleText
highlight WhichKey guifg=#1f6688
highlight WhichKeyDesc guifg=#383838
highlight WhichKeyFloat guifg=#383838 guibg=#f1f1f1
highlight WhichKeyGroup guifg=#7b426f
highlight WhichKeySeparator guifg=#4d6a24 guibg=#f1f1f1
highlight WhichKeyValue guifg=#8c8c8c
highlight LeapMatch gui=bold,underline,nocombine guifg=#7b426f
highlight LeapLabel gui=bold,nocombine guifg=#a02b28
highlight LeapLabelSelected gui=bold,nocombine guifg=#9c540f
highlight! link LeapBackdrop Comment
highlight LightspeedLabel gui=bold,underline guifg=#7b426f
highlight LightspeedLabelDistant gui=bold,underline guifg=#1f6688
highlight LightspeedShortcut gui=bold guifg=#181818
highlight LightspeedMaskedChar guifg=#5c5c5c
highlight LightspeedUnlabeledMatch gui=bold guifg=#383838
highlight! link LightspeedGreyWash Comment
highlight! link LightspeedUniqueChar LightspeedUnlabeledMatch
highlight! link LightspeedOneCharMatch LightspeedShortcut
highlight! link LightspeedPendingOpArea IncSearch
highlight! link LightspeedCursor Cursor
highlight! link DashboardCenter Delimiter
highlight! link DashboardFooter Title
highlight! link DashboardHeader Title
highlight! link DashboardShortCut WarningMsg
highlight LspSagaCodeActionBorder guifg=#77462a
highlight LspSagaCodeActionContent guifg=#383838
highlight LspSagaCodeActionTitle gui=bold guifg=#1f6688
highlight Definitions guifg=#4d6a24
highlight DefinitionsIcon guifg=#1f6688
highlight FinderParam guifg=#a02b28
highlight FinderVirtText guifg=#9c540f
highlight LspSagaAutoPreview guifg=#77462a
highlight LspSagaFinderSelection guifg=#836614
highlight LspSagaLspFinderBorder guifg=#77462a
highlight References guifg=#4d6a24
highlight ReferencesIcon guifg=#1f6688
highlight TargetFileName guifg=#383838
highlight FinderSpinner guifg=#4d6a24
highlight FinderSpinnerBorder guifg=#77462a
highlight! link FinderSpinnerTitle Title
highlight LspSagaDefPreviewBorder guifg=#77462a
highlight LspSagaHoverBorder guifg=#77462a
highlight LspSagaRenameBorder guifg=#77462a
highlight LspSagaDiagnosticBorder guifg=#77462a
highlight! link LspSagaDiagnosticHeader Title
highlight LspSagaDiagnosticSource guifg=#7b426f
highlight! link LspSagaBorderTitle Title
highlight LspSagaSignatureHelpBorder guifg=#77462a
highlight LSOutlinePreviewBorder guifg=#77462a
highlight OutlineDetail guifg=#8c8c8c
highlight OutlineFoldPrefix guifg=#a02b28
highlight OutlineIndentEvn guifg=#5c5c5c
highlight OutlineIndentOdd guifg=#383838
highlight RainbowDelimiterBlue guifg=#1f6688
highlight RainbowDelimiterCyan guifg=#2b6d63
highlight RainbowDelimiterGreen guifg=#4d6a24
highlight RainbowDelimiterOrange guifg=#9c540f
highlight RainbowDelimiterRed guifg=#a02b28
highlight RainbowDelimiterViolet guifg=#7b426f
highlight RainbowDelimiterYellow guifg=#836614
highlight CmpItemAbbr guifg=#383838
highlight CmpItemAbbrDeprecated guifg=#8c8c8c
highlight CmpItemAbbrMatch gui=bold guifg=#836614
highlight CmpItemAbbrMatchFuzzy gui=bold guifg=#836614
highlight CmpItemKind guifg=#77462a guibg=#f1f1f1
highlight CmpItemMenu guifg=#383838 guibg=#f1f1f1
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
highlight Sneak guifg=#101010 guibg=#ba8baf
highlight SneakScope guifg=#ffffff guibg=#181818
highlight SneakLabel gui=bold guifg=#101010 guibg=#ba8baf
highlight! link BqfPreviewFloat NormalFloat
highlight BqfPreviewTitle guifg=#1f6688 guibg=#f1f1f1
highlight BqfSign guifg=#2b6d63 guibg=#f1f1f1
highlight GitSignsAdd guifg=#4d6a24 guibg=#f1f1f1
highlight! link GitSignsAddLn GitSignsAdd
highlight! link GitSignsAddInline GitSignsAdd
highlight GitSignsChange guifg=#7b426f guibg=#f1f1f1
highlight! link GitSignsChangeLn GitSignsChange
highlight! link GitSignsChangeInline GitSignsChange
highlight GitSignsDelete guifg=#a02b28 guibg=#f1f1f1
highlight! link GitSignsDeleteLn GitSignsDelete
highlight! link GitSignsDeleteInline GitSignsDelete
highlight GitSignsUntracked guifg=#1f6688 guibg=#f1f1f1
highlight! link GitSignsUntrackedLn GitSignsUntracked
highlight! link GitSignsUntrackedInline GitSignsUntracked
highlight IndentBlanklineChar gui=nocombine guifg=#e0e0e0
highlight IndentBlanklineContextChar gui=nocombine guifg=#77462a
highlight IndentBlanklineContextStart gui=underline,nocombine guisp=#77462a
highlight IndentBlanklineIndent1 gui=nocombine guifg=#a02b28
highlight IndentBlanklineIndent2 gui=nocombine guifg=#9c540f
highlight IndentBlanklineIndent3 gui=nocombine guifg=#836614
highlight IndentBlanklineIndent4 gui=nocombine guifg=#4d6a24
highlight IndentBlanklineIndent5 gui=nocombine guifg=#2b6d63
highlight IndentBlanklineIndent6 gui=nocombine guifg=#1f6688
highlight IndentBlanklineIndent7 gui=nocombine guifg=#7b426f
highlight IndentBlanklineIndent8 gui=nocombine guifg=#77462a
highlight RenderMarkdownBullet guifg=#7b426f
highlight! link RenderMarkdownChecked DiagnosticOk
highlight RenderMarkdownCode guibg=#f1f1f1

highlight RenderMarkdownDash guifg=#7b426f
highlight RenderMarkdownH1 guifg=#9c540f
highlight RenderMarkdownH1Bg guibg=#f1f1f1
highlight RenderMarkdownH2 guifg=#836614
highlight RenderMarkdownH2Bg guibg=#f1f1f1
highlight RenderMarkdownH3 guifg=#4d6a24
highlight RenderMarkdownH3Bg guibg=#f1f1f1
highlight RenderMarkdownH4 guifg=#2b6d63
highlight RenderMarkdownH4Bg guibg=#f1f1f1
highlight RenderMarkdownH5 guifg=#1f6688
highlight RenderMarkdownH5Bg guibg=#f1f1f1
highlight RenderMarkdownH6 guifg=#77462a
highlight RenderMarkdownH6Bg guibg=#f1f1f1
highlight! link RenderMarkdownTodo Todo
highlight! link RenderMarkdownUnchecked DiagnosticWarn
highlight! link CocCodeLens LspCodeLens
highlight! link CocDisabled Comment
highlight! link CocFadeOut Comment
highlight CocMarkdownLink guifg=#77462a
highlight CocMenuSel guibg=#e0e0e0
highlight! link CocNotificationProgress CocMarkdownLink
highlight! link CocPumVirtualText CocMarkdownLink
highlight CocSearch guifg=#836614
highlight CocSelectedText guifg=#a02b28
highlight! link NeogitCommitViewHeader Special
highlight! link NeogitDiffAddHighlight DiffAdd
highlight! link NeogitDiffAdd DiffAdd
highlight! link NeogitDiffDeleteHighlight DiffDelete
highlight! link NeogitDiffDelete DiffDelete
highlight! link NeogitFold FoldColumn
highlight NeogitHunkHeader guifg=#1f6688
highlight NeogitHunkHeaderHighlight gui=bold guifg=#1f6688
highlight! link NeogitNotificationError DiagnosticError
highlight! link NeogitNotificationInfo DiagnosticInfo
highlight! link NeogitNotificationWarning DiagnosticWarn
highlight NeoTreeDimText guifg=#8c8c8c
highlight NeoTreeDotfile guifg=#5c5c5c
highlight! link NeoTreeFadeText1 NeoTreeDimText
highlight NeoTreeFadeText2 guifg=#e0e0e0
highlight NeoTreeGitAdded guifg=#4d6a24
highlight NeoTreeGitConflict gui=bold guifg=#a02b28
highlight NeoTreeGitDeleted guifg=#a02b28
highlight NeoTreeGitModified guifg=#7b426f
highlight NeoTreeGitUnstaged guifg=#a02b28
highlight NeoTreeGitUntracked guifg=#836614
highlight NeoTreeMessage guifg=#383838 guibg=#f1f1f1
highlight NeoTreeModified guifg=#181818
highlight NeoTreeRootName gui=bold guifg=#1f6688
highlight NeoTreeTabInactive guifg=#5c5c5c
highlight NeoTreeTabSeparatorActive guifg=#8c8c8c guibg=#e0e0e0
highlight NeoTreeTabSeparatorInactive guifg=#f1f1f1 guibg=#f1f1f1
highlight TelescopeBorder guifg=#77462a
highlight TelescopeMatching guifg=#836614
highlight TelescopeMultiSelection gui=bold guibg=#f1f1f1
highlight TelescopeSelection gui=bold guibg=#f1f1f1
highlight NvimTreeExecFile gui=bold guifg=#4d6a24
highlight NvimTreeFolderIcon guifg=#8c8c8c
highlight NvimTreeGitDeleted guifg=#a02b28
highlight NvimTreeGitDirty guifg=#a02b28
highlight NvimTreeGitMerge guifg=#2b6d63
highlight NvimTreeGitNew guifg=#836614
highlight NvimTreeGitRenamed guifg=#7b426f
highlight NvimTreeGitStaged guifg=#4d6a24
highlight NvimTreeImageFile gui=bold guifg=#7b426f
highlight! link NvimTreeIndentMarker NvimTreeFolderIcon
highlight! link NvimTreeOpenedFile NvimTreeExecFile
highlight! link NvimTreeRootFolder NvimTreeGitRenamed
highlight NvimTreeSpecialFile gui=bold,underline guifg=#1f6688
highlight NvimTreeSymlink gui=bold guifg=#77462a
highlight NvimTreeWindowPicker gui=bold guifg=#383838 guibg=#f1f1f1
highlight! link HelpviewHeading1 markdownH1
highlight! link HelpviewHeading2 markdownH2
highlight! link HelpviewHeading3 markdownH3
highlight! link HelpviewHeading4 markdownH4
highlight HelpviewMentionlink gui=underline
highlight HelpviewOptionlink gui=underline guifg=#1f6688
highlight HelpviewTaglink gui=bold guifg=#836614
highlight! link HelpviewTitle Title
highlight MarkviewPalette0 guifg=#7b426f guibg=#ffffff
highlight MarkviewPalette0Fg guifg=#7b426f
highlight MarkviewPalette0Bg guibg=#ffffff
highlight MarkviewPalette0Sign guifg=#7b426f
highlight MarkviewPalette1 guifg=#a02b28 guibg=#ffffff
highlight MarkviewPalette1Fg guifg=#a02b28
highlight MarkviewPalette1Bg guibg=#ffffff
highlight MarkviewPalette1Sign guifg=#a02b28
highlight MarkviewPalette2 guifg=#9c540f guibg=#ffffff
highlight MarkviewPalette2Fg guifg=#9c540f
highlight MarkviewPalette2Bg guibg=#ffffff
highlight MarkviewPalette2Sign guifg=#9c540f
highlight MarkviewPalette3 guifg=#836614 guibg=#ffffff
highlight MarkviewPalette3Fg guifg=#836614
highlight MarkviewPalette3Bg guibg=#ffffff
highlight MarkviewPalette3Sign guifg=#836614
highlight MarkviewPalette4 guifg=#4d6a24 guibg=#ffffff
highlight MarkviewPalette4Fg guifg=#4d6a24
highlight MarkviewPalette4Bg guibg=#ffffff
highlight MarkviewPalette4Sign guifg=#4d6a24
highlight MarkviewPalette5 guifg=#2b6d63 guibg=#ffffff
highlight MarkviewPalette5Fg guifg=#2b6d63
highlight MarkviewPalette5Bg guibg=#ffffff
highlight MarkviewPalette5Sign guifg=#2b6d63
highlight MarkviewPalette6 guifg=#1f6688 guibg=#ffffff
highlight MarkviewPalette6Fg guifg=#1f6688
highlight MarkviewPalette6Bg guibg=#ffffff
highlight MarkviewPalette6Sign guifg=#1f6688
highlight MarkviewPalette7 guifg=#77462a guibg=#ffffff
highlight MarkviewPalette7Fg guifg=#77462a
highlight MarkviewPalette7Bg guibg=#ffffff
highlight MarkviewPalette7Sign guifg=#77462a
highlight HopNextKey gui=bold,nocombine guifg=#7b426f
highlight HopNextKey1 gui=bold,nocombine guifg=#a02b28
highlight HopNextKey2 gui=bold,nocombine guifg=#5c5c5c
highlight HopPreview gui=bold,nocombine guifg=#9c540f
highlight! link HopUnmatched Comment
highlight! link DapUIScope Title
highlight! link DapUIType Type
highlight DapUIModifiedValue gui=bold guifg=#7b426f
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
highlight DapUIBreakpointsCurrentLine gui=bold guifg=#4d6a24
highlight! link DapUIBreakpointsDisabledLine Comment
highlight NotifyDEBUGBorder guifg=#8c8c8c
highlight! link NotifyDEBUGIcon NotifyDEBUGBorder
highlight! link NotifyDEBUGTitle NotifyDEBUGBorder
highlight NotifyERRORBorder guifg=#a02b28
highlight! link NotifyERRORIcon NotifyERRORBorder
highlight! link NotifyERRORTitle NotifyERRORBorder
highlight NotifyINFOBorder guifg=#2b6d63
highlight! link NotifyINFOIcon NotifyINFOBorder
highlight! link NotifyINFOTitle NotifyINFOBorder
highlight NotifyTRACEBorder guifg=#1f6688
highlight! link NotifyTRACEIcon NotifyTRACEBorder
highlight! link NotifyTRACETitle NotifyTRACEBorder
highlight NotifyWARNBorder guifg=#7b426f
highlight! link NotifyWARNIcon NotifyWARNBorder
highlight! link NotifyWARNTitle NotifyWARNBorder
highlight PounceMatch gui=bold,nocombine guifg=#ffffff guibg=#383838
highlight PounceGap gui=bold,nocombine guifg=#ffffff guibg=#8c8c8c
highlight PounceAccept gui=bold,nocombine guifg=#101010 guibg=#ab4642
highlight PounceAcceptBest gui=bold,nocombine guifg=#101010 guibg=#a1b56c
highlight BufferCurrent gui=bold guifg=#383838 guibg=#e0e0e0
highlight BufferCurrentIcon guibg=#e0e0e0
highlight! link BufferCurrentIndex BufferCurrentIcon
highlight BufferCurrentMod gui=bold guifg=#a02b28 guibg=#e0e0e0
highlight! link BufferCurrentSign BufferCurrent
highlight BufferCurrentTarget gui=bold guifg=#7b426f guibg=#e0e0e0
highlight BufferInactive guifg=#5c5c5c guibg=#f1f1f1
highlight BufferInactiveIcon guibg=#f1f1f1
highlight! link BufferInactiveIndex BufferInactiveIcon
highlight BufferInactiveMod guifg=#a02b28 guibg=#f1f1f1
highlight! link BufferInactiveSign BufferInactive
highlight BufferInactiveTarget gui=bold guifg=#7b426f guibg=#f1f1f1
highlight! link BufferOffset Normal
highlight BufferTabpages gui=bold guifg=#202020 guibg=#f7ca88
highlight! link BufferTabpageFill Normal
highlight BufferVisible gui=bold guifg=#383838 guibg=#f1f1f1
highlight BufferVisibleIcon guibg=#f1f1f1
highlight! link BufferVisibleIndex BufferVisibleIcon
highlight BufferVisibleMod gui=bold guifg=#a02b28 guibg=#f1f1f1
highlight! link BufferVisibleSign BufferVisible
highlight BufferVisibleTarget gui=bold guifg=#7b426f guibg=#f1f1f1
highlight MasonError guifg=#a02b28
highlight MasonHeader gui=bold guifg=#101010 guibg=#7cafc2
highlight MasonHeaderSecondary gui=bold guifg=#101010 guibg=#a16946
highlight! link MasonHeading Bold
highlight MasonHighlight guifg=#77462a
highlight MasonHighlightBlock guifg=#101010 guibg=#a16946
highlight! link MasonHighlightBlockBold MasonHeaderSecondary
highlight! link MasonHighlightBlockBoldSecondary MasonHeader
highlight MasonHighlightBlockSecondary guifg=#101010 guibg=#7cafc2
highlight MasonHighlightSecondary guifg=#1f6688
highlight! link MasonLink MasonHighlight
highlight! link MasonMuted Comment
highlight MasonMutedBlock guifg=#ffffff guibg=#8c8c8c
highlight MasonMutedBlockBold gui=bold guifg=#ffffff guibg=#8c8c8c
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

