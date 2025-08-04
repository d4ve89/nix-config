{ inputs, ... }:
let
  # pinned idea-community 2024.3:
  


{
  default = final: prev:
    (import ../packages { pkgs = final; })
    // {
      stable = import inputs.nixpkgs-stable {
        inherit (final) system;
        config.allowUnfree = true;
      };
      unstable = import inputs.nixpkgs-unstable {
        inherit (final) system;
        config.allowUnfree = true;
      };
    };
}
