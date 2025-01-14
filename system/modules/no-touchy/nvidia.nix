{ config, lib, ... }:
{
	services.xserver.videoDrivers = ["nvidia"];
	hardware = {
		graphics.enable = true;
		nvidia = {
			open = false;
			nvidiaSettings = true;
			modesetting.enable = true;
			package = config.boot.kernelPackages.nvidiaPackages.beta;
			powerManagement= {
				enable = false;
				finegrained = false;
			};
			prime = {
				sync.enable = true;
				intelBusId = "PCI:0:2:0";
				nvidiaBusId = "PCI:1:0:0";
				offload = {
					enable = false;
					enableOffloadCmd = false;
				};
			};
		};
	};
	specialisation.battery-saving.configuration = {
		hardware.nvidia.prime = {
			sync.enable = lib.mkForce false;
			offload = {
				enable = lib.mkForce true;
				enableOffloadCmd = lib.mkForce true;
			};
		};
	};
}
