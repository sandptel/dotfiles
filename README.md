# Dotfiles
**Theme - Catppuccin Mocha**

**Bar- AGS**

![20240712_03h05m30s_grim](https://github.com/user-attachments/assets/0a87f65d-7cb2-4683-9ec2-b4f2347d7729)

[Spicetify with Custom Nix Module (Catppuccin Mocha Theme)](home-manager/themes/spicetify.nix)

![screenshot_2024-07-13-051915](https://github.com/user-attachments/assets/4d7ed9a8-d530-4b36-92c9-d9bf8bb70d6f)


 

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
