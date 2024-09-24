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



