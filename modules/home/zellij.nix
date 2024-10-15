{
  programs = {
    zellij = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        keybinds = {
          "shared_except \"locked\"" = {
            "bind \"Alt f\"" = {
              "LaunchPlugin \"filepicker\"" = {
                floating = true;
                close_on_selection = true;
              };
            };
          };
        };
      };
    };
  };
}
