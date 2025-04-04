{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  pname = "taosay";
  version = "1.0";

  src = ./.;

  buildInputs = [
    pkgs.python3
    pkgs.cowsay
    pkgs.lolcat
  ];

  nativeBuildInputs = [
    pkgs.makeWrapper
  ];

  installPhase = ''
    mkdir -p $out/bin
    cp tao.json $out/bin
    chmod +r $out/bin/tao.json
    cp load_tao.py $out/bin
    cp taosay $out/bin/taosay
    chmod +x $out/bin/taosay

    wrapProgram $out/bin/taosay \
      --prefix PATH : "${pkgs.python3}/bin:${pkgs.cowsay}/bin:${pkgs.lolcat}/bin"
  '';

  meta = {
    description = "Fun cowsay/lolcat program that outputs quotes from the Tao of Programming";
    license = pkgs.lib.licenses.mit;
    maintainers = with pkgs.lib.maintainers; [ ];
    platforms = pkgs.lib.platforms.unix;
  };
}
