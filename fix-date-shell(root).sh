#!/data/data/com.termux/files/usr/bin/bash

echo "🔧 Running the fix-date script..."
echo "⏳ Waiting 1 seconds before starting..."
sleep 1

echo "📂 Opening Date & Time settings..."
am start -a android.settings.DATE_SETTINGS
sleep 10

echo "🕹️ Navigating settings..."

# Step 1: Go down once (for stability)
input keyevent 20
sleep 0.5

# Step 2: Go up to land on 'Automatic date & time'
input keyevent 19
sleep 0.5

# Step 3: Press OK to toggle automatic time OFF
echo "[Step 1] Disabling automatic date & time..."
input keyevent 66
sleep 1

# Step 4: Move to manual/network time options
input keyevent 20
sleep 0.5

# Step 5: Press OK twice to select manual mode
input keyevent 66
sleep 1
input keyevent 66
sleep 1

# Step 6: Move up to network-provided time
echo "[Step 2] Enabling network-provided time..."
input keyevent 19
sleep 0.5
input keyevent 66
sleep 1
input keyevent 66
sleep 1

# Step 7: Return to home screen
echo "🏠 Returning to home screen..."
input keyevent 3
sleep 2

# Step 8: Launch YouTube TV app
echo "▶️ Launching YouTube TV app..."
am start -n com.google.android.youtube.tv/.HomeActivity || echo "[!] Could not open YouTube TV app."
sleep 2

# Step 9: Terminate Termux and related processes to save battery
echo "🧹 Cleaning up processes..."
pkill -u $(whoami)  # Kill all processes owned by the Termux user
echo "🚪 Exiting Termux..."