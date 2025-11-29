# Home-row-mod on macOS

## 1. Download and Install Karabiner

Install the [Karabiner VirtualHIDDevice driver](https://github.com/pqrs-org/Karabiner-DriverKit-VirtualHIDDevice/tree/main), as Kanata relies on it to interact with macOS. Download the installer and follow the instructions.

## 2. Download and Install Kanata

The best way to install Kanata is via Homebrew:

```sh
brew install kanata
```

## 3. Create a .kbd File for Your Kanata Layout

The `kbd` format is *much* more readable than the json format used by Karabiner

See [Kanata configuration file documentation](https://github.com/jtroo/kanata/blob/main/docs/config.adoc) and very commented [examples](https://github.com/jtroo/kanata/tree/main/cfg_samples) to create your own.

You can store the `.kbd` file anywhere. I keep mine in *~/configs/config-kanata/*.

> Tip: Add a key combo to reload the configuration after changes (command is lrld). This is especially useful when initially setting up the .kbd file, as it avoids restarting Kanata manually via the terminal.

## 4. Run Karabiner on Startup

Create `/Library/LaunchDaemons/org.pqrs.service.daemon.Karabiner-VirtualHIDDevice-Daemon.plist`:

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>org.pqrs.service.daemon.Karabiner-VirtualHIDDevice-Daemon</string>
    <key>KeepAlive</key>
    <true/>
    <key>ProcessType</key>
    <string>Interactive</string>
    <key>ProgramArguments</key>
    <array>
        <string>/Library/Application Support/org.pqrs/Karabiner-DriverKit-VirtualHIDDevice/Applications/Karabiner-VirtualHIDDevice-Daemon.app/Contents/MacOS/Karabiner-VirtualHIDDevice-Daemon</string>
    </array>
</dict>
</plist>
```

### Load and Run

```sh
sudo launchctl bootstrap system /Library/LaunchDaemons/org.pqrs.service.daemon.Karabiner-VirtualHIDDevice-Daemon.plist
```

## 5. Run Kanata on Startup

Create `/Library/LaunchDaemons/org.custom.kanata.plist`:

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>org.custom.kanata</string>

    <key>ProgramArguments</key>
    <array>
        <string>/opt/homebrew/bin/kanata</string>
        <string>--cfg</string>
        <string>/Users/andrey/configs/config-homerowmod/home-row-mod-macos.kbd</string>
        <string>--port</string>
        <string>10000</string>
    </array>

    <key>RunAtLoad</key>
    <true/>

    <key>KeepAlive</key>
    <true/>

    <key>StandardOutPath</key>
    <string>/Library/Logs/Kanata/kanata.out.log</string>

    <key>StandardErrorPath</key>
    <string>/Library/Logs/Kanata/kanata.err.log</string>
</dict>
</plist>
```

### Load and Run

```sh
sudo launchctl bootstrap system /Library/LaunchDaemons/org.custom.kanata.plist
```

### And check it

```sh
sudo launchctl list | grep kanata
```

### Kanata logs

```sh
sudo tail -f /Library/Logs/Kanata/kanata.*.log
```

### To unload kanata

```sh
sudo launchctl bootout system /Library/LaunchDaemons/org.custom.kanata.plist
```

Of course, to interrupt at any time, press **left control** + **space** + **escape** at their original positions.

***

## Related links

 - [Home Row Mods](https://github.com/dreamsofcode-io/home-row-mods)
 - [Kenkyo](https://github.com/argenkiwi/kenkyo)
 - [A guide to home row mods](https://precondition.github.io/home-row-mods)
 - Discussion on [Reddit](https://www.reddit.com/r/ErgoMechKeyboards/comments/1fojvif/is_anybody_running_kanata_on_macos_to_do_keyboard/)
 - [MacOS for KDE Users](https://matklad.github.io/2025/02/23/macos-for-kde-users.html) by [u/matklad](https://www.reddit.com/user/matklad/)
 - [Kmonad notes](https://github.com/kmonad/kmonad/blob/master/doc/installation.md#macos)
 - [Kanata discussion](https://github.com/jtroo/kanata/discussions/1537)
