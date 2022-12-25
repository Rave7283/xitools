local Defaults = require('tgt-settings')
local Settings = require('settings')
local Bit = require('bit')
local Imgui = require('imgui')
local Packets = require('lin.packets')

---@class Debuffs
---@field dia number
---@field bio number
---@field para number
---@field slow number
---@field grav number
---@field blind number
---@field silence number
---@field sleep number
---@field bind number
---@field stun number
---@field virus number
---@field curse number
---@field poison number
---@field shock number
---@field rasp number
---@field choke number
---@field frost number
---@field burn number
---@field drown number

---@alias TrackedEnemies { [number]: Debuffs }

---@class TgtSettings
---@field position_x integer
---@field position_y integer

---@class TgtModule
---@field config TgtSettings
---@field debuffs TrackedEnemies

local Colors = {
    White          = { 1.00, 1.00, 1.00, 1.0 },
    Yellow         = { 1.00, 1.00, 0.00, 1.0 },
    Orange         = { 1.00, 0.64, 0.00, 1.0 },
    Red            = { 0.95, 0.20, 0.20, 1.0 },
    HpBar          = { 0.83, 0.33, 0.28, 1.0 },

    StatusGrey     = { 1.00, 1.00, 1.00, 0.5 },
    StatusWhite    = { 0.98, 0.92, 0.84, 1.0 },
    StatusBlack    = { 0.60, 0.20, 0.80, 1.0 },
    StatusYellow   = { 0.80, 0.80, 0.80, 1.0 },
    StatusBrown    = { 1.00, 0.96, 0.56, 1.0 },
    StatusGreen    = { 0.60, 0.80, 0.20, 1.0 },
    StatusBlue     = { 0.28, 0.46, 1.00, 1.0 },
    StatusRed      = { 0.80, 0.22, 0.00, 1.0 },
    StatusCyan     = { 0.59, 0.80, 0.80, 1.0 },

    FfxiGreyBg     = { 0.08, 0.08, 0.08, 0.8 },
    FfxiGreyBorder = { 0.69, 0.68, 0.78, 1.0 },
    FfxiAmber      = { 0.81, 0.81, 0.50, 1.0 },
}

---@type TgtModule
local Module = {
    config = Settings.load(Defaults),
    debuffs = { },
    windowName = 'Tgt',
    windowSize = { 277, -1 },
    windowFlags = Bit.bor(ImGuiWindowFlags_NoDecoration),
    windowPadding = { 10, 10 },
    windowBg = Colors.FfxiGreyBg,
    windowBgBorder = Colors.FfxiGreyBorder,
    windowBgBorderShadow = { 1.0, 0.0, 0.0, 1.0 },
    isWindowOpen = { true, },
    isLoaded = false,
}

-- The state we're operating on is the expiry time of the statuses
local DefaultDebuffs = {
    -- standard fare
    dia = 0,
    bio = 0,
    para = 0,
    slow = 0,
    grav = 0,
    blind = 0,
    -- utility
    silence = 0,
    sleep = 0,
    bind = 0,
    stun = 0,
    -- misc
    virus = 0,
    curse = 0,
    -- dots
    poison = 0,
    shock = 0,
    rasp = 0,
    choke = 0,
    frost = 0,
    burn = 0,
    drown = 0,
}

---@param object table
---@return table
local function deepCopy(object)
    local lookup_table = {}
    local function _copy(obj)
        if type(obj) ~= "table" then
            return obj
        elseif lookup_table[obj] then
            return lookup_table[obj]
        end
        local new_table = {}
        lookup_table[obj] = new_table
        for index, value in pairs(obj) do
            new_table[_copy(index)] = _copy(value)
        end
        return setmetatable(new_table, getmetatable(obj))
    end
    return _copy(object)
end

