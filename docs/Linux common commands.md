# Command info

If you want to see command options (in short way, give me the tl;dr)
```
tldr package_name
```

If you want to see the verbose version (full on manual)
```
man package_name
```
# Startup programs
Enable app on startup
```
systemctl --user enable app_name
```

Disable on startup
```
systemctl --user disable app_name
```

Disable and stop now
```
systemctl --user disable --now app_name
```

Check status
```
systemctl --user status app_name
```

Check if it's running
```
systemctl --user is-active sunshine
```

# Troubleshooting
## Checking system logs for errors/warnings
Last boot warnings
```
journalctl -b -1 -p warning
```

All warnings
```
journalctl -p warning
```

Last boot errors
```
journalctl -b -p err
```

Last hour errors
```
journalctl --since "1 hour ago" -p err
```

KDE issues on current boot
```
journalctl --user-unit plasma-kwin_wayland --boot 0
```

## Checking kernel boot messages
```
sudo dmesg
```

## Check boot time
```
systemd-analyze blame
```

## See app startup times
```
time firefox
```

# Opening ports

```
sudo ufw allow port_nr/protocol (udp/tcp)
```



