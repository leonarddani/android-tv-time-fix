# Android Date & Time Fix Scripts

This repository contains two shell scripts to automate fixing date/time settings and launching YouTube TV on an Android device. Both scripts run on the device using Termux:Boot. One requires root access, while the other does not.

## Why I Made This
I built this script to help people who aren’t familiar with using the TV.
The problem was that every time the electricity went out, the system date wouldn’t update properly — because the router powered on before the internet connection was ready.
This caused apps like YouTube TV to stop working.
So I made a script that automatically toggles the date settings off and on to force a time sync..

## What the Scripts Do
- Wait 20 seconds for the internet to be Available.
- Open Date & Time settings.
- Toggle off "Automatic date & time" and enable network-provided time using key events.
- Return to the home screen.
- Launch the YouTube TV app.
- Kill processes to save battery.

## Scripts
1. **fix-date.sh**: Runs with root (e.g., `sudo`) on Termux:Boot. Uses root paths (e.g., `/system/bin/input`).
2. **fix-date-adb.sh**: Non-root script for Termux:Boot. Uses standard `input` commands.

## Setup for Termux:Boot
1. **Install Termux and Termux:Boot**:
   - Download Termux from [F-Droid](https://f-droid.org/packages/com.termux/).
   - Install Termux:Boot:
     ```bash
     pkg install termux-boot
     ```
2. **Set Up Root for fix-date.sh**:
   - Ensure your device is rooted (e.g., using Magisk).
   - Install `tsu` in Termux for root access:
     ```bash
     pkg install tsu
     ```
3. **Copy Both Scripts**:
   - Save `fix-date.sh` and `fix-date-adb.sh` to `~/.termux/boot/`:
     ```bash
     mkdir -p ~/.termux/boot
     # Copy fix-date.sh and fix-date-adb.sh to ~/.termux/boot/
     chmod +x ~/.termux/boot/fix-date.sh
     chmod +x ~/.termux/boot/fix-date-adb.sh
     ```
4. **Test the Scripts**:
   - For `fix-date.sh` (root):
     ```bash
     sudo bash ~/.termux/boot/fix-date.sh
     ```
   - For `fix-date-adb.sh` (non-root):
     ```bash
     bash ~/.termux/boot/fix-date-adb.sh
     ```
5. **Enable on Boot**:
   - Reboot the device. Termux:Boot runs both scripts automatically.
   - For `fix-date.sh`, ensure `tsu` or another root method is set up to grant root at boot (e.g., via a Magisk module or custom script).
   - Disable battery optimization for Termux in Android settings (Settings > Apps > Termux > Battery > Allow background activity).

## Notes
- **Root Requirement**: `fix-date.sh` needs root to access `/system/bin/input`. I used to run it with `sudo`, but `fix-date-adb.sh` is a non-root alternative I made later.
- **Key Events**: The scripts use key events (e.g., ENTER = 66), which may vary by device or Android version. Test first.
- **YouTube TV**: If it doesn’t launch, verify the package name: `am start -n com.google.android.youtube.tv/.HomeActivity`.
- **Battery**: Both scripts use `pkill -u $(whoami)` to stop Termux processes after running.
- **Root Safety**: Be cautious with root scripts. Ensure `fix-date.sh` is secure (e.g., `chmod 700 ~/.termux/boot/fix-date.sh`).

## License
MIT License. Free to use and modify.
