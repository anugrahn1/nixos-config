### Installation

```sh
git clone git@github.com:anugrahn1/nixos-config.git ~/.dotfiles/
cd ~/.dotfiles/
sudo nixos-rebuild switch --flake .
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
sudo nix-channel --update
home-manager switch --flake . -b backup
```



