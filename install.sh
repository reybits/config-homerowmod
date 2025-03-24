#!/bit/sh

echo "Copying karabiner.plist into /Library/LaunchDaemons/"
sudo cp org.custom.karabiner.plist /Library/LaunchDaemons/

echo "Launching Karabiner"
sudo launchctl load /Library/LaunchDaemons/org.custom.karabiner.plist

echo ""

echo "Copying kanata.plist into ~/Library/LaunchAgents/"
cp org.custom.karabiner.plist ~/Library/LaunchAgents/

echo "Launching Kanata"
launchctl load ~/Library/LaunchAgents/com.kanata.service.plist

echo Done.
