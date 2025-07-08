{
  nixosOptionsDoc,
  lib,
  module,
  ...
}:
let
  eval = lib.evalModules {
    modules = [
      {
        options._module.args = lib.mkOption {
          internal = true;
        };
        config = {
          _module.check = false;
        };
      }
      module
    ];
  };
in
nixosOptionsDoc {
  # TODO: Fix warnings... (add missing descriptions to ALL options)
  warningsAreErrors = false;
  inherit (eval) options;
}
