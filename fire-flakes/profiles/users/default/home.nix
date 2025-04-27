{ pkgs, config, ... }:

{
  imports = [
    ../../modules/home/common.nix
    ../../modules/home/programs/git.nix
  ];
}
