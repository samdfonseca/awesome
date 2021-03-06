---------------------------------------------------
-- Licensed under the GNU General Public License v2
--  * (c) 2010, Adrian C. <anrxc@sysphere.org>
---------------------------------------------------

-- {{{ Grab environment
local tonumber = tonumber
local io = { popen = io.popen }
local setmetatable = setmetatable
local string = { match = string.match }
local helpers = require("vicious.helpers")
-- }}}


-- Volume: provides volume levels and state of requested ALSA mixers
-- vicious.widgets.volume
local volume = {}


-- {{{ Volume widget type
local function worker(format, warg)
    if not warg then return end

    local mixer_state = {
        ["on"]  = "♫", -- "",
        ["off"] = "♩"  -- "M"
    }

    -- Get mixer control contents
    local availablecards = tonumber(io.popen("aplay -l | grep card | wc -l"):read("*l"))
    local c = "0"
    for i=0,availablecards-1 do
        if io.popen("amixer -c " .. i .. " scontrols | grep Master | wc -l"):read("*l") == "1" then
            c = tostring(i)
            break
        end
    end
    local f = io.popen("amixer -M -c " .. c .. " get " .. helpers.shellquote(warg))
    local mixer = f:read("*all")
    f:close()

    -- Capture mixer control state:          [5%] ... ... [on]
    local volu, mute = string.match(mixer, "([%d]+)%%.*%[([%l]*)")
    -- Handle mixers without data
    if volu == nil then
       return {0, mixer_state["off"]}
    end

    -- Handle mixers without mute
    if mute == "" and volu == "0"
    -- Handle mixers that are muted
    or mute == "off" then
       mute = mixer_state["off"]
    else
       mute = mixer_state["on"]
    end

    return {tonumber(volu), mute}
end
-- }}}

return setmetatable(volume, { __call = function(_, ...) return worker(...) end })
