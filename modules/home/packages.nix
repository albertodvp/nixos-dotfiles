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
    dunst
    emacs
    feh
    firefox
    fzf
    gcc
    gimp
    gnumake
    gnupg
    haskellPackages.hasktags
    jq
    libnotify
    nil
    nixpkgs-fmt
    obs-studio
    olive-editor
    pavucontrol
    python39
    ripgrep
    rofi
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

