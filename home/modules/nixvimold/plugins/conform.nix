{ pkgs, ... }:
{
	programs.nixvim = {
		extraPackages = with pkgs; [
			clang-tools
		];
		plugins.conform-nvim = {
			enable = true;
			settings = {
				notify_on_error = false;
				formatters_by_ft.cpp = [ "clang_format" ];
			};
		};
		keymaps = [
			{
				mode = "";
				key = "<leader>f";
				action.__raw = ''
					function()
						require('conform').format { async = true, lsp_fallback = true }
					end
				'';
				options = {
					desc = "[F]ormat buffer";
				};
			}
		];
	};
}
