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
			git-update = ''cd ~/.nix && git commit -a -m "update" && clear && echo "Don't forget to git add" && cd -'';
			system-update = "system-update-no-git && git-update";
			home-update = "home-update-no-git && git-update";
			update = "update-no-git && git-update";
			upgrade = "upgrade-no-git && git-update";
		}; # Sets aliases
	};
}
