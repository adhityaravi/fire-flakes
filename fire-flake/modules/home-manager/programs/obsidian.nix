{ config, lib, pkgs, nurPkgs ? {}, ... }:

let
  cfg = config.custom.obsidian;

  inherit (lib)
    mkEnableOption
    mkOption
    mkIf
    types
    mkMerge;

  # More complete list of core plugins to enable by default.
  defaultCorePlugins = [
    "audio-recorder"
    "backlink"
    "bookmarks"
    "canvas"
    "command-palette"
    "daily-notes"
    "editor-status"
    "file-explorer"
    "file-recovery"
    "global-search"
    "graph"
    "markdown-importer"
    "note-composer"
    "outgoing-link"
    "outline"
    "page-preview"
    "properties"
    "publish"
    "random-note"
    "slash-command"
    "slides"
    "switcher"
    "sync"
    "tag-pane"
    "templates"
    "word-count"
    "workspaces"
    "zk-prefixer"
  ];

  # Stylish defaults
  defaultAppSettings = {
    spellcheck = true;
    zoomLevel = 1;
  };

  defaultAppearanceSettings = {
    baseTheme = "dark";
    accentColor = "teal";
    translucency = true;
  };

  defaultCommunityPlugins = [
    { 
      pkg = nurPkgs.obsidian-tasks; 
      enable = true; 
    }
    {
      pkg = nurPkgs.obsidian-minimal-settings;
      enable = true;
      settings = {
        lightStyle = "minimal-light";
        darkStyle = "minimal-dark";
        lightScheme = "minimal-everforest-light";
        darkScheme = "minimal-everforest-dark";
      };
    }
  ];

  defaultThemes = [
    { 
      pkg = nurPkgs.obsidian-minimal; 
      enable = true; 
    }
  ];

in {
  options.custom.obsidian = {
    enable = mkEnableOption "Enable Obsidian with sensible defaults";
    vaultPaths = mkOption {
      type = types.listOf types.str;
      default = [];
      description = "List of vault paths (relative to $HOME). Each path will be treated as a vault.";
    };
    extraSettings = mkOption {
      type = types.submodule {
        options = {
          app = mkOption {
            type = types.attrsOf types.anything;
            default = { };
            description = "Extra app settings to merge with defaults.";
          };
          appearance = mkOption {
            type = types.attrsOf types.anything;
            default = { };
            description = "Extra appearance settings.";
          };
          corePlugins = mkOption {
            type = types.listOf types.str;
            default = [];
            description = "Additional core plugins to enable.";
          };
          communityPlugins = mkOption {
            type = types.raw;
            default = [];
            description = "Community plugins to enable.";
          };
          cssSnippets = mkOption {
            type = types.raw;
            default = [];
            description = "CSS snippets to install.";
          };
          themes = mkOption {
            type = types.raw;
            default = [];
            description = "Themes to install.";
          };
          hotkeys = mkOption {
            type = types.raw;
            default = { };
            description = "Hotkeys to configure.";
          };
          extraFiles = mkOption {
            type = types.raw;
            default = { };
            description = "Extra files to include in vaults.";
          };
        };
      };
      default = { };
      description = "Settings to override or append to the defaults.";
    };
  };

  config = mkIf cfg.enable {
    programs.obsidian = {
      enable = true;
      defaultSettings = {
        app = defaultAppSettings // cfg.extraSettings.app;
        appearance = defaultAppearanceSettings // cfg.extraSettings.appearance;
        corePlugins = defaultCorePlugins ++ cfg.extraSettings.corePlugins;
        communityPlugins = defaultCommunityPlugins ++ cfg.extraSettings.communityPlugins;
        cssSnippets = cfg.extraSettings.cssSnippets;
        themes = defaultThemes ++ cfg.extraSettings.themes;
        hotkeys = cfg.extraSettings.hotkeys;
        extraFiles = cfg.extraSettings.extraFiles;
      };

      vaults = builtins.listToAttrs (map
        (path: {
          name = builtins.baseNameOf path;
          value = {
            enable = true;
            target = path;
          };
        })
        cfg.vaultPaths);
    };
  };
}

