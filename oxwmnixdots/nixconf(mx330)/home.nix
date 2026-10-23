{ config, pkgs, ... }:

{
    home.username = "nyue";
    home.homeDirectory = "/home/nyue";
    programs.git.enable = true;
    home.stateVersion = "26.05";
    programs.bash = {
         enable = true;
         shellAliases = {
              btw = "echo I use nixos, btw";
         };
    };
}
