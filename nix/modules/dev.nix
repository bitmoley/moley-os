{ pkgs, ... }:

{
  programs.neovim = {
      enable = true;
      defaultEditor = true;
  };

  environment.systemPackages = with pkgs; [
    # Tools
    git
    wget
    tmux
    ghostty
    lazygit
    # Languages
    go
    odin
    clang
    # LSPs
    gopls
    ols
    lua-language-server
    clang-tools
    nixd
  ];

}
