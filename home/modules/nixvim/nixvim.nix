{
	programs.nixvim = {
		enable = true;
		defaultEditor = true;
		colorschemes.catppuccin = {
			enable = true;
			settings.flavor = "mocha";
		};
		globals = {
			mapleader = " ";
			maplocalleader = " ";
			have_nerd_font = true;
		};
		keymaps = [
			{
				mode = "n";
				key = "<Esc>";
				action = "<cmd>nohlsearch<CR>";
				options.desc = "Clear search highlighting";
			}
		];
		opts = {
			mouse = "a";
			list = true;
			number = true;
			scrolloff = 10;
			hlsearch = true;
			undofile = true;
			showmode = false;
			smartcase = true;
			updatetime = 250;
			timeoutlen = 300;
			cursorline = true;
			splitbelow = true;
			splitright = true;
			ignorecase = true;
			breakindent = true;
			relativenumber = true;
			listchars.__raw = ''{ tab = "» ", trail = "·", nbsp = "␣" , eol = "↩" }'';
			clipboard = {
				register = "unnamedplus";
				providers.wl-copy.enabled = true;
			};
		};
	};
}
