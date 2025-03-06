{
	programs.zsh = {
		enable = true;
		enableCompletion = true;
		autosuggestion.enable = false;
		syntaxHighlighting.enable = true;
		oh-my-zsh = {
			enable = true;
			theme = "robbyrussell";
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
		};
	};
}
