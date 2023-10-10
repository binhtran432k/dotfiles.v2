{ ... }:
{
  programs.ripgrep = {
    enable = true;
    arguments = [
      "--smart-case"
      "--no-require-git"

      "--glob"
      "!**/{.git,.svn}"

      "--max-columns-preview"
      "--max-columns"
      "150"
    ];
  };
}
