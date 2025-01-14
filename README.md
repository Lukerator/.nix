# Don't forget to change hostname to Luke-PC and enable flakes 
## networking.hostname = "Luke-PC";
## nix.settings.experimental-features = [ "nix-command" "flakes" ];
git clone https://github.com/Lukerator/.nix.git .nix && nixos-rebuild switch --flake ~/.nix && home-manager switch --flake ~/.nix && reboot
