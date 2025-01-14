{ config, lib, modulesPath, ... }:
{
	imports = [
		(modulesPath + "/installer/scan/not-detected.nix")
	];

	swapDevices = [ ]; # Shows Swap devices
	boot.extraModulePackages = [ ]; # Sets extra Kernel modules
	boot.initrd.kernelModules = [ ]; # Sets initrd Kernel modules
	boot.kernelModules = [ "kvm-intel" ]; # Sets Kernel modules
	networking.useDHCP = lib.mkDefault true; # Enables DHCP
	nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux"; # Sets amd64 as default
	hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware; # Enables Intel Microcode
	boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "vmd" "nvme" "usb_storage" "sd_mod" ]; # Lists initrd available Kernel modules

	fileSystems."/" = {
		fsType = "ext4"; # Shows root device format
		device = "/dev/disk/by-uuid/24c7fa6a-2cbf-40e7-8862-9ed6ae1a3d32"; # Shows root device
	};

	fileSystems."/boot" = {
		fsType = "vfat"; # Shows boot device format
		device = "/dev/disk/by-uuid/D627-3FC4"; # Shows boot device
		options = [ "fmask=0077" "dmask=0077" ]; # Shows boot device options
	};
}
