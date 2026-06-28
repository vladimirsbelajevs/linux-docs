# Jellyfin (media server)
Fix container permission issues to the folder
```
sudo chown -R $USER:jellyfin /media/jellyfin  
sudo chmod -R g+rw /media/jellyfin
```