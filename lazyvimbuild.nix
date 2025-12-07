{
  description = "Air-gapped LazyVim build";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in {
    packages.${system}.nvim =
      pkgs.neovim.override {
        configure = {
          customRC = ''
            set runtimepath^=~/.config/nvim
          '';

          # optional: LSPs, tools
          extraPackages = ps: with ps; [
            ripgrep
            fd
            lua-language-server
          ];
        };
      };

    defaultPackage.${system} = self.packages.${system}.nvim;
  };
}
