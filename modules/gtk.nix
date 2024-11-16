{
  config,
  lib,
  pkgs,
  ...
}:

{
  gtk.enable = true;
  gtk.cursorTheme.package = pkgs.bibata-cursors;
  gtk.cursorTheme.name = "Bibata-Moden-Ice";

  # gtk.theme.package = pkgs.catppuccin-gtk;
  # gtk.theme.name = "catppuccin-gtk";

  # Find more gtk themes here:
  # https://github.com/NixOS/nixpkgs/tree/7eee17a8a5868ecf596bbb8c8beb527253ea8f4d/pkgs/data/themes
  gtk.theme.package = pkgs.andromeda-gtk-theme;
  gtk.theme.name = "andromeda-gtk";

  # gtk.theme.package = pkgs.vimix-gtk-themes;
  # gtk.theme.name = "vimix";

  # gtk.theme.package =  pkgs.gruvbox-dark-gtk;
  # gtk.theme.name = "gruvbox-dark-gtk";

  # gtk.theme.package = pkgs.whitesur-gtk-theme;
  # gtk.theme.name = "whitesur";

  # gtk.theme.package = pkgs.lavanda-gtk-theme;
  # gtk.theme.name = "lavanda";

  # gtk.iconTheme.name = "GruvboxPlus";
  # gtk.iconTheme.package = pkgs.qogir-icon-theme;
  # gtk.iconTheme.name = "Qogir";

  gtk.iconTheme.package = pkgs.whitesur-icon-theme;
  gtk.iconTheme.name = "whitesur";

  qt.enable = true;
  qt.style.name = "kvantum";
  qt.platformTheme.name = "kvantum";
  qt.style.package = pkgs.catppuccin-qt5ct;

}
