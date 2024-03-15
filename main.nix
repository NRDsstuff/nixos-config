{ config, pkgs, ... }:

{
  # import shit lol
  imports = [
      ./pkgs.nix
      ./syncthing.nix
      ./graphics.nix
      ./bootloader.nix
      ./locale.nix
      ./autoupdate.nix
      ./virtualization.nix
      ./users.nix
      # ./binaries.nix
  ];
  
  # hostname
  networking.hostName = "nrdeproseros";

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.bluetooth.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # who needs a firewall anyways
  networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
