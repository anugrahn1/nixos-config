{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.git = {
    enable = true;
    userName = "Anugrah";
    userEmail = "pnanugrah@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
