{stdenvNoCC, ...}:
stdenvNoCC.mkDerivation {
  pname = "aesthetic-iosevka";
  version = "git";
  src = ../.;
  dontConfigure = true;
  installPhase = ''
    mkdir -pv $out/share/fonts/TTF
    install -Dvm755 ./aesthetic-iosevka-nerd-font/*.ttf $out/share/fonts/TTF
  '';
}
