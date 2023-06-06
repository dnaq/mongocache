{
  description = "A very basic flake";
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: {

    packages.aarch64-linux = 
      let pkgs = nixpkgs.legacyPackages.aarch64-linux;
      in rec {
        inherit (pkgs) mongodb mongodb-4_2 mongodb-4_4 mongodb-5_0 mongodb-6_0;
        default = pkgs.symlinkJoin {
          name = "mongo-all";
          paths = [
            mongodb
            mongodb-4_2
            mongodb-4_4
            mongodb-5_0
            mongodb-6_0
          ];
        };
      };
  };
}
