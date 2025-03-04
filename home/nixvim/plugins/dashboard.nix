{
	programs.nixvim.plugins.dashboard = {
		enable = true;
		settings = {
			theme = "hyper";
			change_to_vcs_root = true;
			hide = {
				statusline = true;
				tabline = true;
			};
			config = {
				mru.limit = 5;
				project.enable = false;
				footer = [
					""
					"Make cool shit"
				];
				header = [
					""
					""
					"███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗"
					"████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║"
					"██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║"
					"██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║"
					"██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║"
					"╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝"
					""
					""
				];
				shortcut = [
					{
						key = "f";
						icon = " ";
						desc = "Files";
						group = "Label";
						icon_hl = "@variable";
						action.__raw = "function(path) vim.cmd('Telescope find_files') end";
					}
				];
			};
		};
	};
}
