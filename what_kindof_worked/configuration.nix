{ config, pkgs, lib, ... }:
{

  security.polkit.enable = false;
  services.udisks2.enable = false;

  programs.command-not-found.enable = false;

  system.boot.loader.kernelFile = lib.mkForce "Image";

  # installation-device.nix forces this on. But it currently won't
  # cross build due to w3m
  services.nixosManual.enable = lib.mkOverride 0 false;
  services.nixosManual.showManual = lib.mkOverride 0 false;
  documentation.enable = lib.mkOverride 0 false;
  documentation.man.enable = lib.mkOverride 0 false;
  documentation.info.enable = lib.mkOverride 0 false;
  documentation.doc.enable = lib.mkOverride 0 false;
  documentation.dev.enable = lib.mkOverride 0 false;
  documentation.nixos.enable = lib.mkOverride 0 false;

  nix.trustedUsers = [ "root" "user" ];

  # installation-device.nix turns this off.
  systemd.services.sshd.wantedBy = lib.mkOverride 0 ["multi-user.target"];

  nixpkgs.crossSystem = { system = "aarch64-linux"; config = "aarch64-unknown-linux-gnu"; };

  nix.checkConfig = false;
  networking.wireless.enable = lib.mkForce false;

  imports = [./sd-image-aarch64-ssh.nix];

}
