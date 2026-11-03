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

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    fuzzel
    starship
    zoxide
    eza
    mako
    stow
    thunar
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    jetbrains-mono
  ];

}
