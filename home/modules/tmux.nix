{ pkgs, ... }:
{
	programs.tmux = {
		enable = true; # Enables tmux
		plugins = with pkgs.tmuxPlugins; [
			catppuccin
			sensible
		]; # Enables tmux plugins
	};
}
