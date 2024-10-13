{
  config,
  lib,
  pkgs,
  ...
}:

let
  picom = pkgs.picom.overrideAttrs (oldAttrs: rec {
    pname = "picom";
    version = "12.1";
    # version = "12-rc4";

    src = pkgs.fetchFromGitHub {
      owner = "yshui";
      repo = "picom";
      rev = "v${version}";
      hash = "sha256-C85BmA86HA/UsUee26BWTMTxxNZ3frDU6ObCpJbQDCI=";
      fetchSubmodules = true;
    };

    nativeBuildInputs = [
      pkgs.asciidoc
      pkgs.asciidoctor
      pkgs.docbook_xml_dtd_45
      pkgs.docbook_xsl
      pkgs.makeWrapper
      pkgs.meson
      pkgs.ninja
      pkgs.pkg-config
    ];

  });
in
{
  environment.defaultPackages = with pkgs; [
    picom
  ];
}
