# Linux Optimizations
## Speed up boot

### Remove boot animations (Limine)

Permanent (remove splash and quite options from here)
Edit `/etc/default/limine` (run `sudo micro /etc/default/limine` to edit) and place options on the KERNEL_CMDLINE[default]+= line, creating it if necessary.  
Afterwards to update limine:  
```
sudo limine-update
```

Edit `/etc/mkinitcpio.conf` and remove plymouth from HOOKS.
Afterwards to rebuild initram run:
```
sudo limine-mkinitcpio
```

Remove the packages regarding plymouth
```
sudo pacman -Rns plymouth-git plymouth-kcm cachyos-plymouth-theme cachyos-plymouth-b
```

### Reduce boot times
```
sudo micro /boot/limine.conf
```
Set timeout to 3

afterwards run
```
sudo limine-mkinitcpio
```

### Boot performance investigation commands
#### Search slow all services  
```
systemd-analyze blame
```
#### Search slow user services  
```
systemd-analyze --user blame
```

## Linux BTRFS optimization
On Btrfs with `discard=async`, periodic `fstrim.timer` is usually redundant for that Btrfs filesystem.
`discard=async` and `fstrim` both inform the SSD which blocks are unused, but they do it differently. `discard=async` queues discards as space is freed; `fstrim` scans mounted filesystems periodically and issues TRIM in batches. Btrfs docs describe TRIM/discard as the mechanism that lets SSDs reclaim unused blocks, and Btrfs has async discard support for this purpose.

### How do I disable fstrim?
Run these commands:
```
sudo systemctl disable --now fstrim.timer
sudo systemctl mask fstrim.timer
```

Then verify:
```
systemctl is-enabled fstrim.timer
systemctl is-active fstrim.timer
systemctl status fstrim.timer --no-pager
```

Expected after disabling:
- is-enabled -> masked (or disabled if you skip mask)
- is-active -> inactive

If later you want it back:
```
sudo systemctl unmask fstrim.timer
sudo systemctl enable --now fstrim.timer
```
