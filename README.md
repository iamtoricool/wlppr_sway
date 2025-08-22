# Sway Wallpaper Utility (wlppr)

A simple bash utility for managing and cycling through wallpapers in the sway window manager.

## Description

This utility allows you to easily cycle through wallpapers stored in your `~/Pictures/Wallpapers` directory. It supports multiple image formats (JPG, JPEG, PNG, JXL) and maintains the current wallpaper choice across sway configuration reloads.

## Features

- Cycle through wallpapers with next/prev commands
- Persistent wallpaper selection across sway reloads
- Support for multiple image formats
- Simple keybinding integration
- Automatic wallpaper directory creation

## Prerequisites

- **sway window manager** (installed and running)
- **bash shell** (default on most Linux systems)
- Image files in supported formats: JPG, JPEG, PNG, JXL

## Installation

### Step 1: Clone the Repository

Clone this repository to your sway configuration directory:

```bash
# Create the parent directory if it doesn't exist
mkdir -p ~/.config/sway/modules/utils

# Clone the repository
cd ~/.config/sway/modules/utils
git clone https://github.com/iamtoricool/wlppr_sway.git wlppr
```

### Step 2: Make the Script Executable

```bash
chmod +x ~/.config/sway/modules/utils/wlppr/wlppr_util.sh
```

### Step 3: Create Wallpapers Directory

Create the directory where your wallpapers will be stored:

```bash
mkdir -p ~/Pictures/Wallpapers
```

### Step 4: Integrate with Sway Configuration

Add the following line to your main sway config file (`~/.config/sway/config`):

```
include ~/.config/sway/modules/utils/wlppr/config
```

This will include the wallpaper utility configuration and keybindings.

## Configuration

### Keybindings

The utility provides keybindings in a special "wlppr" mode:

- **Activate wallpaper mode**: `$mod+Alt+w`
- **Next wallpaper**: `n`
- **Previous wallpaper**: `p`
- **Exit mode**: `Return` or `Escape`

### Adding Wallpapers

1. Place your wallpaper images in `~/Pictures/Wallpapers/`
2. Supported formats: `.jpg`, `.jpeg`, `.png`, `.jxl`
3. The utility will automatically detect and sort them

### Customizing the Mode

You can modify the keybindings in the `config` file to suit your preferences.

## Usage

### Using Keybindings

1. Press `$mod+Alt+w` to enter wallpaper mode
2. Press `n` for next wallpaper or `p` for previous
3. Press `Return` or `Escape` to exit the mode

### Command Line Usage

You can also run the script directly:

```bash
# Go to next wallpaper
~/.config/sway/modules/utils/wlppr/wlppr_util.sh next

# Go to previous wallpaper
~/.config/sway/modules/utils/wlppr/wlppr_util.sh prev
```

## How It Works

- The utility scans `~/Pictures/Wallpapers/` for supported image files
- It maintains an index file (`wlppr.index`) to track the current wallpaper
- When you switch wallpapers, it updates both the sway configuration and applies the change immediately
- The current wallpaper is saved in `wlppr.conf` for persistence across sway reloads

## Troubleshooting

### No wallpapers found
- Ensure you have image files in `~/Pictures/Wallpapers/`
- Check that files have the correct extensions (.jpg, .jpeg, .png, .jxl)
- Verify file permissions allow reading

### Keybindings not working
- Ensure the config file is properly included in your main sway config
- Reload sway configuration after making changes: `$mod+Shift+c`
- Check for syntax errors in your sway config

### Script not executable
- Run: `chmod +x ~/.config/sway/modules/utils/wlppr/wlppr_util.sh`

### Permission issues
- Ensure the script and config files have appropriate read permissions
- Check that sway can access your wallpaper directory and files

## File Structure

```
~/.config/sway/modules/utils/wlppr/
├── wlppr_util.sh    # Main wallpaper utility script
├── wlppr.conf       # Current wallpaper configuration
├── wlppr.index      # Current wallpaper index
└── config           # Sway config snippet with keybindings

~/Pictures/Wallpapers/
└── your_wallpapers_here
```

## Contributing

Feel free to submit issues or pull requests to improve this utility.

## License

This utility is provided as-is for managing wallpapers in sway.