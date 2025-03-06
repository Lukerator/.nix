{
	environment = {
		sessionVariables.NIXOS_OZONE_WL = "1";
	};
	programs.hyprland = {
		enable = true;
		withUWSM = false;
	};
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
	/* services = {
		xserver.enable = true;
		displayManager.sddm = {
			enable = true;
			#wayland.enable = true;
			theme = "catppuccin-mocha";
			package = pkgs.kdePackages.sddm;
		};
	}; */
}
