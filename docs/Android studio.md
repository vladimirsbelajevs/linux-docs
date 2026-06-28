# Android studio
## Authorize Android ADB
If you get an error in VS code when connecting your phone using cable "Flutter daemon has terminated."

For me the solution was as follows:

step 1:
go to the location of adb executable file
mine was in: /home/vladimirs/Android/Sdk/platform-tools/

step 2:
then - in terminal after navigating to the previous location - run sudo ./adb devices

step 3:
The previous command will trigger a message on your phone asking you to authorize debugging

Check the 'Always allow' box

then proceed.

step 4:
Congrats, now the problem is gone.

Install packages needed  
sudo pacman -S jdk-openjdk