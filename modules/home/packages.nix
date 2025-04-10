{
  pkgs,
  nixpkgs-qgis-42,
  system,
  ...
}:
{
  home.packages = with pkgs; [
    actionlint
    alsa-utils
    arandr
    bat
    bottom
    brightnessctl
    cachix
    chromium
    code-cursor
    delta
    dig
    digikam
    docker-compose
    dprint
    emacs
    evtest
    evince
    feh
    firefox
    ffmpeg-full
    fzf
    gcc
    gdal
    gimp
    gnumake
    gnupg
    grim
    haskell-ci
    haskellPackages.hasktags
    jq
    less
    lsof
    libnotify
    libreoffice-fresh
    nautilus
    nil
    nixpkgs-fmt
    nodePackages.typescript
    nodePackages.typescript-language-server
    olive-editor
    openssl
    pavucontrol
    python3
    ((import nixpkgs-qgis-42 { inherit system; }).qgis)
    ripgrep
    slack
    slurp
    swappy
    tree
    tree-sitter
    thunderbird
    unzip
    vesktop
    (vivaldi.override {
      proprietaryCodecs = true;
      enableWidevine = false;
    })
    vlc
    vscode-langservers-extracted
    wl-clipboard-x11
    wl-clipboard
    x265
    xdg-utils
  ];
}
