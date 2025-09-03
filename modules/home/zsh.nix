{ ... }:
{
  programs = {
    zsh = {
      enable = true;
      history = {
        size = 10000;
      };
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" ];
        theme = "robbyrussell";
      };
      shellAliases = {
        lg = "lazygit";
        zpipe = "zellij pipe";
        kcn = "kubectl -n";
      };
    };
  };
}
