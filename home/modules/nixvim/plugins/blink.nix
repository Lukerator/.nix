{
	programs.nixvim.plugins.blink-cmp = {
		enable = true;
		settings = {
			keymap = {
				"<Tab>" = [ "select_next" ];
				"<S-Tab>" = [ "select_prev" ];
				"<Cr>" = [ "select_and_accept" ];
			};
			sources = {
				cmdline = [ ];
				providers = {
					lsp.fallbacks = [];
					path.fallbacks = [];
					snippets.fallbacks = [];
					buffer.score_offset = -7;
				};
			};
		};
	};
}
