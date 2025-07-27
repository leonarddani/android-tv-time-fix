#!/data/data/com.termux/files/usr/bin/bash

echo "🔧 Running the fix-date script..."
echo "⏳ Waiting 150 seconds before starting..."
sleep 150

echo "📂 Opening Date & Time settings..."
am start -a android.settings.DATE_SETTINGS
sleep 10

echo "🕹️ Navigating settings..."

# Step 1: Go down once (for stability)
/system/bin/input keyevent 20
sleep 0.5

# Step 2: Go up to land on 'Automatic date & time'
/system/bin/input keyevent 19
sleep 0.5

# Step 3: Press OK to toggle automatic time OFF
echo "[Step 1] Disabling automatic date & time..."
/system/bin/input keyevent 66
sleep 1

# Step 4: Move to manual/network time options
/system/bin/input keyevent 20
sleep 0.5

# Step 5: Press OK twice to select manual mode
/system/bin/input keyevent 66
sleep 1
/system/bin/input keyevent 66
sleep 1

# Step 6: Move up to network-provided time
echo "[Step 2] Enabling network-provided time..."
/system/bin/input keyevent 19
sleep 0.5
/system/bin/input keyevent 66
sleep 1
/system/bin/input keyevent 66
sleep 1

# Step 7: Return to home screen
echo "🏠 Returning to home screen..."
/system/bin/input keyevent 3
sleep 2

# Step 8: Launch YouTube TV app
echo "▶️ Launching YouTube TV app..."
am start -n com.google.android.youtube.tv/.HomeActivity || echo "[!] Could not open YouTube TV app."

# Step 9: Exit Termux shell
echo "🚪 Exiting Termux..."
exit
