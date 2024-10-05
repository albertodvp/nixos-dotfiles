{
  perSystem =
    { pkgs, config, ... }:
    {
      devShells.default = pkgs.mkShell {
        buildInputs = config.pre-commit.settings.enabledPackages;
        shellHook = config.pre-commit.installationScript;
      };
    };
}
