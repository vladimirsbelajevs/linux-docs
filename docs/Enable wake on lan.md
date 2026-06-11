Show the current networks
```
nmcli con show
```

Show if is enabled
```
nmcli c show "Wired connection 1" | grep 802-3-ethernet.wake-on-lan  
```
If not magic then not enabled.

Enable using 
```
nmcli c modify "Wired connection 1" 802-3-ethernet.wake-on-lan magic
```