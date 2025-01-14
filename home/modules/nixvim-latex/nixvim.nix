{
	programs.nixvim = {
		enable = true; # Enable NixVim program
		defaultEditor = true; # Set NixVim as the default editor
		colorschemes = {
			catppuccin = {
				enable = true; # Enable Catppuccin colorscheme
				settings.flavour = "mocha"; # Set Catppuccin flavor
			};
			/*gruvbox = {
				enable = true; # Enable Gruvbox colorscheme
				package = pkgs.vimPlugins.gruvbox-material-nvim; # Use Gruvbox material plugin
			};*/
		};
		globals = {
			mapleader = " "; # Set leader key to space
			maplocalleader = " "; # Set local leader key to space
			have_nerd_font = true; # Indicate that Nerd Font is available
		};
		keymaps = [
			{
				mode = "n"; # Normal mode
				key = "<Esc>"; # Escape key
				action = "<cmd>nohlsearch<CR>"; # Clear search highlights
				options.desc = "No highlights in search"; # Title in Which-Key
			}
		];
		opts = {
			mouse = "a"; # Enable mouse support in all modes
			list = true; # Enable display of list characters
			scrolloff = 3; # Minimum lines to keep above and below the cursor
			number = true; # Show line numbers
			hlsearch = true; # Highlight search matches
			showmode = true; # Do not show mode in command line
			undofile = true; # Enable persistent undo
			smartcase = true; # Enable smart case search
			updatetime = 250; # Set update time in milliseconds
			timeoutlen = 400; # Set timeout length in milliseconds
			cursorline = true; # Highlight the current line
			splitbelow = true; # Enables horizontal splits below current window
			splitright = true; # Enables vertical splits to the right of the current window
			ignorecase = true; # Ignore case in search patterns
			breakindent = true; # Enable break indent
			cursorcolumn = true; # Highlight the current column
			inccommand = "split"; # Show the effects of a command incrementally in a split window
			relativenumber = true; # Show relative line numbers
			listchars.__raw = "{ tab = '» ', trail = '·' }"; # Define list characters for tabs and trailing spaces
			clipboard = {
				register = "unnamedplus"; # Use the '+' register for clipboard
				providers.wl-copy.enable = true; # Enable wl-copy clipboard provider
			};
		};
	};
}

