{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

{
  programs.spicetify =
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in
    {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        adblock
        shuffle # shuffle+ (special characters are sanitized out of extension names)
        beautifulLyrics
      ];
      # theme = spicePkgs.themes.catppuccin;
      theme = spicePkgs.themes.sleek;
      colorScheme = "mocha";
    };
}
