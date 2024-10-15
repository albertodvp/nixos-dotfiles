{ pkgs, ... }:
{
  home.packages = with pkgs; [
    actionlint
    alsa-utils
    arandr
    bat
    bottom
    brightnessctl
    cabal-install
    cachix
    delta
    dig
    digikam
    docker-compose
    dprint
    emacs
    evtest
    feh
    firefox
    fzf
    gcc
    gimp
    gnumake
    gnupg
    haskell-language-server
    haskellPackages.hasktags
    jq
    less
    lsof
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
    unzip
    vesktop
    (vivaldi.override {
      proprietaryCodecs = true;
      enableWidevine = false;
    })
    vlc
    vscode-langservers-extracted
    wl-clipboard-x11
    x265
    xdg-utils
  ];
}