---@param debuffs TrackedEnemies
---@param action any
local function HandleAction(debuffs, action)
    local now = os.time()

    for _, target in pairs(action.targets) do
        for _, ability in pairs(target.actions) do
            if action.category == 4 then
                -- Set up our state
                local spell = action.param
                local message = ability.message
                debuffs[target.id] = debuffs[target.id] or deepCopy(DefaultDebuffs)

                -- Bio and Dia
                if message == 2 or message == 264 then
                    local expiry = 0

                    if spell == 23 or spell == 33 or spell == 230 then
                        expiry = now + 60
                    elseif spell == 24 or spell == 231 then
                        expiry = now + 120
                    elseif spell == 25 or spell == 232 then
                        expiry = now + 150
                    else
                        -- something went wrong
                        expiry = nil
                    end

                    if spell == 23 or spell == 24 or spell == 25 or spell == 33 then
                        debuffs[target.id].dia = expiry
                        debuffs[target.id].bio = 0
                    elseif spell == 230 or spell == 231 or spell == 232 then
                        debuffs[target.id].dia = 0
                        debuffs[target.id].bio = expiry
                    end
                -- Regular debuffs
                elseif message == 236 or message == 277 then
                    if spell == 58 or spell == 80 then -- para/para2
                        debuffs[target.id].para = now + 120
                    elseif spell == 56 or spell == 79 then -- slow/slow2
                        debuffs[target.id].slow = now + 180
                    elseif spell == 216 then -- gravity
                        debuffs[target.id].grav = now + 120
                    elseif spell == 254 or spell == 276 then -- blind/blind2
                        debuffs[target.id].blind = now + 180
                    elseif spell == 59 or spell == 359 then -- silence/ga
                        debuffs[target.id].silence = now + 120
                    elseif spell == 253 or spell == 259 or spell == 273 or spell == 274 then -- sleep/2/ga/2
                        debuffs[target.id].sleep = now + 90
                    elseif spell == 258 or spell == 362 then -- bind
                        debuffs[target.id].bind = now + 60
                    elseif spell == 252 then -- stun
                        debuffs[target.id].stun = now + 5
                    elseif spell <= 229 and spell >= 220 then -- poison/2
                        debuffs[target.id].poison = now + 120
                    end
                -- Elemental debuffs
                elseif message == 237 or message == 278 then
                    if spell == 239 then -- shock
                        debuffs[target.id].shock = now + 120
                    elseif spell == 238 then -- rasp
                        debuffs[target.id].rasp = now + 120
                    elseif spell == 237 then -- choke
                        debuffs[target.id].choke = now + 120
                    elseif spell == 236 then -- frost
                        debuffs[target.id].frost = now + 120
                    elseif spell == 235 then -- burn
                        debuffs[target.id].burn = now + 120
                    elseif spell == 240 then -- drown
                        debuffs[target.id].drown = now + 120
                    end
                end
            end
        end
    end
end

---@param debuffs TrackedEnemies
---@param basic any
local function HandleBasic(debuffs, basic)
    -- if we're tracking a mob that dies, reset its status
    if basic.message == 6 and debuffs[basic.target] then
        debuffs[basic.target] = nil
    elseif basic.message == 206 then
        if debuffs[basic.target] == nil then
            return
        end

        if basic.param == 2 or basic.param == 19 then
            debuffs[basic.target].sleep = 0
        elseif basic.param == 3 or basic.param == 540 then
            debuffs[basic.target].poison = 0
        elseif basic.param == 4 or basic.param == 566 then
            debuffs[basic.target].para = 0
        elseif basic.param == 5 then
            debuffs[basic.target].blind = 0
        elseif basic.param == 6 then
            debuffs[basic.target].silence = 0
        elseif basic.param == 8 then
            debuffs[basic.target].virus = 0
        elseif basic.param == 9 or basic.param == 20 then
            debuffs[basic.target].curse = 0
        elseif basic.param == 10 then
            debuffs[basic.target].stun = 0
        elseif basic.param == 11 then
            debuffs[basic.target].bind = 0
        elseif basic.param == 12 or basic.param == 567 then
            debuffs[basic.target].grav = 0
        elseif basic.param == 13 or basic.param == 565 then
            debuffs[basic.target].slow = 0
        elseif basic.param == 128 then
            debuffs[basic.target].burn = 0
        elseif basic.param == 129 then
            debuffs[basic.target].frost = 0
        elseif basic.param == 130 then
            debuffs[basic.target].choke = 0
        elseif basic.param == 131 then
            debuffs[basic.target].rasp = 0
        elseif basic.param == 132 then
            debuffs[basic.target].shock = 0
        elseif basic.param == 133 then
            debuffs[basic.target].drown = 0
        elseif basic.param == 134 then
            debuffs[basic.target].dia = 0
        elseif basic.param == 135 then
            debuffs[basic.target].bio = 0
        end
    end
end

---@param s TgtSettings?
function Module.UpdateSettings(s)
    if (s ~= nil) then
        Module.config = s
    end

    Settings.save()
end

---@param name     string
---@param distance number
local function DrawHeader(name, distance)
    Imgui.Text(name)

    local dist = string.format('%.1fm', distance)
    local width = Imgui.CalcTextSize(dist) + Module.windowPadding[1]

    Imgui.SameLine()
    Imgui.SetCursorPosX(Module.windowSize[1] - width)
    Imgui.Text(dist)
end

---@param title   string
---@param cur     integer
---@param max     integer
---@param overlay string?
local function DrawBar(title, cur, max, overlay)
    local fraction = cur / max

    Imgui.AlignTextToFramePadding()
    Imgui.Text(title)
    Imgui.SameLine()
    Imgui.ProgressBar(fraction, { 200, 15 }, overlay)
end

---@param hpPercent integer
local function DrawHp(hpPercent)
    local title = string.format('HP %3i%%%%', hpPercent)
    local textColor = Colors.White
    local barColor = Colors.HpBar

    if hpPercent > 0.75 then
        textColor = Colors.White
    elseif hpPercent > 0.50 then
        textColor = Colors.Yellow
    elseif hpPercent > 0.25 then
        textColor = Colors.Orange
    elseif hpPercent >= 0.00 then
        textColor = Colors.Red
    end

    Imgui.PushStyleColor(ImGuiCol_Text, textColor)
    Imgui.PushStyleColor(ImGuiCol_PlotHistogram, barColor)
    DrawBar(title, hpPercent, 100, '')
    Imgui.PopStyleColor(2)
