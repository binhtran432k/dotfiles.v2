{ pkgs, ... }:
{
  home.sessionPath = [
    "$HOME/.npm-packages/bin"
    "$HOME/.bin:$HOME/.local/bin"
  ];
  programs = {
    bash = {
      enable = true;
      enableCompletion = true;
    };

    fish = {
      enable = true;
      functions = {
        fish_greeting = "macchina";
      };
      shellInit = ''
        # make fish work with vim mode
        fish_vi_key_bindings
      '';
    };

    nushell = {
      enable = true;
      extraConfig =
        let
          custom-completions = [
            "bitwarden-cli"
            "btm"
            "cargo"
            "git"
            "glow"
            "just"
            "make"
            "nix"
            "npm"
            "zellij"
          ];
        in
        ''
          ${builtins.concatStringsSep "\n"
            (map
              (x: "use ${pkgs.nu_scripts}/share/nu_scripts/custom-completions/${x}/${x}-completions.nu *")
              custom-completions)}

          $env.config = {
            edit_mode: vi
          }
        '';
    };

    starship = {
      enable = true;
    };

    carapace = {
      enable = true;
      enableNushellIntegration = false;
    };
  };
}
