{ config, pkgs, ... }:

{
  programs = {
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      syntaxHighlighting.catppuccin.enable = true;
      autocd = false;
      shellAliases = {
        ff = "fastfetch";
        tty-clock = "tty-clock -cSt";
        gs = "git status";
        ga = "git add";
        gc = "git commit";
        gp = "git push";
        cd = "z";
        cdd = "cd";
        zathura = "zathura --fork";
        nv = "nvim";
        shutdown = "shutdown -h now";
        nixdev = "nix develop -f shell.nix -c $SHELL";
      };
      oh-my-zsh = {
        custom = "$HOME/.dotfiles/modules/existing-dotfiles/zsh-custom/";
        enable = true;
        theme = "robbyrussell";
        plugins = [
          "fzf"
          "zoxide"
          "direnv"
          # "zsh-vi-mode"
        ];
      };
    };
  };
}
