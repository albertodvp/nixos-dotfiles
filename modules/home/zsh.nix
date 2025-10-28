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
      initContent = ''
        # Show timestamp and execution time for all commands

        preexec() {
          timer=$(($(date +%s%N)/1000000))
        }

        precmd() {
          if [ $timer ]; then
            now=$(($(date +%s%N)/1000000))
            elapsed=$(($now-$timer))
            echo "⏱ ''${elapsed}ms"
            unset timer
            unset cmd_timestamp
          fi
        }

        # Keep timestamp on right side of prompt
        RPROMPT='%*'
      '';
    };
  };
}
