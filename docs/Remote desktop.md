# Remote desktop
## Sunshine (Streaming/remote desktop)
[Sunshine](https://github.com/lizardbyte/sunshine) is primarily made for game streaming, but it works as a remote desktop as well
On host install:
`sudo pacman -S sunshine`

On client install [moonlight](https://moonlight-stream.org/) app

Open firewall for sunshine on host
```
sudo ufw allow 47984/tcp 
sudo ufw allow 47989/tcp 
sudo ufw allow 47990/tcp 
sudo ufw allow 48010/tcp
sudo ufw allow 47998/udp
sudo ufw allow 47999/udp
sudo ufw allow 48000/udp
```
