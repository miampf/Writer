{
  description = "A neovim distribution for creative writing";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixvim = {
        url = "github:nix-community/nixvim";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];
      perSystem = { pkgs, system, ... }: {
        packages.default = pkgs.writeShellApplication {
          name = "writer";
          runtimeInputs = with pkgs; [
            git
            pandoc
          ];
          text = ''
            exec -a "$0" ${inputs.nixvim.legacyPackages.${system}.makeNixvim (import ./config.nix)}/bin/nvim "$@"
          '';
        };
      };
    };
}
