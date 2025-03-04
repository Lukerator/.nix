{ pkgs, ... }:
{
	programs.zsh = {
		enable = true; # Enables ZShell
		enableCompletion = true; # Enables completion
		autosuggestion.enable = false; # Disables suggestions
		syntaxHighlighting.enable = true; # Enables syntax highlighting
		oh-my-zsh = {
			enable = true; # Enables oh-my-zsh
			theme = "robbyrussell"; # Sets oh-my-zsh theme
		};
		shellAliases = {
			ls = "lsd";
			clear = "clear && printf '\E[H\E[3J' && clear";
			system-update-no-git = "nh os switch && nh clean all";
			home-update-no-git = "nh home switch -- --impure && nh clean all";
			update-no-git = "nh os switch && nh home switch -- --impure && nh clean all";
			upgrade-no-git = "nh os switch -u && nh home switch -- --impure && nh clean all";
			git-update = ''cd ~/.nix && git add --all && git push && git commit -a -m "update" && cd -'';
			update = "git-update && update-no-git";
			upgrade = "git-update && upgrade-no-git && git-update";
			home-update = "git-update && home-update-no-git";
			system-update = "git-update && system-update-no-git";
		}; # Sets aliases
		plugins = [
			{
				name = "zsh-nix-shell";
				file = "nix-shell.plugin.zsh";
				src = pkgs.fetchFromGitHub {
					owner = "chisui";
					repo = "zsh-nix-shell";
					rev = "v0.8.0";
					sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
				};
			}
			{
				name = "nix-zsh-completions";
				file = "nix-zsh-completions.plugin.zsh";
				src = pkgs.fetchFromGitHub {
					owner = "nix-community";
					repo = "nix-zsh-completions";
					rev = "v0.5.1";
				};
			}
		];
	};
}
