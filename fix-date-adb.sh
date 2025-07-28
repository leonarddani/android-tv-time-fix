#!/data/data/com.termux/files/usr/bin/bash

echo "🔧 Running the fix-date script via ADB..."
adb start-server
echo "⏳ Waiting 20 seconds before starting..."
sleep 20

echo "📂 Opening Date & Time settings..."
adb shell am start -a android.settings.DATE_SETTINGS
sleep 10

echo "🕹️ Navigating settings..."

# Step 1: Go down once (for stability)
adb shell input keyevent 20
sleep 0.5

# Step 2: Go up to land on 'Automatic date & time'
adb shell input keyevent 19
sleep 0.5

# Step 3: Press OK to toggle automatic time OFF
echo "[Step 1] Disabling automatic date & time..."
adb shell input keyevent 66
sleep 1

# Step 4: Move to manual/network time options
adb shell input keyevent 20
sleep 0.5

# Step 5: Press OK twice to select manual mode
adb shell input keyevent 66
sleep 1
adb shell input keyevent 66
sleep 1

# Step 6: Move up to network-provided time
echo "[Step 2] Enabling network-provided time..."
adb shell input keyevent 19
sleep 0.5
adb shell input keyevent 66
sleep 1
adb shell input keyevent 66
sleep 1

# Step 7: Return to home screen
echo "🏠 Returning to home screen..."
adb shell input keyevent 3
sleep 2

# Step 8: Launch YouTube TV app
echo "▶️ Launching YouTube TV app..."
adb shell am start -n com.google.android.youtube.tv/.HomeActivity || echo "[!] Could not open YouTube TV app."
sleep 2

# Step 9: Clean up ADB processes on the host
echo "🧹 Cleaning up ADB processes..."
pkill -f adb  # Kill ADB processes on the host
echo "✅ Script completed."
