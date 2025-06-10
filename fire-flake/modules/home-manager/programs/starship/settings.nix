{
  palette = "everforest";
  palettes.everforest = {
    red = "#e67e80";
    orange = "#e69875";
    yellow = "#dbbc7f";
    green = "#a7c080";
    cyan = "#83c092";
    blue = "#7fbbb3";
    purple = "#d699b6";
    crust = "#2d353b";
    text = "#d3c6aa";
  };

  # Use a modern powerline-style prompt
  add_newline = false;
  command_timeout = 1000;
  format = """
[](red)\
$username\
[](bg:orange fg:red)\
$directory\
[](bg:yellow fg:orange)\
$git_branch\
$git_status\
[](fg:yellow bg:green)\
$c\
$cpp\
$rust\
$golang\
$lua\
$nodejs\
$php\
$java\
$kotlin\
$haskell\
$python\
[](fg:green bg:blue)\
$docker_context\
$kubernetes\
$aws\
$gcloud\
$nix_shell\
[](fg:blue bg:cyan)\
$time\
$battery\
[](fg:cyan bg:purple)\
$cmd_duration\
[](fg:purple)\
$line_break\
$character""";

  [username]
  show_always = true;
  style_user = "bg:red fg:crust";
  style_root = "bg:red fg:crust";
  format = "[ $user ]($style)";

  [directory]
  style = "bg:orange fg:crust";
  format = "[ $path ]($style)";
  truncation_length = 3;
  truncation_symbol = "…/";

  [directory.substitutions]
  "Documents" = "󰈙 ";
  "Downloads" = " ";
  "Music" = "󰝚 ";
  "Pictures" = " ";
  "Developer" = "󰲋 ";

  [git_branch]
  symbol = "";
  style = "bg:yellow";
  format = '[[ $symbol $branch ](fg:crust bg:yellow)]($style)';

  [git_status]
  style = "bg:yellow";
  format = '[[($all_status$ahead_behind )](fg:crust bg:yellow)]($style)';

  [c]
  symbol = " ";
  style = "bg:green";
  format = '[ $symbol($version) ]($style)';

  [cpp]
  symbol = " ";
  style = "bg:green";
  format = '[ $symbol($version) ]($style)';

  [rust]
  symbol = "";
  style = "bg:green";
  format = '[ $symbol($version) ]($style)';

  [golang]
  symbol = "";
  style = "bg:green";
  format = '[ $symbol($version) ]($style)';

  [lua]
  symbol = "🌙 ";
  style = "bg:green";
  format = '[ $symbol($version) ]($style)';

  [nodejs]
  symbol = "";
  style = "bg:green";
  format = '[ $symbol($version) ]($style)';

  [php]
  symbol = "";
  style = "bg:green";
  format = '[ $symbol($version) ]($style)';

  [java]
  symbol = "";
  style = "bg:green";
  format = '[ $symbol($version) ]($style)';

  [kotlin]
  symbol = "";
  style = "bg:green";
  format = '[ $symbol($version) ]($style)';

  [haskell]
  symbol = "";
  style = "bg:green";
  format = '[ $symbol($version) ]($style)';

  [python]
  symbol = "";
  style = "bg:green";
  format = '[ $symbol($version)($virtualenv) ]($style)';

  [docker_context]
  symbol = "";
  style = "bg:blue";
  format = '[ $symbol $context ]($style)';

  [kubernetes]
  symbol = "☸";
  style = "bg:blue";
  format = '[ $symbol $context ]($style)';

  [aws]
  symbol = "";
  style = "bg:blue";
  format = '[ $symbol($profile) ]($style)';

  [gcloud]
  symbol = "󱇶";
  style = "bg:blue";
  format = '[ $symbol $project ]($style)';

  [nix_shell]
  symbol = "";
  style = "bg:blue";
  format = '[ $symbol $name ]($style)';

  [time]
  disabled = false;
  time_format = "%R";
  style = "bg:cyan";
  format = '[  $time ]($style)';

  [battery]
  disabled = false;
  full_symbol = "🔋";
  charging_symbol = "⚡";
  discharging_symbol = "🔌";
  style = "bg:cyan";
  format = '[$symbol $percentage ]($style)';

  [cmd_duration]
  show_milliseconds = true;
  min_time = 1000;
  style = "bg:purple";
  format = '[/ $duration ]($style)';

  [character]
  success_symbol = '[❯](bold green)';
  error_symbol = '[❯](bold red)';
  vicmd_symbol = '[❮](bold yellow)';
}
