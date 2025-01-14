{ pkgs, ... }:
{
	programs.nautilus-open-any-terminal = {
		enable = true;
		terminal = "kitty";
	};
	environment = {
		pathsToLink = [ "/share/nautilus-python/extensions" ];
		sessionVariables.NAUTILUS_4_EXTENSION_DIR = "${pkgs.nautilus-python}/lib/nautilus/extensions-4";
	};
}
