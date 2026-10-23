{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./everywheres.nix
      ./mx330.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  networking.firewall.checkReversePath = false;
  networking.hostName = "mitty-btw";

  networking.wireless.enable = false; 
  networking.wireless.iwd = {
    enable = true;
    settings = {
      General = {
        EnableNetworkConfiguration = true;
      };
     };
   };

  time.timeZone = "America/Caracas";

  i18n.defaultLocale = "en_US.UTF-8";
  
  programs.nix-ld.enable = true;
  services.xserver.enable = true;
  services.xserver.windowManager.oxwm.enable = true;
  services.displayManager.ly.enable = true;

   users.users.rostro = {
     isNormalUser = true;
     extraGroups = [ "wheel" "networkmanager" "storage" "disk" "keyd" "input" "video" ];
     packages = with pkgs; [
       tree
       neovim 
       wget
       git
       unzip
       gcc
       xdg-utils
       shared-mime-info
       pciutils
       brightnessctl
       xdg-terminal-exec
       mpv
       nemo
       nix-index
       mako
       foot
       graphviz
       localsend
       taglib
       onlyoffice-desktopeditors
       inputs.swindle.packages.${pkgs.stdenv.hostPlatform.system}.default
       inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
       inputs.make2flake.packages.${pkgs.stdenv.hostPlatform.system}.default
       inputs.m701.packages.${pkgs.stdenv.hostPlatform.system}.default
       inputs.sb.packages.${pkgs.stdenv.hostPlatform.system}.default
       inputs.termipedia.packages.${pkgs.stdenv.hostPlatform.system}.default
       gnome-keyring
       wireguard-tools
       openvpn
       powertop
       btop
       nvtopPackages.full
       qbittorrent
       mercurial
       gnumake
       busybox
       pkg-config
       efibootmgr
       curl
       gcc
       waybar
       alacritty
       kitty
       kdePackages.dolphin
       ventoy-full
     ];
   };
   nixpkgs.config.permittedInsecurePackages = [ "ventoy-full" "ventoy-1.1.12" ];
   programs.appimage = { enable = true; binfmt = true; };
   nixpkgs.config.allowUnfree = true;
   environment.systemPackages = with pkgs; [
   dunst
   dmenu
   rofi
   wofi
   feh
   xclip
   maim
   ];

    fonts.packages = with pkgs; [
     nerd-fonts.jetbrains-mono
     nerd-fonts.caskaydia-cove
     nerd-fonts.meslo-lg
     meslo-lgs-nf
    ];

  programs.zsh.enable = true;
  programs.zsh = {
   autosuggestions.enable = true;
   zsh-autoenv.enable = true;
   syntaxHighlighting.enable = true;
   shellAliases = {
   nixrebuild="sudo nixos-rebuild switch";
   cdnix="cd /etc/nixos";
   nixconfig="sudo nvim /etc/nixos/configuration.nix";
   nixflakes="sudo nvim /etc/nixos/flake.nix";
   nixsweets="sudo nvim /etc/nixos/sweets.nix";	
   };
  };

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "26.05"; 

}

