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

- **Username**: The Chaturbate username to monitor

### Optional Settings

- **Port**: Web interface port (default: 8099, used for Home Assistant ingress)
- **Output Location**: Choose where to save recordings:
  - `share` - Home Assistant share folder (default: `/share/chaturbate-dvr`)
  - `media` - Home Assistant media folder (`/media/chaturbate-dvr`)
  - `config` - Home Assistant config folder (`/config/chaturbate-dvr`)
  - `custom` - Custom path (requires custom_output_path)
- **Custom Output Path**: Custom directory path (only when output_location is set to 'custom')
- **Filename Pattern**: Pattern for naming files (supports Go template syntax)
- **Quality**: Recording quality (best, worst, 720p, 480p, 360p, 240p)
- **User Agent**: Custom user agent string
- **Cookies**: Cookie string for authentication
- **Proxy**: Proxy server URL
- **Log Level**: Logging verbosity (debug, info, warn, error)

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

1. Configure the add-on with your desired settings:
   - Set the username to monitor
   - Choose your preferred output location
   - Configure other options as needed
2. Start the add-on
3. Access the web interface through the Home Assistant add-on panel (ingress)
4. The add-on will automatically start recording when the monitored channel goes live

### Output Directory Options

- **Share Folder** (`/share/chaturbate-dvr`): Accessible via Home Assistant file editor and Samba shares
- **Media Folder** (`/media/chaturbate-dvr`): Integrated with Home Assistant media browser
- **Config Folder** (`/config/chaturbate-dvr`): Stored with Home Assistant configuration
- **Custom Path**: Specify any custom directory path (ensure proper permissions)

## Support

For issues and feature requests, please visit the [GitHub repository](https://github.com/teacat/chaturbate-dvr).

## License

This add-on is based on the [Chaturbate DVR](https://github.com/teacat/chaturbate-dvr) project, which is licensed under the MIT License.
