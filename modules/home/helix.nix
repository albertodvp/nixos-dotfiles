{ pkgs, ... }:
{
  programs = {
    helix = {
      defaultEditor = true;
      enable = true;
      extraPackages = [
        pkgs.nixd
        pkgs.nixfmt-rfc-style
      ];
      settings = {
        keys = {
          normal = {
            "S-i" = "jump_forward";
            "S-o" = "jump_backward";
            "S-s" = "save_selection";
          };
        };
        editor = {
          cursorline = true;
          rulers = [ 100 ];
          gutters = [
            "diagnostics"
            "spacer"
            "line-numbers"
            "diff"
          ];
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
          file-picker = {
            hidden = false;
          };
          whitespace = {
            render = "all";

            # Render control for each character
            renderControl = {
              space = "all";
              tab = "all";
              nbsp = "none";
              nnbsp = "none";
              newline = "none";
            };

            # Characters for different whitespace types
            characters = {
              space = "·";
              nbsp = "⍽";
              nnbsp = "␣";
              tab = "→";
              newline = "⏎";
              tabpad = "·"; # Tabs will look like "→···" (depending on tab width)
            };
          };
        };
      };
      languages = {
        language-server = {
          eslint = {
            command = "vscode-eslint-language-server";
            args = [ "--stdio" ];
            config = {
              codeActionsOnSave = {
                mode = "all";
                "source.fixAll.eslint" = true;
              };
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
            command = "haskell-language-server-wrapper";
            args = [ "--lsp" ];
          };
          nixd = {
            command = "nixd";
          };
        };
        language = [
          {
            name = "nix";
            auto-format = false;
            formatter = {
              command = "nixfmt";
            };
            language-servers = [ "nixd" ];
          }
          {
            name = "cabal";
            auto-format = false;
            formatter = {
              command = "cabal-fmt";
              args = [ "-i" ];
            };
          }
          {
            name = "haskell";
            scope = "source.haskell";
            injection-regex = "haskell";
            file-types = [ "hs" ];
            auto-format = false;
            formatter = {
              command = "fourmolu";
              args = [
                "--stdin-input-file"
                "-i"
              ];
            };
            roots = [
              "Setup.hs"
              "stack.yaml"
              "*.cabal"
              "cabal.project"
              "cabal.project.freeze"
            ];
            comment-token = "--";
            language-servers = [
              "haskell-language-server"
            ];
            indent = {
              tab-width = 2;
              unit = "  ";
            };
          }
          {
            name = "typescript";
            file-types = [ "hs" ];
            language-servers = [
              "typescript-language-server"
              "eslint"
            ];
            formatter = {
              command = "dprint";
              args = [
                "fmt"
                "--stdin"
                "typescript"
              ];
            };
            auto-format = true;
          }
          {
            name = "javascript";
            language-servers = [
              "typescript-language-server"
              "eslint"
            ];
            formatter = {
              command = "dprint";
              args = [
                "fmt"
                "--stdin"
                "javascript"
              ];
            };
            auto-format = true;
          }
        ];
      };
    };
  };
}
