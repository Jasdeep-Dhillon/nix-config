alias s:= switch-legion

switch-legion:
    sudo nixos-rebuild switch --flake .#legion

trace-switch-legion:
    sudo nixos-rebuild switch --flake .#legion --show-trace

switch-home:
    home-manager switch  --flake .

trace-switch-home:
    home-manager switch  --flake .

test-legion:
    nixos-rebuild test --flake .#legion

clean:
    nix-collect-garbage -d
