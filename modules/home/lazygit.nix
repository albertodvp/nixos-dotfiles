{ ... }:
{
  programs.lazygit = {
    settings = {
      git.paging = {
        pager = "delta --dark --paging=never";
        colorArg = "always";
      };
    };
    enable = true;
  };
}
