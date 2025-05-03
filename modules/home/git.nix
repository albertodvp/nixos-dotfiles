{ pkgs, ... }:
{
  programs = {
    git = {
      enable = true;
      lfs.enable = true;
      package = pkgs.gitAndTools.gitFull;
      userEmail = "alberto.fanton@protonmail.com";
      userName = "Alberto Fanton";
      signing = {
        key = "63FD3A4F4832946CB8088E3CC852405269E7A087";
        signByDefault = true;
      };
      extraConfig = {
        core = {
          editor = "hx";
          pager = "delta";
        };
        pull.rebase = true;
        interactive.diffFilert = "delta --color-only";
        delta = {
          navigate = true;
          light = false;
        };
        merge.conflictStyle = "diff3";
        diff.colorMoved = "default";
        init.defaultBranch = "main";
        push.autoSetupRemote = true;
      };
      aliases = {
        f = "fetch -p";
        c = "commit";
        p = "push";
        bd = "branch -d";
        bD = "branch -D";
        acan = "!git add -u && git commit --amend --no-edit";
        st = "status -sb";
        s = "switch";
        lg = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
        cleanup = "!git branch --merged | grep  -v '\\*\\|master\\|develop' | xargs -n 1 git branch -d";
      };
    };
  };
}
