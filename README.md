# OSWP - WordPress Auto Updater

OSWP is a powerful, lightweight shell-based tool designed to streamline WordPress maintenance for cPanel users. It leverages WP-CLI to efficiently update WordPress Core, themes, and plugins across multiple installations.

## Features

- **Comprehensive Scanning**: Automatically detects all WordPress installations in standard cPanel directories (`/home`, `/home1`, `/home2`, `/home3`)
- **Core Updates**: Keeps WordPress Core up to date
- **Plugin Management**: Updates all active plugins and removes potentially unsafe or unnecessary ones
- **Theme Optimization**: Cleans up inactive themes while preserving child themes
- **Permission Fixes**: Automatically corrects file and folder ownership and permissions
- **Force Reinstall**: Optional force reinstallation of all components when needed

## Requirements

- WP-CLI installed and accessible system-wide
- Bash shell (`/bin/bash`)
- Root or privileged user access
- curl (for installation)

## Installation

Install OSWP using the following command:

```bash
curl -fsSL https://raw.githubusercontent.com/onliveserver/oswp/main/install.sh | sudo bash
```

This will download and install the `oswp` command to `/usr/local/bin/oswp`.

## Usage

### Update WordPress for Specific Users

Update WordPress installations for one or more cPanel users:

```bash
sudo oswp -a username1 username2
```

Force reinstall all components:

```bash
sudo oswp -a username1 --force
```

### Update WordPress for All Users

Update all WordPress installations across all cPanel users:

```bash
sudo oswp --all
```

Force reinstall for all users:

```bash
sudo oswp --all --force
```

### Help

Display usage information:

```bash
oswp --help
```

## WordPress Path Detection

OSWP automatically scans for `wp-config.php` files in the following directories:

- `/home`
- `/home1`
- `/home2`
- `/home3`

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
