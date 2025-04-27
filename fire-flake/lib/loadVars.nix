{ lib, fireFlakeConfig ? null, ... }:

let
  user = builtins.getEnv "USER";
  localVarsPath = ./../vars + "/${user}.nix";
  privateVarsPath = if fireFlakeConfig != null then fireFlakeConfig.paths.vars + "/${user}.nix" else null;
in

if builtins.pathExists localVarsPath then
  (builtins.trace "🔍 Loading local vars/${user}.nix" (import localVarsPath))

else if fireFlakeConfig != null && builtins.pathExists privateVarsPath then
  (builtins.trace "🔐 Loading private fire-flake-config vars/${user}.nix" (import privateVarsPath))

else
  throw ''
    ❌ ERROR: No vars/${user}.nix found locally, and no private config available.
    📄 Please either:
      - Copy vars/template.nix to vars/${user}.nix and fill it manually
      - OR make sure your fire-flake-config repo is accessible and has vars/${user}.nix
  ''
