{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "moley-os";
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/London";

  console.keyMap = "uk";

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.moley = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video"];
    shell = pkgs.fish;
    packages = with pkgs; [
      tree
    ];
  };

  ### DESKTOP ENVIRONMENT ###
  programs.sway.enable = true;

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd sway";
        user = "moley";
      };
    };
  };

  programs.fish.enable = true;
  programs.dconf.enable = true;
  
  ### PACKAGES ###
 
  programs.firefox.enable = true;
 
  environment.systemPackages = with pkgs; [
    neovim
    wget
    git
    ghostty
    mako
    zoxide
    eza
    starship
    tmux
    fuzzel
    nixd
    go
    gopls
    odin
    ols
    clang
    clang-tools
    lazygit
    stow
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    jetbrains-mono
  ];

  system.stateVersion = "26.05";
}

