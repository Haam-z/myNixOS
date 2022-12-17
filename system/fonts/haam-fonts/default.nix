{ fetchzip, runCommand }:

let src = fetchzip {
  url = "https://github.com/Haam-z/fonts/archive/89eca28ef2805077299819140a28e0409444052d.zip";
  sha256 = "sha256-I3dpr5or1YdnN5Blgyra9Ehmff12bNyfT/a8nMjZY9E=";
};
in
runCommand "haas-fonts" { } ''
  mkdir -p $out/share/fonts/otf
  mkdir -p $out/share/fonts/ttf
  install -m444 -Dt $out/share/fonts/ttf ${src}/fonts/ttf/*.ttf;
  install -m444 -Dt $out/share/fonts/otf ${src}/fonts/otf/*.otf;
''
