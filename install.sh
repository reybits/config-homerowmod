#!/bit/sh

echo "Activating Karabiner-VirtualHIDDevice-Manager..."
/Applications/.Karabiner-VirtualHIDDevice-Manager.app/Contents/MacOS/Karabiner-VirtualHIDDevice-Manager activate

echo "Starting Karabiner-VirtualHIDDevice-Daemon..."
sudo "/Library/Application Support/org.pqrs/Karabiner-DriverKit-VirtualHIDDevice/Applications/Karabiner-VirtualHIDDevice-Daemon.app/Contents/MacOS/Karabiner-VirtualHIDDevice-Daemon"

echo "Copying karabiner.plist..."
sudo cp org.pqrs.service.daemon.Karabiner-VirtualHIDDevice-Daemon.plist /Library/LaunchDaemons/

echo "Launching Karabiner..."
sudo launchctl bootstrap system /Library/LaunchDaemons/org.pqrs.service.daemon.Karabiner-VirtualHIDDevice-Daemon.plist

echo ""

echo "Copying kanata.plist..."
sudo cp org.custom.kanata.plist /Library/LaunchDaemons/

echo "Launching Kanata..."
sudo launchctl bootstrap system /Library/LaunchDaemons/org.custom.kanata.plist

echo Done.
