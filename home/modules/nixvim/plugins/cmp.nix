{
	programs.nixvim.plugins.cmp = {
		enable = true;
		settings = {
			completion.completeopt = "menu,menuone,noinsert"; 
			snippet.expand = ''
				function(args)
					require('luasnip').lsp_expand(args.body)
				end
			'';
			window = {
				completion.border = "rounded";
				documentation.border = "rounded";
			};
			mapping = {
				"<Tab>" = "cmp.mapping.select_next_item()";
				"<S-Tab>" = "cmp.mapping.select_prev_item()";
				"<CR>" = "cmp.mapping.confirm { select = true }";
				"<C-left>" = "ls.jump(-1)";
				"<C-right>" = "ls.jump(1)";
			};
			sources = [
				{ name = "path"; }
				{ name = "buffer"; }
				{ name = "codeium"; }
				{ name = "luasnip"; }
				{ name = "nvim_lsp"; }
			];
		};
	};
}
