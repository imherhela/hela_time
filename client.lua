local display = false
local showing = false

local dayIndex = GetResourceKvpInt("clock_day") -- read from saved data
if dayIndex < 0 or dayIndex > 6 then
    dayIndex = GetClockDayOfWeek() -- fallback if missing
end

local lastHour = GetClockHours()

local days = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"}

-- Listen for NUI ready callback (optional but good practice)
RegisterNUICallback('ready', function()
    print("NUI is ready!")
    display = true
end)

-- Get Day Name Function
function GetDayName()
    return days[dayIndex + 1] or "Unknown"
end

-- Get In-Game Time Text
function GetInGameTimeText()
    local hour = GetClockHours()
    local minute = GetClockMinutes()

    -- Detect day rollover
    if hour < lastHour then -- passed midnight
        dayIndex = (dayIndex + 1) % 7
        SetResourceKvpInt("clock_day", dayIndex)
    end

    lastHour = hour

    local dayName = days[dayIndex + 1] or "Unknown"
    local period = hour < 12 and "AM" or "PM"
    local timeStr = string.format("%s - %02d:%02d %s", dayName, hour % 12 == 0 and 12 or hour % 12, minute, period)

    return timeStr, period
end

-- NUI Message Sender
function SendClock(timeStr, period, position)
    SendNUIMessage({
        type = "updateClock",
        time = timeStr,
        period = period,
        position = position
    })
end

-- Main Loop
CreateThread(function()
    SetNuiFocus(false, false)
    while not DoesEntityExist(PlayerPedId()) or not NetworkIsPlayerActive(PlayerId()) do
        Wait(500)
    end
    display = true
    while true do
        if display then

            if IsRadarHidden() then
                if showing then
                    SendNUIMessage({ type = "toggleClock", show = false })
                    showing = false
                end
            else
                if not showing then
                    SendNUIMessage({ type = "toggleClock", show = true })
                    showing = true
                end

                local timeStr, period = GetInGameTimeText()
                SendNUIMessage({
                    type = "updateClock",
                    time = timeStr,
                    period = period,
                    position = Config.Position
                })
            end
        end

        Wait(500)
    end
end)
