{ config, pkgs, ... }:
{
  # required by some flatpak apps
  services.dbus = {
    enable = true;
    implementation = "broker";
  };
  
  # ssh
  services.openssh.enable = true;
  
  # CUPS
  services.printing.enable = true;
  
  # audio
  sound.enable = true;
  hardware.bluetooth.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  
  # idk
  xdg.portal.enable = true;
}
