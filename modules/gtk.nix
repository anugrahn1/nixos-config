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

  gtk.theme.package = pkgs.catppuccin-gtk;
  gtk.theme.name = "catppuccin-gtk";

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

}
