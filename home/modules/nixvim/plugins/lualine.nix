{
	programs.nixvim.plugins.lualine = {
		enable = true;
		settings.sections = {
			lualine_a = [ "mode" ];
			lualine_b = [ "filename" ];
			lualine_c = [ "progress" ];
			lualine_y = [{
				__raw = ''
					function()
						return tostring(vim.fn.wordcount().words)
					end
				'';
			}];
			lualine_z = [ "location" ];
		};
	};
}
