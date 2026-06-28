# NVIDIA
## Uninstalling nvidia drivers
```
sudo pacman -R nvidia-settings
sudo pacman -R lib32-nvidia-utils
sudo pacman -R libxnvctrl
sudo pacman -R nvidia-hook
sudo pacman -R nvidia-dkms
sudo pacman -R nvidia-utils
sudo pacman -R egl-x11
sudo pacman -R egl-gbm
sudo pacman -R egl-wayland
```

## Install again
```
sudo pacman -R nvidia-inst
```
