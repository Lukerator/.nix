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
				format_after_save = ''
					function(bufnr)
						if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
							return
					        end
						if not slow_format_filetypes[vim.bo[bufnr].filetype] then
							return
						end
						return { lsp_fallback = true }
					end
				'';
				format_on_save = ''
					function(bufnr)
						if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
							return
					        end
						if slow_format_filetypes[vim.bo[bufnr].filetype] then
							return
						end
						local function on_format(err)
							if err and err:match("timeout$") then
								slow_format_filetypes[vim.bo[bufnr].filetype] = true
							end
						end
						return { timeout_ms = 200, lsp_fallback = true }, on_format
					end
				'';
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
