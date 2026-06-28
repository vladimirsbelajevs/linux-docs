# Linux installation
I recommend installing [CachyOS (Arch)](https://cachyos.org/download/) for up-to-date packages as Arch is a rolling release.
When installing choose **BTRFS file-system** with **Limine as bootloader** for snapshot support for easy rollbacks in case of bad updates (or breaking system while thinkering).
For desktop environment choose **KDE as it's closer in feel to Windows** (and has a lot of customization options). For interactive terminal shell use Fish (as it has good autocomplete/history), you can switch to bash in terminal using "bash" command. For AUR installer I prefer paru, but you can also use yay (then just substitute in pages where I have paru with yay). In a lot of tutorials for editing files from terminal they use nano, but I prefer [micro](https://micro-editor.github.io/) as it has saner default keybindings

## Post install 
For terminal good option is [ghostty](https://ghostty.org/) install it using and set it as default
```
sudo pacman -S ghostty
```

Install micro if it's not already installed
```
sudo pacman -S micro
```

Install flatpak for GUI sandboxed apps (see [Package management (App install)](Package%20management%20%28App%20install%29.md) for more details about different ways to install packages and apps)
```
sudo pacman -S flatpak
```

For managing flatpak app permissions install [flatseal](https://flathub.org/en/apps/com.github.tchx84.Flatseal)
```
flatpak install flathub com.github.tchx84.Flatseal
```

Install [gearlever](https://flathub.org/en/apps/it.mijorus.gearlever) for easer managment of AppImages
```
flatpak install flathub it.mijorus.gearlever
```

For teams use [Teams for linux](flatpak install flathub com.github.IsmaelMartinez.teams_for_linux) flatpak
```
flatpak install flathub com.github.IsmaelMartinez.teams_for_linux
```

For slack use [this](https://flathub.org/en/apps/com.slack.Slack)
```
flatpak install flathub com.slack.Slack
```

For document editing install [LibreOffice](https://flathub.org/en/apps/org.libreoffice.LibreOffice)
```
flatpak install flathub org.libreoffice.LibreOffice
```

For HTTP requests use [Bruno](flatpak install flathub com.usebruno.Bruno) (Postman alternative, easy to use with git for team sync)
```
flatpak install flathub com.usebruno.Bruno
```

For better Discord use [Vesktop](https://flathub.org/en/apps/dev.vencord.Vesktop)
```
flatpak install flathub dev.vencord.Vesktop
```

For notes, knowledge base you can use [Obsidian](flatpak install flathub md.obsidian.Obsidian)
```
flatpak install flathub md.obsidian.Obsidian
```

You can download VS code from AUR:
```
paru visual-studio-code-bin
```

You can browse flathub for more GUI apps https://flathub.org/en
For system packages you can browse https://archlinux.org/packages/
For User repository https://aur.archlinux.org/

If you really have no other alternative for an app you want to run you can use [WinBoat](https://aur.archlinux.org/packages/winboat-bin) for Windows VM:
```
paru winboat-bin
```

## Mounting additional drives
If you have more than one drive on your PC you can configure so that rest of the drives are automounted on boot (so that you don't have to mount it manually every time in dolphin)
[Here is tutorial from Cachy wiki](https://wiki.cachyos.org/configuration/automount_with_fstab/#_top)