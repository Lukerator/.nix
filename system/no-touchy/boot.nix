{
	boot = {
		consoleLogLevel = 0;
		initrd.verbose = false;
		kernelParams = [ "quiet" "udev.log_level=0" ];
		plymouth = {
			enable = true;
		};
	loader = {
		systemd-boot.enable = false;
		efi.canTouchEfiVariables = true;
		grub = {
			enable = true;
			efiSupport = true;
			devices = [ "nodev" ];
			extraEntries = ''
				menuentry "Reboot" {
					reboot
				}
				menuentry "Shut Down" {
					halt
				}
				'';
			};
		};
	};
}
