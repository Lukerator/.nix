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
					nix = [ "nixfmt" ];
					lua = [ "stylua" ];
					python = [ "black" ];
					typst = [ "typstfmt" ];
					cpp = [ "clang-format" ];
				};
			};
		};
		keymaps = [
			{
				mode = "";
				key = "<leader>f";
				options.desc = "Format buffer";
				action.__raw = ''
					function()
						require("conform").format { async = true, lsp_fallback = true }
					end
				'';
			}
		];
	};
}
