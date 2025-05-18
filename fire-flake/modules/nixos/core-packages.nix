{ pkgs, lib, nodeConfig ? {}, ... }:

let
  debug = nodeConfig.debug or false;
in
{
  environment.systemPackages = with pkgs; [
    # 🧱 Core sysadmin essentials (always included)
    vim
    git
    curl
    wget
    htop
    btop
    ncdu
    iproute2
    iputils
    dnsutils
    lsof
    file
    tree
    unzip
    xz
    zstd
    jq
    yq-go
  ] ++ lib.optionals debug [
    # 🧪 Optional debugging/quality-of-life tools
    bat         # pretty `cat`
    eza         # modern `ls`
    iftop       # bandwidth monitor
    tcpdump     # packet sniffer
    neofetch    # system info
    strace      # syscall tracer
    ltrace      # library call tracer
  ];
}

