# Dotfiles
**Theme - Catppuccin Mocha**

![2024-06-15_09-33_1](https://github.com/sandptel/dotfiles/assets/96694484/c628e5d6-759b-41ea-9570-a32c3ec659df)
![2024-06-15_09-33](https://github.com/sandptel/dotfiles/assets/96694484/be6d5050-ae34-4878-89fa-18a91bc4d356)

# **!!! Do Not Blindly install these dots**

# Installation
1. Installing Nix
```bash
sh <(curl -L https://nixos.org/nix/install) --no-daemon
 . ~/.nix-profile/etc/profile.d/nix.sh
export NIX_CONFIG="experimental-features = nix-command flakes"
```
2. Clone the Repository
```bash
git clone https://github.com/sandptel
```
3. Rebuild Switch Using Flakes
   Here <roronoa> is profile name.
```bash
sudo nixos-rebuild switch --flake .#roronoa
```
OR direct install via
```bash
sudo nixos-rebuild switch --flake github:sandptel/dotfiles#roronoa
```
