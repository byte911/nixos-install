parted /dev/sda -- mklabel msdos
parted /dev/sda -- mkpart primary 1MiB -8GiB
parted /dev/sda -- mkpart primary linux-swap -8GiB 100%

mkfs.btrfs -L nixos /dev/sda1
mkswap -L swap /dev/sda2
swapon /dev/sda2

mount /dev/disk/by-label/nixos /mnt

nixos-generate-config --root /mnt
nano /mnt/etc/nixos/configuration.nix

nixos-install
reboot
