{
	services = {
		printing.enable = true; # Enables printer support
		avahi = {
			enable = true; # Enables wireless printer support
			nssmdns4 = true; # See line 6
			openFirewall = true; # See line 6
		};
	};
}
