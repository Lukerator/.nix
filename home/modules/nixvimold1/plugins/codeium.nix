{ lib, pkgs, ... }:
{
	nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [ "codeium" ];
	programs.nixvim.plugins.codeium-nvim = {
		enable = true;
		settings = {
			enable_chat = false;
			tools = {
				curl = lib.getExe pkgs.curl;
				gzip = lib.getExe pkgs.gzip;
				uname = lib.getExe' pkgs.coreutils "uname";
				uuidgen = lib.getExe' pkgs.coreutils "uuidgen";
			};
		};
	};
}
