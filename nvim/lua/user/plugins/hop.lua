return {
	"phaazon/hop.nvim",
	keys = {
		{ "s", "<cmd>HopChar1<cr>", desc = "Hop Char 1" },
		{ "S", "<cmd>HopWord<cr>", desc = "Hop Word" },
		{ "x", "<cmd>HopChar1<cr>", desc = "Hop Char 1", mode = { "x", "o" } },
		{ "X", "<cmd>HopWord<cr>", desc = "Hop Word", mode = { "x", "o" } },
		{
			"f",
			function()
				require("hop").hint_char1({
					direction = require("hop.hint").HintDirection.AFTER_CURSOR,
					current_line_only = true,
				})
			end,
			mode = { "n", "x", "o" },
		},
		{
			"F",
			function()
				require("hop").hint_char1({
					direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
					current_line_only = true,
				})
			end,
			mode = { "n", "x", "o" },
		},
		{
			"t",
			function()
				require("hop").hint_char1({
					direction = require("hop.hint").HintDirection.AFTER_CURSOR,
					current_line_only = true,
					hint_offset = -1,
				})
			end,
			mode = { "n", "x", "o" },
		},
		{
			"T",
			function()
				require("hop").hint_char1({
					direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
					current_line_only = true,
					hint_offset = -1,
				})
			end,
			mode = { "n", "x", "o" },
		},
	},
	opts = {
		keys = "etovxqpdygfblzhckisuran",
	},
}
