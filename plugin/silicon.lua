vim.pack.add({ "https://github.com/michaelrommel/nvim-silicon" })

local silicon = require("nvim-silicon")
local function get_hl_color(group, attr)
    local hl = vim.api.nvim_get_hl(0, { name = group })

    local color = hl[attr]
    if not color then
        return nil
    end

    return string.format("#%06x", color)
end
silicon.setup({
	-- disable_defaults will disable all builtin default settings apart
	-- from the base arguments, that are needed to call silicon at all, see
	-- mandatory_options below, also those options can be overridden
	-- all of the settings could be overridden in the lua setup call,
	-- but this clashes with the use of an external silicon --config=file,
	-- see issue #9
	disable_defaults = false,
	-- turn on debug messages
	debug = false,
	-- most of them could be overridden with other
	-- the font settings with size and fallback font
	-- Example: font = "VictorMono NF=34;Noto Emoji",
	font = "JetBrainsMono Nerd Font",
	-- the theme to use, depends on themes available to silicon
	theme = "gruvbox-dark",
	-- the background color outside the rendered os window
	-- (in hexcode string e.g "#076678")
	background = get_hl_color("Cursor","bg"),
	-- a path to a background image
	background_image = nil,
	-- the paddings to either side
	pad_horiz = 10,
	pad_vert = 10,
	-- whether to have the os window rendered with rounded corners
	no_round_corner = true,
	-- whether to put the close, minimize, maximise traffic light
	-- controls on the border
	no_window_controls = false,
	-- whether to turn off the line numbers
	no_line_number = false,
	-- with which number the line numbering shall start
	-- line_offset = 1,
	-- here a function is used to return the actual source code line number
	line_offset = function(args)
	    return args.line1
	end,

	-- the distance between lines of code
	line_pad = 0,
	-- the rendering of tab characters as so many space characters
	tab_width = 4,
	-- with which language the syntax highlighting shall be done, should be
	-- a function that returns either a language name or an extension like "js"
	-- it is set to nil, so you can override it, if you do not set it, we try the
	-- filetype first, and if that fails, the extension
	-- language = nil,
	language = function()
		return vim.bo.filetype
	end,

	-- if the shadow below the os window should have be blurred
	shadow_blur_radius = 16,
	-- the offset of the shadow in x and y directions
	shadow_offset_x = 4,
	shadow_offset_y = 4,
	-- the color of the shadow (in hexcode string e.g "#100808")
	shadow_color = nil,
	-- whether to strip of superfluous leading whitespace
	gobble = true,

	num_separator = "\u{258f} ",

	to_clipboard = true,
	window_title = function()
	    return vim.fn.fnamemodify(
	        vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()),
	        ":t"
	    )
	end,
	command = "silicon",
	-- a string or function that defines the path to the output image
	output = function()
		local pictures = vim.fn.systemlist("xdg-user-dir PICTURES")[1]
		local dir = pictures .. "/Screenshots"

		-- Create directory if it doesn't exist
		vim.fn.mkdir(dir, "p")

		local filetype = vim.bo.filetype
		if filetype == "" then
			filetype = "text"
		end

		local timestamp = os.date("%Y-%m-%d_%H-%M-%S")

		return string.format("%s/%s_%s.png", dir, timestamp, filetype)
	end,
	-- here a function is used to create a file in the current directory
	-- output = function()
	-- 	return "./" .. os.date("!%Y-%m-%dT%H-%M-%SZ") .. "_code.png"
	-- end,
})

vim.keymap.set("v", "<leader>cs", function()
	silicon.clip()
end)

vim.keymap.set("v", "<leader>cS", function()
	silicon.shoot()
end)
