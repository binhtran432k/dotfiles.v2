{ user, ... }: {
  imports = [
    ./shell-linux.nix
    ./btop.nix
    ./system-tools.nix
  ];

  home = {
    username = user.username;
    homeDirectory = "/home/${user.username}";

    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    stateVersion = "23.05"; # Please read the comment before changing.
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
