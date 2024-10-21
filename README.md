### Installation

```sh
git clone git@github.com:anugrahn1/nixos-config.git ~/.dotfiles/
cd ~/.dotfiles/
sudo nixos-rebuild switch --flake .
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
sudo nix-channel --update
home-manager switch --flake . -b backup
```


### Credits
 
[Picom Config](https://gitlab.com/codevedas/dotfiles-ayushman/-/blob/i3-nord/.config/picom/picom.conf?ref_type=heads)
[Fastfetch Config](https://github.com/MeraMadness/MeraHypr/blob/main/.config/fastfetch/config.jsonc)

### Fixes

[If systemd service isn't deleted with home-manager](https://github.com/nix-community/home-manager/issues/355#issuecomment-524042996)

## Not booting properly (cant mount /mnt-root) 

- Boot into live nixos environment from a usb
- mount the ext4 partition to `/mnt`
- mount the boot partition to /boot
- cd into `/mnt/home/anugrah/.dotfiles` and run `sudo nixos-install --flake .#nixos`
- exit and reboot
- the first time you login into i3+xfce, there will be a black screen, just reboot and login again

