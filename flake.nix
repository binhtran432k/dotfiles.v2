{
  description = "Home Manager configuration of binhtran432k";

  outputs =
    inputs @ { nixpkgs
    , nixpkgs-staging
    , home-manager
    , nixos-hardware
    , neovim-nightly-overlay
    , ...
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      colorscheme = import ./colorschemes/dracula.nix { inherit pkgs; };
      home-user = {
        inherit colorscheme;
        username = "binhtran432k";
        fullname = "Binh Duc Tran";
        email = "binhtran432k@gmail.com";
        mail-app = "thunderbird";
        browser-app = "brave";
        terminal-app = "wezterm";
        wallpaper = pkgs.fetchurl {
          url = "https://github.com/binhtran432k/dotfiles/releases/download/resource/nix-wallpaper-minimal.png";
          sha256 = "1f5f2fff5e696eeee56e183a79a76c127587177525f338bb9138dba9678826e5";
        };
        lockscreen-wallpaper = pkgs.fetchurl {
          url = "https://github.com/binhtran432k/dotfiles/releases/download/resource/linux-wallpaper-minimal.png";
          sha256 = "85742e0f269d6bc9e90e0fdc85825a9c1c70f590d5b948176d8802966c8d795f";
        };
        theme = {
          inherit (colorscheme.gtk) package name;
        };
        icon = {
          package = pkgs.papirus-icon-theme;
          name = "Papirus-Dark";
        };
        cursor = {
          package = pkgs.bibata-cursors;
          name = "Bibata-Modern-Classic";
          size = 24;
        };
      };
      systems = {
        linux = "x86_64-linux";
        darwin = "x86_64-darwin";
        riscv = "riscv64-linux";
        aarch = "aarch64-linux";
      };

      mkNixosSystem = import ./lib/mkNixosSystem.nix;

      kouta-modules = {
        nixos-modules = [
          ./hosts/kouta
          ./modules/i3.nix
        ];
        home-module = import ./home/desktop-i3.nix;
      };

      mypkgs = import ./pkgs { inherit pkgs; };

      x64-specialArgs =
        {
          inherit mypkgs neovim-nightly-overlay;
          user = home-user;
          pkgs-staging = import nixpkgs-staging {
            system = systems.linux;
            config.allowUnfree = true;
          };
        }
        // inputs;
    in
    {
      nixosConfigurations =
        let
          base-args = {
            inherit home-manager;
            nixpkgs = nixpkgs;
            system = systems.linux;
            specialArgs = x64-specialArgs;
          };
        in
        {
          kouta = mkNixosSystem (kouta-modules // base-args);
        };

      homeConfigurations = {
        ${home-user.username} = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home ];
          extraSpecialArgs = x64-specialArgs;
        };
      };

      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;
    };

  # This is the standard format for flake.nix. `inputs` are the dependencies of the flake,
  # Each item in `inputs` will be passed as a parameter to the `outputs` function after being pulled and built.
  inputs = {
    # There are many ways to reference flake inputs. The most widely used is github:owner/name/reference,
    # which represents the GitHub repository URL + branch/commit-id/tag.

    # Official NixOS package source, using nixos's stable branch by default
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-staging.url = "github:nixos/nixpkgs/staging";

    # for macos
    nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-23.05-darwin";
    nix-darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # modern window compositor
    hyprland.url = "github:hyprwm/Hyprland/v0.28.0";
    # community wayland nixpkgs
    nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";

    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
      # inputs.neovim-flake.url = "github:neovim/neovim?dir=contrib&rev=ac353e87aecf02315d82a3ad22725d2bc8140f0c";
    };
  };

  # the nixConfig here only affects the flake itself, not the system configuration!
  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];

    # nix community's cache server
    extra-substituters = [
      "https://hyprland.cachix.org"
      "https://nix-community.cachix.org"
      "https://nixpkgs-wayland.cachix.org"
    ];
    extra-trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
    ];
  };
}
