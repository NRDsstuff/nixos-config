{ config, pkgs, ... }:
{
  # required by some flatpak apps
  services.dbus = {
    enable = true;
    implementation = "broker";
  };
  
  # CUPS
  services.printing.enable = true;
  
  # audio
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  
  # misc
  xdg.portal.enable = true;
  hardware.bluetooth.enable = true;
  security.rtkit.enable = true;
}
