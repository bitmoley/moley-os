{ pkgs, ... }:

{
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

  programs.dconf.enable = true;
  programs.thunar.enable = true;
  services.gvfs.enable = true;
  services.tumbler.enable = true;

  environment.systemPackages = with pkgs; [
    firefox
    fuzzel
    starship
    zoxide
    eza
    mako
    stow
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    jetbrains-mono
  ];

}
