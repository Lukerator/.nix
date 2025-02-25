{
	programs.nixvim.plugins.blink-cmp = {
		enable = true;
		settings = {
			signature.enabled = true;
			appearance = {
				nerd_font_variant = "normal";
				use_nvim_cmp_as_default = false;
			};
			completion = {
				documentation.auto_show = true;
				accept.auto_brackets = {
					enabled = true;
					semantic_token_resolution.enabled = false;
				};
			};
			sources = {
				cmdline = [ ];
				providers = {
					lsp = [ ];
					path = [ ];
					buffer = [ ];
					luasnip = [ ];
					codeium = [ ];
				};
			};
			keymap = {
				"<S-Tab>" = [
					"select_prev"
					"fallback"
				];
				"<Tab>" = [
					"select_next"
					"fallback"
				];
				"<CR>" = [
					"select_and_accept"
					"fallback"
				];
				"<S-left>" = [
					"snippet_backward"
					"fallback"
				];
				"<S-right>" = [
					"snippet_forward"
					"fallback"
				];
			};
		};
	};
}
