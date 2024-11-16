{
  python3Packages,
  python312Packages,
  fetchPypi,
  lib,
}:

python3Packages.buildPythonPackage rec {
  format = "pyproject";
  pname = "presenterm_export";
  version = "0.2.5";
  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-jof/0phASV/0bE0wNaio9PVCfIgm30EWzlLWxPMw8Rs=";
  };

  # replaces version specific dependencies with the same dependencies but without specified versions
  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace "ansi2html==1.8.0" "ansi2html" \
      --replace "libtmux==0.23.2" "libtmux" \
  '';

  propagatedBuildInputs = with python312Packages; [
    setuptools
    ansi2html
    libtmux
    weasyprint
    dataclass-wizard
  ];

}
