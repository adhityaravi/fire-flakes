<h1 align="center">
  <img src="https://github.com/user-attachments/assets/23ba47e9-0709-4445-8b2a-1665ac098d33" width="400">
</h1><br>

fire-flake is a  [Nix flake](https://nixos.wiki/wiki/Flakes) for an opinionated development environment.
> Currently in beta and focused on user-level configuration with future plans for full system-level NixOS management. There will be continuous breaking changes until maturity.

---

## Table of Contents

- [About](#about)
- [Features](#features)
- [Folder Structure](#folder-structure)
- [Installation](#installation)
- [Usage](#usage)
- [Requirements](#requirements)
- [Roadmap](#roadmap)
- [Contributing](#contributing)
- [License](#license)

---

## About

**fire-flake** is a modular system for setting up and managing personal Linux machines using **Nix Flakes** and **Home Manager**.

It aims to:

- Reproduce user-level setups across any Linux distribution
- Provide an easy, opinionated starting point for managing programs and dotfiles
- Prepare for future full system-level configurations for NixOS

Currently in **beta**, focused on **user programs**, **dotfiles**, and **development environments**.

You can find a template private configuration repository here: [fire-flake-config](https://github.com/adhityaravi/fire-flake-config).

---

## Features

- 📦 **Nix Flakes** powered: fully reproducible, atomic configuration
- 🏠 **Home Manager** based user-level setup
- 💻 **Linux agnostic** (Ubuntu, Arch, Fedora, etc.)
- 🔐 **Private configuration repo support**
- 🔥 **DevShells** for consistent development tooling
- 🚀 **Bootstrap script** to install Nix and Home Manager easily
- 🌳 **Future**: NixOS system configuration, secrets management (sops-nix)

---

## Folder Structure

| Folder | Description |
|:-------|:------------|
| `devShell/` | Development shells (default dev tools, linters, bootstraps) |
| `lib/` | Shared libraries (e.g., dynamic variable loader `loadVars.nix`) |
| `home-modules/` | Home Manager modules (programs like Git, Neovim, etc.) |
| `nixos-modules/` | (Planned) NixOS system configuration modules |
| `overlays/` | (Planned) Package overlays and custom package builds |
| `profiles/hosts/` | Host-specific configs (e.g., `laptop/`, `server/`) |
| `profiles/users/` | User-specific configs (e.g., `default/`) |
| `secrets/` | (Planned) Encrypted secrets management |
| `vars/` | Local user variables (e.g., Git name/email, homeDirectory) |
| `install-nix.sh` | Bootstrap script to install Nix and Home Manager |

---

## Installation

### 1. Clone this repository

```bash
git clone https://github.com/adhityaravi/fire-flake.git
cd fire-flake
```

### 2. Run the installer

```bash
./install-nix.sh
```

This will:

- Install the **Nix package manager**
- Enable **Flakes** and **experimental features**
- Install **Home Manager** at the user profile level

---

## Usage

After installation:

```bash
home-manager switch --flake .#default
```

This will:

- Set up user programs
- Configure dotfiles
- Apply system-wide user preferences

Users are expected to provide their user-specific information (such as `username`, `email`, etc.) inside the `vars/` folder. This can be done by:

- Copying `vars/template.nix` to `vars/<your-linux-username>.nix` and editing it with your details.
- Alternatively, by using a private configuration repository like [fire-flake-config](https://github.com/adhityaravi/fire-flake-config) which contains a predefined structure.

To update configuration if you change your private repo:

```bash
nix flake update fire-flake-config
home-manager switch --flake .#default
```

---

## Requirements

- Modern **Linux OS** (Ubuntu, Fedora, Arch, etc.)
- **Nix** package manager (installed via `install-nix.sh`)
- Basic **Git** setup
- SSH keys added to GitHub if configuring via a private repo 

---

## Roadmap

- [x] Modular user-level Home Manager setup
- [x] Private repo integration for personal secrets and vars
- [x] Multi-host and multi-user profile support
- [ ] GitHub Actions CI validation
- [ ] Extend available programs for a ready-out-of-bag setup
- [ ] Secrets management with sops-nix
- [ ] NixOS full system configuration
- [ ] Bootstrap flow for system setup

---

## Contributing

**Contributions are welcome!** 🎉

> As this is an opinionated setup for now, contributions around:
> - New devShell templates
> - New Home Manager modules (programs)
> - System-level expansion (NixOS modules)
> - Secrets encryption (sops-nix integration)

will be prioritized.

**Fork**, create a branch, and submit a pull request!

---

## License

#todo
