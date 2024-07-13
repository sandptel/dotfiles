# Dotfiles
**Theme - Catppuccin Mocha**

**Bar- AGS**

![20240712_03h05m30s_grim](https://github.com/user-attachments/assets/0a87f65d-7cb2-4683-9ec2-b4f2347d7729)

## [Spicetify's Nix Module](home-manager/themes/spicetify.nix)

### Catppuccin
![catppuccin-macchiato](https://github.com/user-attachments/assets/6957abe2-81ba-4c1f-b34b-d46de7cd8a6c)

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
