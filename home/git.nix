{ pkgs, user, ... }:
let
  userfullname = user.fullname;
  useremail = user.email;
in
  {
    home.packages = with pkgs; [
      git-credential-oauth
    ];

    programs.git = {
      enable = true;
      lfs.enable = true;
      delta.enable = true;

      userName = userfullname;
      userEmail = useremail;

      extraConfig = {
        init.defaultBranch = "main";
        push.autoSetupRemote = true;
        pull.rebase = true;
        credential.helper = [
          "cache --timeout 7200"
          "oauth"
        ];
      };
    };
  }
