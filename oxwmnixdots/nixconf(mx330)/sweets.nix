{ config, pkgs, libs, inputs, ... }:

{
   imports = [
#    inputs.spicetify-nix.nixosModules.default
   ];

   programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
   };
   services.flatpak.enable = true;
   xdg.portal = {
     enable = true;
     extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
     config.common.default = "gtk"; # Sets GTK as the fallback portal handler
   }; 
   environment.systemPackages = with pkgs; [
   fastfetch
   hyfetch
   vesktop
   steam
   heroic
   ripgrep
   nil
   nixpkgs-fmt
   nodejs
   yazi
   impala
   youtube-tui
   anup
   telegram-desktop
   iwd
   termusic
   ytermusic
   bluetui
   mangal
   manga-cli
   manga-tui
   ani-cli
   mov-cli
   sayonara
   lutris
   javaPackages.compiler.temurin-bin.jdk-21
   javaPackages.compiler.temurin-bin.jdk-25
   cl-wordle
   cava
   lavat
   obs-studio
   ]; 

 }
