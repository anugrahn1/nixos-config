
{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.eww = {
    enable = true;
    configDir = ./existing-dotfiles/eww;
    enableZshIntegration = true;
  };
}
