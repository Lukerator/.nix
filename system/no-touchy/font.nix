{ pkgs, ... }:
{
	fonts = {
		fontDir.enable = true;
		packages = with pkgs; [
			nerd-fonts.jetbrains-mono
		];
	};
}
