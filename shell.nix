{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.python3
    pkgs.cowsay
    pkgs.lolcat
  ];

  shellHook = ''
    echo "Welcome to the Tao dev shell 🧘"
  '';
}