end

local function DrawSeparator()
    Imgui.PopStyleVar()
    Imgui.Text('')
    Imgui.SameLine()
    Imgui.PushStyleVar(ImGuiStyleVar_ItemSpacing, { 0, 0 })
end

local function DrawStatusEntry(text, isActive, color)
    if isActive then
        Imgui.PushStyleColor(ImGuiCol_Text, color)
    else
        Imgui.PushStyleColor(ImGuiCol_Text, Colors.StatusGrey)
    end

    Imgui.Text(text)
    Imgui.SameLine()
    Imgui.PopStyleColor()
end

---@param debuffs Debuffs
local function DrawStatus(debuffs)
    local now = os.time()
    Imgui.PushStyleVar(ImGuiStyleVar_ItemSpacing, { 0, 0 })
    DrawStatusEntry('D',  now < debuffs.dia, Colors.StatusWhite)
    DrawStatusEntry('B',  now < debuffs.bio, Colors.StatusBlack)
    DrawSeparator()
    DrawSeparator()
    DrawStatusEntry('P',  now < debuffs.para, Colors.StatusWhite)
    DrawStatusEntry('S',  now < debuffs.slow, Colors.StatusWhite)
    DrawStatusEntry('G',  now < debuffs.grav, Colors.StatusBlack)
    DrawStatusEntry('B',  now < debuffs.blind, Colors.StatusBlack)
    DrawSeparator()
    DrawSeparator()
    DrawStatusEntry('Si', now < debuffs.silence, Colors.StatusWhite)
    DrawSeparator()
    DrawStatusEntry('Sl', now < debuffs.sleep, Colors.StatusBlack)
    DrawSeparator()
    DrawStatusEntry('Bi', now < debuffs.bind, Colors.StatusBlack)
    DrawSeparator()
    DrawStatusEntry('Po', now < debuffs.poison, Colors.StatusBlack)
    DrawSeparator()
    DrawSeparator()
    DrawStatusEntry('S',  now < debuffs.shock, Colors.StatusYellow)
    DrawStatusEntry('R',  now < debuffs.rasp, Colors.StatusBrown)
    DrawStatusEntry('C',  now < debuffs.choke, Colors.StatusGreen)
    DrawStatusEntry('F',  now < debuffs.frost, Colors.StatusCyan)
    DrawStatusEntry('B',  now < debuffs.burn, Colors.StatusRed)
    DrawStatusEntry('D',  now < debuffs.drown, Colors.StatusBlue)
    Imgui.PopStyleVar()
end

---@param entity Entity
local function DrawTgt(entity)
    Imgui.SetNextWindowSize(Module.windowSize, ImGuiCond_Always)
    Imgui.SetNextWindowPos({ Module.config.position_x, Module.config.position_y }, ImGuiCond_FirstUseEver)
    Imgui.PushStyleColor(ImGuiCol_WindowBg, Module.windowBg)
    Imgui.PushStyleColor(ImGuiCol_Border, Module.windowBgBorder)
    Imgui.PushStyleColor(ImGuiCol_BorderShadow, Module.windowBgBorderShadow)
    Imgui.PushStyleVar(ImGuiStyleVar_WindowPadding, Module.windowPadding)

    if Imgui.Begin(Module.windowName, Module.isWindowOpen, Module.windowFlags) then
        Imgui.PopStyleColor(3)
        Imgui.PushStyleColor(ImGuiCol_Text, Colors.White)
        Imgui.PushStyleVar(ImGuiStyleVar_FramePadding, { 0, 0 })

        DrawHeader(entity.Name, math.sqrt(entity.Distance))
        DrawHp(entity.HPPercent)
        DrawStatus(Module.debuffs[entity.ServerId] or DefaultDebuffs)

        Imgui.PopStyleVar()
        Imgui.End()
    else
        Imgui.PopStyleColor(3)
    end

    Imgui.PopStyleVar()
end

function Module.OnPresent()
    local targetId = AshitaCore:GetMemoryManager():GetTarget():GetTargetIndex(0)

    -- don't bother drawing if we have no target
    if targetId == 0 then
        return
    end

    local entity = GetEntity(targetId)
    DrawTgt(entity)
end

---@param e PacketInEventArgs
function Module.OnPacket(e)
    -- don't track anything if we're not displaying it
    if not Module.config.status then return end

    -- clear state on zone changes
    if e.id == 0x0A then
        Module.debuffs = { }
    elseif e.id == 0x0028 then
        HandleAction(Module.debuffs, Packets.ParseAction(e.data_modified_raw))
    elseif e.id == 0x0029 then
        HandleBasic(Module.debuffs, Packets.ParseBasic(e.data))
    end

    e.blocked = true
end

function Module.OnLoad()
end

function Module.OnUnload()
    Module.UpdateSettings()
end

---@param e CommandEventArgs
function Module.OnCommand(e)
    local args = e.command:args()
    if #args == 0 or args[1] ~= '/tgt' then
        return
    end

    e.blocked = true
end

Settings.register('settings', 'settings_update', Module.UpdateSettings)
return Module
