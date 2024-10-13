{
  config,
  lib,
  pkgs,
  ...
}:

let
  neovim-unwrapped = pkgs.neovim-unwrapped.overrideAttrs (oldAttrs: rec {
    pname = "neovim-unwrapped";
    version = "nightly";
    # version = "12-rc4";

    __structuredAttrs = true;

    src = pkgs.fetchFromGitHub {
      owner = "neovim";
      repo = "neovim";
      rev = "${version}";
      hash = "sha256-fufeXu8Uoy8dpE6LSBWAZV8y2d2lo1c5JaT0kQFSobo=";
    };

    nativeBuildInputs = with pkgs; [
      utf8proc
      cmake
      gettext
      pkg-config
      removeReferencesTo
    ];

  });
in
{
  environment.defaultPackages = with pkgs; [
    neovim-unwrapped
  ];
}
