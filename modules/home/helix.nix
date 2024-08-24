{ pkgs, ... }:
{
  programs = {
    helix = {
      enable = true;
      settings = {
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
        language-server = {
          eslint = {
            command = "vscode-eslint-language-server";
            args = [ "--stdio" ];
            config = {
              codeActionsOnSave = { mode = "all"; "source.fixAll.eslint" = true; };
              format = {
                enable = true;
              };
              nodePath = "";
              quiet = false;
              rulesCustomizations = [ ];
              run = "onType";
              validate = "on";
              experimental = { };
              problems = {
                shortenToSingleLine = false;
              };
              codeAction = {
                disableRuleComment = {
                  enable = true;
                  location = "separateLine";
                };
                showDocumentation = {
                  enable = false;
                };
              };
            };
          };

          # TODO clean up this
          typescript-language-server = with pkgs.nodePackages; {
            command = "${typescript-language-server}/bin/typescript-language-server";
            args = [ "--stdio" ];
            config.tsserver.path = "${typescript}/lib/node_modules/typescript/lib";
          };

          haskell-language-server = {
            command = "haskell-language-server";
            args = [ "--lsp" ];
          };
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
          {
            name = "typescript";
            language-servers = [
              "typescript-language-server"
              "eslint"
            ];
            formatter = { command = "dprint"; args = [ "fmt" "--stdin" "typescript" ]; };
            auto-format = true;
          }
          {
            name = "javascript";
            language-servers = [
              "typescript-language-server"
              "eslint"
            ];
            formatter = { command = "dprint"; args = [ "fmt" "--stdin" "javascript" ]; };
            auto-format = true;
          }
        ];
      };
    };
  };
}

