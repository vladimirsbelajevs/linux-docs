# Recover borked linux from live CD
## CachyOS chroot helper
See the official documentation for details: [chroot](https://wiki.cachyos.org/features/cachy_chroot/)

## Manual approach

1. Run command to list all your disks:
```
sudo lsblk
```

2. Mount root partition (probably a partition UNDER sda or nvme):
// The /dev/ is hard-coded it's nothing related to your partitions  
```
sudo mkdir /mnt/arch
sudo mount /dev/sda2 /mnt/arch
```

3. Mount virtual file systems
```
sudo mount --bind /dev /mnt/arch/dev 
sudo mount --bind /proc /mnt/arch/proc 
sudo mount --bind /sys /mnt/arch/sys
```

4. chroot into system
```
arch-chroot /mnt/arch
```

5. Revert the pacakge that broke
Check the cache: 
```
sudo  ls /var/cache/pacman/pkg/linux-firmware*
```

Downgrade: 
```
sudo pacman -U /var/cache/pacman/pkg/linux-firmware-YOUR_OLD_VERSION.pkg.tar.zst 
```
  
If you have problems with overwrites then use --overwrite flag:  
```
pacman -U --overwrite '/usr/lib/firmware/*' /var/cache/pacman/pkg/linux-firmware-20250313.12fe085f-6-any.pkg.tar.zst
```

6. Exit the chroot
```
exit
```

7. Unmount the system
```
sudo umount /mnt/arch/dev 
sudo umount /mnt/arch/proc 
sudo umount /mnt/arch/sys umount /mnt/arch
```

8. Reboot
```
reboot
```