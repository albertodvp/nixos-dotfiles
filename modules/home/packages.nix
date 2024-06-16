{ pkgs, ... }:
{
  home.packages = with pkgs; [
    actionlint
    alacritty
    alsa-utils
    arandr
    bat
    btop
    cachix
    delta
    dig
    discord-ptb
    docker-compose
    emacs
    feh
    firefox
    fzf
    gcc
    gimp
    gnumake
    gnupg
    jq
    haskell-language-server
    cabal-install
    ghc
    haskellPackages.hasktags
    libnotify
    nil
    nixpkgs-fmt
    olive-editor
    pavucontrol
    python39
    ripgrep
    slack
    tmux
    tree
    tree-sitter
    vlc
    x265
    xmobar
    (vivaldi.override { proprietaryCodecs = true; enableWidevine = false; })
  ];
}

