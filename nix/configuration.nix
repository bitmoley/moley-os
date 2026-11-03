{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/desktop.nix
      ./modules/dev.nix
      ./modules/apps.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;
  zramSwap.enable = true;

  networking.hostName = "moley-os";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/London";
  console.keyMap = "uk";

  # Hardware stuff
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
  services.power-profiles-daemon.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Users
  programs.fish.enable = true;
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

  # Nix store cleanup
  boot.loader.systemd-boot.configurationLimit = 10;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };
  nix.settings.auto-optimise-store = true;

  system.stateVersion = "26.05";
}

