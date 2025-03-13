# Don't forget to change hostname to Luke-PC and enable flakes 
## networking.hostname = "Luke-PC";
git clone https://github.com/Lukerator/.nix.git .nix && nixos-rebuild switch --extra-experimental-features flakes --extra-experimental-features nix-command --flake ~/.nix && home-manager switch --flake ~/.nix && reboot
