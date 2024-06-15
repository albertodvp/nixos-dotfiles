{ inputs, self, ... }:
{
  imports = [
    inputs.git-hooks.flakeModule
  ];
  perSystem = { ... }: {
    pre-commit = {
      settings = {
        default_stages = [ "commit" "push" ];
        rootSrc = self.outPath;
        hooks = {
          deadnix.enable = true;
          nixpkgs-fmt.enable = true;
          typos.enable = true;
          markdownlint.enable = true;
        };
      };
    };
  };
}
