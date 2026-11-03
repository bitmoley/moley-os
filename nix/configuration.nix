{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/desktop.nix
      ./modules/dev.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "moley-os";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/London";
  console.keyMap = "uk";

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  users.users.moley = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video"];
    shell = pkgs.fish;
    packages = with pkgs; [
      tree
    ];
  };

  # Enable flake
  nix.settings.experimental-features = [ "nix-command" "flakes"];

  system.stateVersion = "26.05";
}

