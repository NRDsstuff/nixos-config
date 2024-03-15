{ config, pkgs, ... }:

{
  # autologin
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "nrd";
  # https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;
  
  # user(s)
  users.users = {
    nrd = {
      isNormalUser = true;
      description = "NRD";
      extraGroups = [ "networkmanager" "wheel" ];
    };
  };
}
