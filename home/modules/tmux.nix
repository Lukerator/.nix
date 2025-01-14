{ pkgs, ... }:
{
	programs.tmux = {
		enable = true; # Enables tmux
		plugins = with pkgs.tmuxPlugins; [
			gruvbox
			sensible
		]; # Enables tmux plugins
	};
}
