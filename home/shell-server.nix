{ config
, lib
, pkgs
, ...
}: {
  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      export PATH="$PATH:$HOME/.bin:$HOME/.local/bin"
      export PATH="$HOME/.npm-packages/bin:$PATH"
    '';
  };

  programs.fish = {
    enable = true;
    functions = {
      fish_greeting = "";
    };
    shellInit = ''
      # custom export
      export PATH="$PATH:$HOME/.bin:$HOME/.local/bin"
      export PATH="$PATH:$HOME/.npm-packages/bin"

      # make fish work with vim mode
      fish_vi_key_bindings
    '';
    interactiveShellInit =
      let
        cfg = config.programs.starship;
        starshipCmd = "${config.home.profileDirectory}/bin/starship";
        carapaceCmd = "${config.home.profileDirectory}/bin/carapace";
      in
      lib.mkAfter ''
        # Starship
        if test "$TERM" != "dumb"
          eval (${starshipCmd} init fish)
          ${lib.optionalString cfg.enableTransience "enable_transience"}
        end

        # Carapace
        ${carapaceCmd} _carapace | source
      '';
  };

  home.file = (
    # Convert the entries from `carapace --list` to empty
    # home.file.".config/fish/completions/NAME.fish" entries.
    #
    # This is to disable fish buildin completion for each of the
    # carapace-supported completions It is in line with the instructions from
    # carapace-bin:
    #
    #   carapace --list | awk '{print $1}' | xargs -I{} touch ~/.config/fish/completions/{}.fish
    #
    # See https://github.com/rsteube/carapace-bin#getting-started
    let
      carapaceListFile =
        pkgs.runCommandLocal "carapace-list"
          {
            buildInputs = [ pkgs.carapace ];
          } ''
          carapace --list > $out
        '';
    in
    lib.pipe carapaceListFile [
      lib.fileContents
      (lib.splitString "\n")
      (builtins.map (builtins.match "^([a-z0-9-]+) .*"))
      (builtins.filter (match: match != null && (builtins.length match) > 0))
      (builtins.map (match: builtins.head match))
      (builtins.map (name: {
        name = ".config/fish/completions/${name}.fish";
        value = { text = ""; };
      }))
      builtins.listToAttrs
    ]
  );

  programs = {
    starship = {
      enable = true;
      enableFishIntegration = false;
    };
  };

  home.packages = with pkgs; [
    carapace
  ];
}
