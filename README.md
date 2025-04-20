# Hela Time

## Overview
The **Hela Time** script adds an in-game clock to your RedM server, displaying the current day and time in AM/PM format. You can easily customize the position of the clock on the screen.

## Features
- Shows the current in-game day and time.
- Updates every minute.
- Hides when the radar is hidden.
- Customizable position on the screen.

## Configuration
In `config.lua`, you can set the clock’s position. Available options:
- `top-left`
- `top-center`
- `top-right`
- `center-left`
- `center`
- `center-right`
- `bottom-center`
- `bottom-right`

Example:
```lua
Config.Position = "bottom-left"  -- Places the clock at the bottom-left
```

## How It Works
- The script tracks the in-game time and updates the clock every minute.
- The clock will hide if the radar is hidden and show when the radar is visible.
- The position of the clock can be changed by editing the `Config.Position` setting.

## Installation
1. Place `client.lua` and `config.lua` in your resource folder.
2. Add the resource to your `server.cfg`:
   ```
   ensure hela_time
   ```
3. Restart your server, and the clock will appear based on your settings.

## License
Feel free to use and modify this script for your server.
