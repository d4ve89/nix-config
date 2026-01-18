{ pkgs }:
pkgs.yabai.overrideAttrs (old: {
  version = "7.1.16";
  src = pkgs.fetchFromGitHub {
    owner = "koekeishiya";
    repo = "yabai";
    rev = "v7.1.16";
    #sha256 = "1w6bxilwf117v2s6k0jf68ppxk6qmcclz9vw57mrv47qwv9cqysr";  # Replace with actual
    sha256 = "0sv03b9i5nrkjrz7hliq5g3l9w48j1izbnjcm938pz4as4df7mf4";
  };
})
