{ self, inputs, ... }:
{
  flake.nixosModules.dev = {
    imports = [ inputs.home-manager.nixosModules.default ];
    home-manager.users.arc = {
      imports = [ self.homeModules.toolchain ];
    };
  };
  flake.homeModules.toolchain =
    { pkgs, ... }:
    {
      # Language Compilers / Toolchains
      home.packages = with pkgs; [
        php
        uv
        deno
        bun
        nodejs
        rustup
        clang
        python315FreeThreading
        jdk25
        maven
      ];
    };
}
