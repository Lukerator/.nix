{ pkgs, ... }:
{
	programs.nixvim = {
		extraPackages = with pkgs; [
			black
			clang-tools
			nixfmt-rfc-style
			stylua
			typstfmt
		];
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
		plugins.conform-nvim = {
			enable = true;
			settings = {
				notify_on_error = false;
				formatters_by_ft = {
					lua = [ "stylua" ];
					nix = [ "nixfmt-rfc-style" ];
					python = [ "black" ];
					typst = [ "typstfmt" ];
					cpp = [ "clang_format" ];
				};
			};
		};
	};
}
