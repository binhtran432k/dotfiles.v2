{
  description = "Home Manager configuration of binhtran432k";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = inputs@{ nixpkgs, home-manager, nixos-hardware, ... }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    home-user = {
      username = "binhtran432k";
      fullname = "Binh Duc Tran";
      email = "binhtran432k@gmail.com";
      mail-app = "thunderbird";
      browser-app = "brave";
      terminal-app = "kitty";
      colorscheme = import ./colorschemes/dracula.nix;
      wallpaper = pkgs.fetchurl {
        url = "https://github.com/binhtran432k/dotfiles/releases/download/resource/nix-wallpaper-minimal.png";
        sha256 = "1f5f2fff5e696eeee56e183a79a76c127587177525f338bb9138dba9678826e5";
      };
      theme = {
        package = pkgs.adw-gtk3;
        name = "adw-gtk3-dark";
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
        ./modules/nixos/i3.nix
      ];
      home-module = import ./home/linux/desktop-i3.nix;
    };

    x64-specialArgs = {
      user = home-user;
    } // inputs;
  in {
    nixosConfigurations = let
      base-args = {
        inherit home-manager;
        nixpkgs = nixpkgs;
        system = systems.linux;
        specialArgs = x64-specialArgs;
      };
    in {
      kouta = mkNixosSystem (kouta-modules // base-args);
    };

    homeConfigurations = {
      ${home-user.username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home ];
        extraSpecialArgs = x64-specialArgs;
      };
    };
  };
}
