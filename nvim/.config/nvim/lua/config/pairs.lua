-- auto-closing brackets and quotes, vscode-style ("autoCloseBefore"): a
-- closer is only inserted when the char right after the cursor is whitespace,
-- end of line, or one of ; : . , = ) ] } >. typing ( in front of `foo` gives
-- `(foo`, ready to wrap it, not `()foo`.
--
-- two things insert closers, and both follow the rule: mini.pairs (typing) and
-- blink.cmp (accepting a function completion).
local close_before = "[%s;:.,=%)%]%}>]"

-- ------------------------------------------------------------- mini.pairs ---
-- neigh_pattern is two chars, [before][after] the cursor. mini.pairs pads the
-- line with \r and \n, so %s in `close_before` also matches end of line.
-- <CR> between a pair opens an indented line; blink's "enter" preset falls
-- back to that <CR> when the completion menu is closed.
---@param pair string two chars, opener then closer
---@param before string? pattern for the char before the cursor
local function pair_spec(pair, before)
	local is_quote = pair:sub(1, 1) == pair:sub(2, 2)
	return {
		action = is_quote and "closeopen" or "open",
		pair = pair,
		neigh_pattern = (before or "[^\\]") .. close_before,
		register = { cr = not is_quote },
	}
end

require("mini.pairs").setup({
	mappings = {
		["("] = pair_spec("()"),
		["["] = pair_spec("[]"),
		["{"] = pair_spec("{}"),
		['"'] = pair_spec('""'),
		["'"] = pair_spec("''", "[^%a\\]"), -- not after a letter: don't, it's
		["`"] = pair_spec("``"),
	},
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	desc = "no auto-paired quotes in prose",
	callback = function(args)
		for _, quote in ipairs({ '"', "'" }) do
			vim.keymap.set("i", quote, quote, { buffer = args.buf })
		end
	end,
})

-- -------------------------------------------------------------- blink.cmp ---
-- accepting a function/method appends `()` (blink's auto_brackets) or expands
-- a call snippet from the server (`map(${1:fn})`). neither looks at what
-- follows the cursor, so completing `map` in front of `foo` left `map()foo`.
-- when the rule above says no closer, insert the bare name instead.
--
-- this wraps a blink internal (no public hook exists); the assert makes a
-- rename in a blink update fail loudly here instead of silently reverting.
local brackets = require("blink.cmp.completion.brackets")
local kinds = require("blink.cmp.types").CompletionItemKind
local add_brackets = assert(brackets.add_brackets, "blink.cmp: brackets.add_brackets moved")

---@diagnostic disable-next-line: duplicate-set-field
brackets.add_brackets = function(ctx, filetype, item)
	local text_edit = item.textEdit
	local col = text_edit.range["end"].character + 1
	local next_char = vim.api.nvim_get_current_line():sub(col, col)
	-- an opener already in front is blink's own case: it skips past it
	if next_char == "" or next_char == "(" or next_char:match(close_before) then
		return add_brackets(ctx, filetype, item)
	end

	-- server-side call snippet: keep just the name
	local is_callable = item.kind == kinds.Function or item.kind == kinds.Method
	local name = is_callable and text_edit.newText:match("^([^%(%s]+)%(")
	if name then
		text_edit.newText = name
		item.insertTextFormat = vim.lsp.protocol.InsertTextFormat.PlainText
	end
	return "skipped", text_edit, 0
end
