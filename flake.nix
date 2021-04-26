{
  description = "A very basic flake";

  outputs = { self, nixpkgs }: let 
    pkgs = import nixpkgs {
      system = "x86_64-linux";
    };
  in {
    packages.x86_64-linux.dwm = import ./build.nix {
      inherit pkgs;
    };

    defaultPackage.x86_64-linux = self.packages.x86_64-linux.dwm;

  };
}
