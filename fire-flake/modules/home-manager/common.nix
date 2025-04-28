{ config, pkgs, ... }:

{
  # Common environment variables
  home.sessionVariables = {
    EDITOR = "nvim";
    LANG = "en_US.UTF-8";
  };
}
