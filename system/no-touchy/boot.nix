{
	boot = {
		consoleLogLevel = 0; # See line 4
		initrd.verbose = false; # Silences boot messages
		kernelParams = [ "quiet" "udev.log_level=0" ]; # See line 4
		plymouth = {
			enable = true; # Enables Startup animation
			#theme = "bgrt"; # Sets Startup animation theme
		};
	loader = {
		systemd-boot.enable = false; # Disables Systemd-Boot in favor of Grub
		efi.canTouchEfiVariables = true; # Allows EFI to create variables
		grub = {
			enable = true; # Enables the Grub bootloader
			efiSupport = true; # Allows Grub to access EFI
			devices = [ "nodev" ]; # Sends list of devices to Grub
			extraEntries = ''
				menuentry "Reboot" {
					reboot
				}
				menuentry "Shut Down" {
					halt
				}
				'';
			}; # Adds "Reboot" and "Shut Down" entries to Grub
		};
	};
}
