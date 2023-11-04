{ pkgs
, user
, ...
}:
let
  userfullname = user.fullname;
  useremail = user.email;
in
{
  home.packages = [
    pkgs.git-credential-oauth
  ];

  programs.git = {
    enable = true;
    lfs.enable = true;
    delta = {
      enable = true;
      options = {
        syntax-theme = user.colorscheme.delta;
      };
    };

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
