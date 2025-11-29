#!/bit/sh

echo "Unloading Kanata..."
sudo launchctl bootout system /Library/LaunchDaemons/org.custom.kanata.plist

echo "Removing kanata.plist..."
sudo rm -f "/Library/LaunchDaemons/org.custom.kanata.plist"

echo ""

echo "Unloading karabiner.plist..."
# sudo launchctl unload /Library/LaunchDaemons/org.pqrs.service.daemon.Karabiner-VirtualHIDDevice-Daemon.plist
sudo launchctl bootout system /Library/LaunchDaemons/org.pqrs.service.daemon.Karabiner-VirtualHIDDevice-Daemon.plist

echo "Removing karabiner.plist..."
sudo rm -f "/Library/LaunchDaemons/org.pqrs.service.daemon.Karabiner-VirtualHIDDevice-Daemon.plist"

echo ""
echo "Uninstalling Karabiner-DriverKit-VirtualHIDDevice..."

bash "/Library/Application Support/org.pqrs/Karabiner-DriverKit-VirtualHIDDevice/scripts/uninstall/deactivate_driver.sh"
sudo bash "/Library/Application Support/org.pqrs/Karabiner-DriverKit-VirtualHIDDevice/scripts/uninstall/remove_files.sh"
sudo killall Karabiner-VirtualHIDDevice-Daemon

echo "Removing /Library/Application Support/org.pqrs..."
sudo rm -fr "/Library/Application Support/org.pqrs"

echo Done.
