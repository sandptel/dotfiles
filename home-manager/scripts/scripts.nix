{pkgs,...}:
{
#shell script is defined in in phone.nix which is being imported as executable here  
home.packages = [
  (import ./phone.nix {inherit pkgs;})
];
}