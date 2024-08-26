{config, pkgs, ...}:

{
  programs.kitty = {
    enable = true;
    font.name = "JetBrainsMonoNerdFont"; # find names with fc-list
    font.size = 16;
    theme = "Catppuccin-Mocha";
    shellIntegration.enableZshIntegration = true;
    extraConfig = ''
       confirm_os_window_close 0
       background_opacity 0.9
    '';
  };
}
