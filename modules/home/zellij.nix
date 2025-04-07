{
  programs = {
    zellij = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        show_startup_tips = false;
        keybinds = {
          # "shared_except \"locked\"" = {
          #   "bind \"Alt f\"" = {
          #     "LaunchPlugin \"filepicker\"" = {
          #       floating = true;
          #       close_on_selection = true;
          #     };
          # };
          # };
        };
      };
    };
  };
}
