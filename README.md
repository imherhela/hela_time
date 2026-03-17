# hela_time

A lightweight in-game clock for your RedM server — showing the current day and time, right on screen.

## Features

- Displays the current **in-game day and time** in AM/PM format
- Refreshes automatically every **in-game minute**
- Automatically **hides with the radar** and reappears when it does
- **9 customizable positions** — place it wherever fits your HUD

## Installation

1. Drop the resource folder into your server's `resources` directory.
2. Add the following line to your `server.cfg`:
```
   ensure hela_time
```
3. Restart your server — the clock will appear at your configured position.

## Configuration

Open `config.lua` to set the clock's position on screen.
```lua
Config.Position = "bottom-left" -- default
```

**Available positions:**

|            | Left          | Center          | Right          |
|------------|---------------|-----------------|----------------|
| **Top**    | `top-left`    | `top-center`    | `top-right`    |
| **Middle** | `center-left` | `center`        | `center-right` |
| **Bottom** | `bottom-left` | `bottom-center` | `bottom-right` |

## How It Works

The script hooks into RedM's native time system and polls the current in-game time every minute, formatting it as `Day HH:MM AM/PM`. It also listens for radar visibility changes — if the radar is hidden (e.g. in cinematic mode), the clock hides with it.

## License

Free to use and modify for personal or server use. Made by ImHerHela.
