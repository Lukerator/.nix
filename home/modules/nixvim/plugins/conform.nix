{ pkgs, ... }:
{
	programs.nixvim = {
		extraPackages = with pkgs; [
			black
			clang-tools
			nixfmt
			stylua
			typstfmt
		];
		plugins.conform-nvim = {
			enable = true;
			settings = {
				notify_on_error = false;
				formatters_by_ft = {
					lua = [ "stylua" ];
					nix = [ "nixfmt" ];
					python = [ "black" ];
					typst = [ "typstfmt" ];
					cpp = [ "clang_format" ];
				};
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
