{ ... }:
{
  programs = {
    helix = {
      enable = true;
      settings = {
        theme = "onedark";
        editor = {
          cursorline = true;
          rulers = [ 100 ];
          gutters = [ "diagnostics" "spacer" "line-numbers" "diff" ];
          color-modes = true;
          bufferline = "always";
          cursor-shape = {
            insert = "bar";
            normal = "block";
            select = "underline";
          };
          lsp = {
            display-messages = true;
            display-signature-help-docs = true;
            display-inlay-hints = true;
          };
          smart-tab.supersede-menu = true;
          file-picker = { hidden = false; };
        };
      };
      languages = {
        language-server.haskell-language-server = {
          command = "haskell-language-server";
          args = [ "--lsp" ];
        };
        language = [
          {
            name = "nix";
            auto-format = true;
            formatter = { command = "nixpkgs-fmt"; };
          }
          {
            name = "cabal";
          }
          {
            name = "haskell";
            scope = "source.haskell";
            injection-regex = "haskell";
            file-types = [ "hs" ];
            formatter = { command = "fourmolu"; };
            roots = [ "Setup.hs" "stack.yaml" "*.cabal" "cabal.project" "cabal.project.freeze" ];
            comment-token = "--";
            language-servers = [ "haskell-language-server" ];
            indent = {
              tab-width = 2;
              unit = "  ";
            };
          }
        ];
      };
    };
  };
}

