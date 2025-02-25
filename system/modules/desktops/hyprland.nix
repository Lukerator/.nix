{
	programs.hyprland = {
		enable = true; # Enables Hyprland as a Window Manager/Desktop Environment
		withUWSM = false;
	};
	/*services = {
		xserver.enable = true;
		displayManager.sddm = {
			enable = true; # Enables SDDM - see ./plasma.nix
			#wayland.enable = true; # Enables Wayland on SDDM
			theme = "catppuccin-mocha"; # Sets SDDM theme
			package = pkgs.kdePackages.sddm; # Enables Qt6
		};
	};*/
	services = {
		libinput = {
			enable = true;
			touchpad.tapping = true;
		};
		xserver = {
			enable = true;
			displayManager.gdm = {
				enable = true;
				wayland = true;
			};
		};
	};
	environment = {
		sessionVariables.NIXOS_OZONE_WL = "1"; # Enables Wayland for apps that semi-support it
	};
}
