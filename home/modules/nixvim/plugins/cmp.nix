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
				"<Tab>".__raw = ''
					cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.mapping.select_next_item()
						elseif luasnip.locally_jumpable(1) then
							luasnip.jump(1)
						else
							fallback()
						end
					end, { "i", "s" }),
				'';
				"<S-Tab>".__raw = ''
					cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.mapping.select_prev_item()
						elseif luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				'';
				"<CR>".__raw = ''
					cmp.mapping(function(fallback)
						if cmp.visible() then
							if luasnip.expandable() then
								luasnip.expand()
							else
								cmp.confirm({
									select = true,
								})
							end
						else
							fallback()
						end
					end),
				'';
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
