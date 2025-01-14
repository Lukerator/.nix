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
			system-update = "nh os switch && nh clean all";
			clear = "clear && printf '\E[H\E[3J' && clear";
			home-update = "nh home switch -- --impure && nh clean all";
			update = "nh os switch && nh home switch -- --impure && nh clean all";
			upgrade = "nh os switch -u && nh home switch -- --impure && nh clean all";
		}; # Sets aliases
	};
}
