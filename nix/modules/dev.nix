{ pkgs, ... }:

{
  programs.neovim = {
      enable = true;
      defaultEditor = true;
  };

  programs.direnv.enable = true;

  environment.systemPackages = with pkgs; [
    git
    wget
    tmux
    ghostty
    lazygit
    lua-language-server
    nixd
  ];

}
