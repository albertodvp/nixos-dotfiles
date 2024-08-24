{ pkgs, ... }:
{
  home.packages = with pkgs; [
    actionlint
    firefox
    brightnessctl
    alsa-utils
    arandr
    bat
    bottom
    cabal-install
    cachix
    delta
    dig
    docker-compose
    dprint
    emacs
    feh
    fzf
    gcc
    ghc
    gimp
    gnumake
    gnupg
    haskell-language-server
    haskellPackages.hasktags
    jq
    libnotify
    nil
    nixpkgs-fmt
    nodePackages.typescript
    nodePackages.typescript-language-server
    olive-editor
    pavucontrol
    python39
    ripgrep
    slack
    tree
    tree-sitter
    (vivaldi.override { proprietaryCodecs = true; enableWidevine = false; })
    vesktop
    vlc
    vscode-langservers-extracted
    wl-clipboard-x11
    x265
    xdg-utils
  ];
}

