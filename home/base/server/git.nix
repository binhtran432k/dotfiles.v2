{ pkgs, user, ... }:
let
  userfullname = user.fullname;
  useremail = user.email;
in
  {
    programs.git = {
      enable = true;
      lfs.enable = true;

      userName = userfullname;
      userEmail = useremail;

      extraConfig = {
        init.defaultBranch = "main";
        push.autoSetupRemote = true;
        pull.rebase = true;
      };
    };
  }
