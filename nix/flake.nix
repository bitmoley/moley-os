{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

  outputs = { nixpkgs, ... }: {
    nixosConfigurations.moley-os = nixpkgs.lib.nixosSystem {
      modules = [ ./configuration.nix ];
    };
  };
}
