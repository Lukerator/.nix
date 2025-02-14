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
			mapping = {
				"<Tab>" = "cmp.mapping.select_next_item()";
				"<S-Tab>" = "cmp.mapping.select_prev_item()";
				"<CR>" = "cmp.mapping.confirm { select = true }";
			};
			window = {
				documentation.border = [ "cmp.config.window.bordered()" ];
				completion.border = [ "cmp.config.window.bordered({ winhighlight = 'Normal:CmpPmenu,CursorLine:PmenuSel,Search:None' })" ];
			};
			sources = [
				{ name = "path"; }
				{ name = "buffer"; }
				{ name = "luasnip"; }
				{ name = "nvim_lsp"; }
			];
		};
	};
}
