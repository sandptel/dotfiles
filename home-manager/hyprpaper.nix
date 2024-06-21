{pkgs,...}:
{
  home.packages=with pkgs;[
    hyprpaper
  ];
  home.file.".images"={
    source= ./.images;
  };
}