{ config, lib, modulesPath, ... }:
{
	imports = [
		(modulesPath + "/installer/scan/not-detected.nix")
	];

	swapDevices = [ ];
	boot.extraModulePackages = [ ];
	boot.initrd.kernelModules = [ ];
	boot.kernelModules = [ "kvm-intel" ];
	networking.useDHCP = lib.mkDefault true;
	nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
	hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
	boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "vmd" "nvme" "usb_storage" "sd_mod" ];

	fileSystems."/" = {
		fsType = "ext4";
		device = "/dev/disk/by-uuid/24c7fa6a-2cbf-40e7-8862-9ed6ae1a3d32";
	};

	fileSystems."/boot" = {
		fsType = "vfat";
		device = "/dev/disk/by-uuid/D627-3FC4";
		options = [ "fmask=0077" "dmask=0077" ];
	};
}
