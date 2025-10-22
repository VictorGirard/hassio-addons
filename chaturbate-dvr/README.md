# Chaturbate DVR

Auto records Chaturbate streams when they go online!

## About

This add-on provides an automated way to record Chaturbate streams. It monitors specified channels and automatically starts recording when they go live.

## Features

- 🎥 Automatic stream recording
- 📁 Flexible output directory options (share, media, config, or custom path)
- 🏷️ Flexible filename patterns
- 🌐 Web interface for monitoring (via Home Assistant ingress)
- 🔧 Configurable quality settings
- 🍪 Cookie and User-Agent support
- 🌍 Proxy support
- 🔒 Secure access through Home Assistant authentication

## Installation

1. Add this repository to your Home Assistant instance
2. Install the "Chaturbate DVR" add-on
3. Configure the add-on with your desired settings
4. Start the add-on

## Configuration

### Required Settings

- **Username**: The Chaturbate username to monitor (optional, can be set via web interface)

### Optional Settings

- **Output Directory**: Directory where videos will be saved (default: `/usr/src/app/videos`)
- **Config Directory**: Directory for configuration files (default: `/usr/src/app/conf`)

### Important Notes

- **Videos Storage**: Videos are saved to `/usr/src/app/videos` inside the container, which is mapped to Home Assistant's `/share` folder
- **Configuration**: Configuration files are stored in `/usr/src/app/conf` inside the container, which is mapped to Home Assistant's `/config` folder
- **Web Interface**: Access the web interface through Home Assistant ingress to configure additional settings like quality, filename patterns, etc.

### Filename Pattern

The filename pattern supports Go template syntax with these variables:

- `{{.Username}}` - Channel username
- `{{.Year}}` - Year
- `{{.Month}}` - Month
- `{{.Day}}` - Day
- `{{.Hour}}` - Hour
- `{{.Minute}}` - Minute
- `{{.Second}}` - Second
- `{{.Sequence}}` - Sequence number

Example patterns:
- `{{.Username}}_{{.Year}}-{{.Month}}-{{.Day}}_{{.Hour}}-{{.Minute}}-{{.Second}}{{if .Sequence}}_{{.Sequence}}{{end}}`
- `video/{{.Username}}/{{.Year}}-{{.Month}}-{{.Day}}_{{.Hour}}-{{.Minute}}-{{.Second}}_{{.Sequence}}`

## Usage

1. Install and start the add-on
2. Access the web interface through the Home Assistant add-on panel (ingress)
3. Configure the application via the web interface:
   - Add usernames to monitor
   - Set recording quality and other preferences
   - Configure filename patterns
4. The add-on will automatically start recording when monitored channels go live

### File Storage

- **Videos**: Saved to `/usr/src/app/videos` (mapped to Home Assistant `/share` folder)
- **Configuration**: Stored in `/usr/src/app/conf` (mapped to Home Assistant `/config` folder)
- **Access**: Files are accessible via Home Assistant file editor and Samba shares

## Development

This add-on is based on the [yamiodymel/chaturbate-dvr](https://hub.docker.com/r/yamiodymel/chaturbate-dvr) Docker image, which provides the core chaturbate-dvr functionality. The add-on adds Home Assistant integration features including:

- Configuration management through Home Assistant
- Ingress support for web interface access
- Flexible output directory options
- Integration with Home Assistant's file system

## Support

For issues and feature requests, please visit the [GitHub repository](https://github.com/teacat/chaturbate-dvr).

## Credits

This add-on is based on the [yamiodymel/chaturbate-dvr](https://hub.docker.com/r/yamiodymel/chaturbate-dvr) Docker image, which is built from the [Chaturbate DVR](https://github.com/teacat/chaturbate-dvr) project, licensed under the MIT License.