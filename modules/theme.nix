{ inputs, ... }:
{
  flake.nixosModules.theme =
    { pkgs, ... }:
    {
      imports = [ inputs.stylix.nixosModules.stylix ];
      stylix = {
        enable = true;
        autoEnable = true;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
        # image = ../wallpapers/96740776_p5.jpg;

        fonts = {
          serif = {
            package = pkgs.dejavu_fonts;
            name = "DejaVu Serif";
          };
          sansSerif = {
            package = pkgs.inter;
            name = "Inter";
          };
          monospace = {
            package = pkgs.maple-mono.NF;
            name = "Maple Mono NL NF";
          };
          emoji = {
            package = pkgs.noto-fonts-color-emoji;
            name = "Noto Color Emoji";
          };
        };
      };
    };
  flake.homeModules.theme = {
    imports = [ inputs.stylix.homeModules.stylix ];
  };
}
