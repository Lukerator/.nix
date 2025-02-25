{ config, lib, ... }:
{
	services.xserver.videoDrivers = ["nvidia"];
	hardware = {
		graphics.enable = true;
		nvidia = {
			open = true;
			nvidiaSettings = true;
			modesetting.enable = true;
			package = config.boot.kernelPackages.nvidiaPackages.beta;
			powerManagement= {
				enable = false;
				finegrained = false;
			};
			prime = {
				sync.enable = false;
				intelBusId = "PCI:0:2:0";
				nvidiaBusId = "PCI:1:0:0";
				offload = {
					enable = true;
					enableOffloadCmd = true;
				};
			};
		};
	};
	specialisation.gaming.configuration = {
		hardware.nvidia.prime = {
			reverseSync.enable = lib.mkForce true;
			offload = {
				enable = lib.mkForce false;
				enableOffloadCmd = lib.mkForce false;
			};
		};
	};
}
