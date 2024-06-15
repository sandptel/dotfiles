{pkgs,...}:
{
#shell script is defined in in phone.nix which is being imported as executable here  
home.packages = [
  (import ./phone.nix {inherit pkgs;})
  #"${import ./phone.nix {inherit pkgs;}}" this one is also correct
];
}