`pacman` is the official Arch package manager. On CachyOS / Arch, this should be your **default choice**. It installs packages from official repositories configured on your system.

`yay` and `paru` are **AUR helpers**. The AUR is the Arch User Repository. It is not the same as official Arch repos. It contains user-maintained build scripts called `PKGBUILD`s. Use for Apps not available in official repos, especially when you want native system integration.
`paru` is written in Rust and has a slightly more cautious/default-review-focused workflow.
`yay` is older and very common.
For low-trust apps, Flatpak may be safer.

Flatpak is a universal app packaging system. It installs applications in a more isolated runtime environment, usually from Flathub. Flatpaks are mostly for **desktop apps**, not system packages. Some apps may feel less integrated than native packages. Use for Desktop apps where you want isolation or where the native/AUR package is messy.

AppImage is a portable app format. You download a single file, make it executable, and run it. It is not really a package manager. It is more like a portable executable bundle. Use AppImage for trying an app quickly, niche software, one-off tools, or apps where the author officially provides AppImage as the main Linux build.

# Practical priority order on CachyOS / Arch
1. pacman  
2. paru/yay  
3. Flatpak  
4. AppImag

pacman = official system packages  
paru/yay = pacman + AUR helper  
flatpak = sandboxed desktop apps  
AppImage = portable executable file

Note: For proprietary GUI apps Flatpak is often better than AUR.

## Use **pacman** for
kernels  
drivers  
KDE  
PipeWire  
Docker  
.NET SDK  
development tools  
Steam if available  
system libraries

## Use **paru/yay** for
AUR-only developer tools  
vendor-provided binaries  
niche Linux apps

## Use **Flatpak** for
Spotify  
Discord  
Slack  
Zoom  
GIMP/Krita if you want app isolation  
random proprietary GUI apps

## Use **AppImage** for
testing apps  
small niche tools  
apps that officially ship only as AppImage

# Installation
To install system packages run:
```
sudo pacman -S package_name
```

To install arch user repo package run:
```
yay package_name
```

or

```
paru package_name
```

To install flatpak package run:
```
flatpak install package_name
```

# Uninstall
The "safe and clean" way to remove a pacman package, its unneeded dependencies, and its configuration files
```
sudo pacman -Rns package_name
```

The "forceful and potentially dangerous" way to remove a pacman package without checking if other packages rely on it. Use with extreme care!
```
pacman -Rdd package_name
```

To uninstall flatpak package run:
```
flatpak uninstall pacakage_name
```

To uninstall aur (arch user repository) package run:
```
paru uninstall package_name 
```

or

```
yay uninstall package_name
```

# Update
To update all pacman packages run:
```
sudo pacman -Syu
```

or 

```
sudo pacman -Syyu
```

To update all aur (arch user repository) packages and pacman packages run:
```
paru 
```

or

```
yay
```

To update flatpak packages run:
```
flatpak update
```

# Search installed pacman package
```
pacman -Q --info package_name
```

# List orphans
```
pacman -Qdt
```

## Remove orphans
```
pacman -Qdtq | pacman -Rns -
```

# Clear pacman cache
```
sudo pacman -Scc
```