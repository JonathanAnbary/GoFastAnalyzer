{
  description = "assist with reverse engineering cpp binaries in IDA";
  inputs = {
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nixpkgs-stable,
    ...
  }:
  let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in
  {
    devShells.x86_64-linux.default = pkgs.mkShell {
      packages = [
        # (pkgs.libsForQt5.callPackage ~/Desktop/dotfiles/nixos/ida-9.1-derivation.nix { })
        pkgs.go
        pkgs.gox
        (pkgs.python3.withPackages (python-pkgs: with python-pkgs; [
          # select Python packages here
          python-lsp-server
        ]))
      ];
    };
  };
}
