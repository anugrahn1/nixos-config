{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.zathura = {
    enable = true;
    catppuccin.enable = false;

    extraConfig = ''
      map j feedkeys "<C-Down>"
      map k feedkeys "<C-Up>"
      		'';
  };
}
