{ config, pkgs, ... }:

{
  # i have no clue what this does, i stole it from my gf
  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };
  environment.systemPackages = with pkgs; [ adw-gtk3 ];
}
